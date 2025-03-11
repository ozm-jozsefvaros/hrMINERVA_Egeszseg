Option Compare Database
Dim levélcímek As Recordset  ' Dictionary to store NexonID -> Email mappings
Public Const strLekérd As String = "lkKövetkezõHaviBeutalók" 'Innen származnak az adatok
Public Const strTábla As String = "tTMPKövetkezõHaviBeutalók" 'Átmeneti tárolás ide
Public Const strReportName As String = "jelKövetkezõHaviBeutalók" ' A jelentés neve
Public Const strElkészültBeutalók As String = "tElkészültBeutalók" ' A kész beutalók táblája
Public Const strElküldöttBeutalók As String = "tElküldöttBeutalók"
Public Const strHáttértár As String = "L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Háttértárak\Ellenõrzés_0.9.6_háttér_.mdb.accdb" 'Ebben az adatbázisban vannak a táblák
Public Const strPDFPath As String = "L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Szakterületi\Beutalók\" ' Ide kerülnek a kész PDF állományok
Public Const strAláírtPDF As String = "L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Szakterületi\AláírtBeutalók\" ' Ide kerülnek a kész PDF állományok
Public Const strElküldöttBeutalókHelye As String = "L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Szakterületi\ElküldöttBeutalók"
Sub BeutalóPDF()
fvbe ("BeutalóPDF")
    Dim db As DAO.Database, _
        háttértár As DAO.Database
    Dim rs As DAO.Recordset, _
        rsElkészültBeutalók As Recordset
    'Dim strReportName As String
    'Dim strPDFPath As String
    Dim strPDFName As String
    Dim strFilter As String
    Dim strLkDEL As String, _
        strLkINTO As String ', _
        strTábla As String, _
        strLekérd As String, _
        strElkészültBeutalók As String, _
        strHáttértár As String
    Dim riport As Report
    Dim törölve As Boolean, _
        vanetábla As Boolean
    Dim dMost As Date
    Dim strMost As String
    
    törölve = False

    Set háttértár = OpenDatabase(strHáttértár)
    
    'Az ideigelens táblában, ha létezik, töröljük az adatokat
    On Error Resume Next
        vanetábla = Len(háttértár.TableDefs(strTábla).Connect) > 0
    On Error GoTo 0

    If vanetábla Then
        strLkINTO = " SELECT [" & strLekérd & "].*" & _
                    " INTO [" & strTábla & "] IN """ & strHáttértár & """" & _
                    "  FROM [" & strLekérd & "] ;"
        háttértár.Execute strLkINTO ' létrehozzuk, és beleírjuk az adatokat,
        háttértár.Execute "CREATE UNIQUE INDEX taj" & _
                          " ON [" & strTábla & "] IN """ & strHáttértár & """" & _
                          "   ([TAJ szám]);" 'majd beállítjuk az indexet TODO: mi legyen, ha hibázik az index beállítása
        Set háttértár = Nothing
    Else ' egyébként pedig beleírjuk a már meglévõ üres táblába az adatokat
        strLkDEL = "DELETE [" & strTábla & "].*" & _
                "  FROM [" & strTábla & "] IN """ & strHáttértár & """;"
        CurrentDb.Execute strLkDEL
        strLkINTO = " INSERT INTO [" & strTábla & "] IN """ & strHáttértár & """" & _
                    " SELECT [" & strLekérd & "].*" & _
                    "  FROM [" & strLekérd & "] ;"
        CurrentDb.Execute strLkINTO
    End If
    ' Open the query that contains the list of people
    Set db = CurrentDb()
    Set rs = db.OpenRecordset(strTábla, dbOpenSnapshot)
    Set rsElkészültBeutalók = db.OpenRecordset(strElkészültBeutalók, dbOpenDynaset)
    ' Check if the query contains records
    If rs.EOF Then
        MsgBox "Nincs rekord " & névelõvel(strTábla) & " nevû táblában!?", vbExclamation, "Nincs adat!?!?"
        Exit Sub
    End If
    
    ' Loop through each record in the query
    Do While Not rs.EOF
        'dMost = Now()
        'strMost = CsakSzámJegy(dMost)
        'a fájl nevének az elõállítása
        strPDFName = strPDFPath & rs.Fields("Dolgozó teljes neve") & "##" & dtÁtal(Nz(rs.Fields("Orvosi vizsgálat következõ idõpontja"), 0)) & "##" & rs.Fields("NexonID") & "##" & ".pdf"
        
        ' Apply filter to the report to show only the current person's data
        strFilter = "[TAJ szám] = """ & rs.Fields("TAJ szám") & """"
        
        ' Export the report with the filter applied
        DoCmd.OpenReport strReportName, acViewPreview, , strFilter
        DoCmd.OutputTo acOutputReport, strReportName, acFormatPDF, strPDFName
        DoCmd.Close acReport, strReportName, acSaveNo 'Ha nem zárjuk le, nem engedi a szûrõt alkalmazni...
        
        With rsElkészültBeutalók
            .AddNew
            .Fields("NexonID") = rs.Fields("NexonID")
            .Fields("Idõpont") = dtÁtal(Nz(rs.Fields("Orvosi vizsgálat következõ idõpontja"), 0))
            .Fields("azBeutalóTípus") = 1
            .Fields("MunkakörKÓD") = rs.Fields("MunkakörKÓD")
            'TODO: hibakezelés arra az esetre, ha az UPDATE nem sikerülne
            .Update
        End With
        
        ' Move to the next record
        rs.MoveNext
    Loop
    
    ' Cleanup
    rs.Close
    Set rs = Nothing
    Set db = Nothing


    MsgBox "Reports have been successfully saved as PDFs!", vbInformation, "Success"
fvki
Exit Sub
Hiba:
'TODO: hibakezelésbe átadandó változók!!!
    MsgBox Hiba(Err)
End Sub

Sub beutalókKiküldése()
fvbe ("beutalókKiküldése")
    Dim db As DAO.Database
    Dim cél As Recordset
    Dim fso As Object ' Fájlrendszer objektum
    Dim tFájlok As Variant
    Dim n As Long
    Dim elküldve As Date
    Dim címzett(1) As String, _
        aláírtbeutalóhelye(1) As String, _
        Üzenet As String, _
        üzenetaz As String
    Dim cc As Variant, _
        bcc As Variant
    
    Set db = CurrentDb
    Set cél = db.OpenRecordset(strElküldöttBeutalók)
    tFájlok = FF_ListFilesInDir(strAláírtPDF, "pdf")
    
    If tFájlok(0) = "*" Then
        MsgBox "A könyvtár üres! (" & strAláírtPDF & ")"
        Exit Sub
    End If
    For n = LBound(tFájlok, 1) To UBound(tFájlok, 1)
        címzett(0) = "olah.zoltan3@bfkh.gov.hu" 'LevélcímNexonIDalapján(ffsplit(tFájlok(n), "##", 3))
        címzett(1) = "branyi.balazs@bfkh.gov.hu"
        aláírtbeutalóhelye(0) = strAláírtPDF & tFájlok(n)
        Üzenet = "" & LevélcímNexonIDalapján(ffsplit(tFájlok(n), "##", 3))
        tárgy = "Beutaló"
        Groupwise_Mail myRecipients:=címzett(), _
                       myAttachments:=aláírtbeutalóhelye(), _
                       mySubject:=tárgy, _
                       myBodytext:=Üzenet, _
                       ClientMessageId:=üzenetaz, _
                       DeliveredDate:=elküldve ',_
                       'ccRecipients:=cc, _
                       'bccRecipients:=bcc
        If üzenetaz <> vbNullString Then
            '1. - Feljegyezzük az eseményt
            With cél
                .AddNew
                    .Fields("NexonID") = ffsplit(tFájlok(n), "##", 3)
                    .Fields("Dátum") = dtDaraboló(ffsplit(tFájlok(n), "##", 2))
                    .Fields("ClientMessageId") = üzenetaz
                    .Fields("DeliveredDate") = elküldve
                .Update
            End With
            '2. - Az elküldött fájlt áthelyezzük az elküldöttek közé
                Set fso = CreateObject("Scripting.FileSystemObject")
                ' Áthelyezzük, ha létezik
                If fso.FileExists(aláírtbeutalóhelye) Then
                    fso.MoveFile aláírtbeutalóhelye, strElküldöttBeutalókHelye
                Else
                    logba sFN, "Nem található " & névelõvel(aláírtbeutalóhelye) & ", ezért nem lehetett áthelyezni!" & vbNewLine & "Ez különös, mert a beutaló kiküldése sikeres volt...", 0
                End If
                
                Set fso = Nothing
        Else 'Ha nem sikerült a beutalót elküldeni
            logba sFN, névelõvel(aláírtbeutalóhelye) & " nevû beutalót nem sikerült elküldeni! Részeletek:" & vbNewLine & _
                                            "Címzett:" & címzett(0) & vbNewLine & _
                                            "Dátum:" & Dátum, 0
        End If
        Debug.Print ClientMessageId, DeliveredDate
        If n > 10 Then Exit Sub
    Next n
fvki
End Sub
Function dtDaraboló(idõ As String) As Date
    If Len(idõ) < 14 Then Exit Function
    dtDaraboló = CDate( _
        Mid(idõ, 1, 4) & "-" & Mid(idõ, 5, 2) & "-" & Mid(idõ, 7, 2) & " " & _
        Mid(idõ, 9, 2) & ":" & Mid(idõ, 11, 2) & ":" & Mid(idõ, 13, 2))

End Function
Function AddDim(arr As Variant, newLBound As Long, NewUBound As Long) As Variant
    Dim i As Long
    Dim arrOut() As Variant
    ReDim arrOut(LBound(arr) To UBound(arr), newLBound To NewUBound)
    For i = LBound(arr) To UBound(arr)
        arrOut(i, newLBound) = arr(i)
    Next i
    AddDim = arrOut
End Function
Function isInitialised(ByRef a() As Variant) As Boolean
    On Error Resume Next
    isInitialised = IsNumeric(UBound(a))
    On Error GoTo 0
End Function
Sub levélcímekBetöltése()
    Dim db As DAO.Database

    ' Open the table
    Set db = CurrentDb
    Set levélcímek = db.OpenRecordset("lkNexonID_Email", dbOpenSnapshot)

End Sub

' Function to get Email by NexonID
Function LevélcímNexonIDalapján(NexonID As Variant) As String
    If levélcímek Is Nothing Then
        levélcímekBetöltése ' Rekordok betöltése TODO: a találatok elõszûkítése?
    End If
    With levélcímek
        If Not .EOF And .BOF Then
            .MoveFirst
        End If
        .FindFirst "[NexonID]=" & NexonID
        If Not .NoMatch Then
            LevélcímNexonIDalapján = .Fields("Email")
        Else
            LevélcímNexonIDalapján = "Not Found"
        End If
    End With
End Function