Option Compare Database
Dim lev�lc�mek As Recordset  ' Dictionary to store NexonID -> Email mappings
Public Const strLek�rd As String = "lkK�vetkez�HaviBeutal�k" 'Innen sz�rmaznak az adatok
Public Const strT�bla As String = "tTMPK�vetkez�HaviBeutal�k" '�tmeneti t�rol�s ide
Public Const strReportName As String = "jelK�vetkez�HaviBeutal�k" ' A jelent�s neve
Public Const strElk�sz�ltBeutal�k As String = "tElk�sz�ltBeutal�k" ' A k�sz beutal�k t�bl�ja
Public Const strElk�ld�ttBeutal�k As String = "tElk�ld�ttBeutal�k"
Public Const strH�tt�rt�r As String = "L:\Ugyintezok\Adatszolg�ltat�k\Adatb�zisok\H�tt�rt�rak\Ellen�rz�s_0.9.6_h�tt�r_.mdb.accdb" 'Ebben az adatb�zisban vannak a t�bl�k
Public Const strPDFPath As String = "L:\Ugyintezok\Adatszolg�ltat�k\Adatb�zisok\Szakter�leti\Beutal�k\" ' Ide ker�lnek a k�sz PDF �llom�nyok
Public Const strAl��rtPDF As String = "L:\Ugyintezok\Adatszolg�ltat�k\Adatb�zisok\Szakter�leti\Al��rtBeutal�k\" ' Ide ker�lnek a k�sz PDF �llom�nyok
Public Const strElk�ld�ttBeutal�kHelye As String = "L:\Ugyintezok\Adatszolg�ltat�k\Adatb�zisok\Szakter�leti\Elk�ld�ttBeutal�k"
Sub Beutal�PDF()
fvbe ("Beutal�PDF")
    Dim db As DAO.Database, _
        h�tt�rt�r As DAO.Database
    Dim rs As DAO.Recordset, _
        rsElk�sz�ltBeutal�k As Recordset
    'Dim strReportName As String
    'Dim strPDFPath As String
    Dim strPDFName As String
    Dim strFilter As String
    Dim strLkDEL As String, _
        strLkINTO As String ', _
        strT�bla As String, _
        strLek�rd As String, _
        strElk�sz�ltBeutal�k As String, _
        strH�tt�rt�r As String
    Dim riport As Report
    Dim t�r�lve As Boolean, _
        vanet�bla As Boolean
    Dim dMost As Date
    Dim strMost As String
    
    t�r�lve = False

    Set h�tt�rt�r = OpenDatabase(strH�tt�rt�r)
    
    'Az ideigelens t�bl�ban, ha l�tezik, t�r�lj�k az adatokat
    On Error Resume Next
        vanet�bla = Len(h�tt�rt�r.TableDefs(strT�bla).Connect) > 0
    On Error GoTo 0

    If vanet�bla Then
        strLkINTO = " SELECT [" & strLek�rd & "].*" & _
                    " INTO [" & strT�bla & "] IN """ & strH�tt�rt�r & """" & _
                    "  FROM [" & strLek�rd & "] ;"
        h�tt�rt�r.Execute strLkINTO ' l�trehozzuk, �s bele�rjuk az adatokat,
        h�tt�rt�r.Execute "CREATE UNIQUE INDEX taj" & _
                          " ON [" & strT�bla & "] IN """ & strH�tt�rt�r & """" & _
                          "   ([TAJ sz�m]);" 'majd be�ll�tjuk az indexet TODO: mi legyen, ha hib�zik az index be�ll�t�sa
        Set h�tt�rt�r = Nothing
    Else ' egy�bk�nt pedig bele�rjuk a m�r megl�v� �res t�bl�ba az adatokat
        strLkDEL = "DELETE [" & strT�bla & "].*" & _
                "  FROM [" & strT�bla & "] IN """ & strH�tt�rt�r & """;"
        CurrentDb.Execute strLkDEL
        strLkINTO = " INSERT INTO [" & strT�bla & "] IN """ & strH�tt�rt�r & """" & _
                    " SELECT [" & strLek�rd & "].*" & _
                    "  FROM [" & strLek�rd & "] ;"
        CurrentDb.Execute strLkINTO
    End If
    ' Open the query that contains the list of people
    Set db = CurrentDb()
    Set rs = db.OpenRecordset(strT�bla, dbOpenSnapshot)
    Set rsElk�sz�ltBeutal�k = db.OpenRecordset(strElk�sz�ltBeutal�k, dbOpenDynaset)
    ' Check if the query contains records
    If rs.EOF Then
        MsgBox "Nincs rekord " & n�vel�vel(strT�bla) & " nev� t�bl�ban!?", vbExclamation, "Nincs adat!?!?"
        Exit Sub
    End If
    
    ' Loop through each record in the query
    Do While Not rs.EOF
        'dMost = Now()
        'strMost = CsakSz�mJegy(dMost)
        'a f�jl nev�nek az el��ll�t�sa
        strPDFName = strPDFPath & rs.Fields("Dolgoz� teljes neve") & "##" & dt�tal(Nz(rs.Fields("Orvosi vizsg�lat k�vetkez� id�pontja"), 0)) & "##" & rs.Fields("NexonID") & "##" & ".pdf"
        
        ' Apply filter to the report to show only the current person's data
        strFilter = "[TAJ sz�m] = """ & rs.Fields("TAJ sz�m") & """"
        
        ' Export the report with the filter applied
        DoCmd.OpenReport strReportName, acViewPreview, , strFilter
        DoCmd.OutputTo acOutputReport, strReportName, acFormatPDF, strPDFName
        DoCmd.Close acReport, strReportName, acSaveNo 'Ha nem z�rjuk le, nem engedi a sz�r�t alkalmazni...
        
        With rsElk�sz�ltBeutal�k
            .AddNew
            .Fields("NexonID") = rs.Fields("NexonID")
            .Fields("Id�pont") = dt�tal(Nz(rs.Fields("Orvosi vizsg�lat k�vetkez� id�pontja"), 0))
            .Fields("azBeutal�T�pus") = 1
            .Fields("Munkak�rK�D") = rs.Fields("Munkak�rK�D")
            'TODO: hibakezel�s arra az esetre, ha az UPDATE nem siker�lne
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
'TODO: hibakezel�sbe �tadand� v�ltoz�k!!!
    MsgBox Hiba(Err)
End Sub

Sub beutal�kKik�ld�se()
fvbe ("beutal�kKik�ld�se")
    Dim db As DAO.Database
    Dim c�l As Recordset
    Dim fso As Object ' F�jlrendszer objektum
    Dim tF�jlok As Variant
    Dim n As Long
    Dim elk�ldve As Date
    Dim c�mzett(1) As String, _
        al��rtbeutal�helye(1) As String, _
        �zenet As String, _
        �zenetaz As String
    Dim cc As Variant, _
        bcc As Variant
    
    Set db = CurrentDb
    Set c�l = db.OpenRecordset(strElk�ld�ttBeutal�k)
    tF�jlok = FF_ListFilesInDir(strAl��rtPDF, "pdf")
    
    If tF�jlok(0) = "*" Then
        MsgBox "A k�nyvt�r �res! (" & strAl��rtPDF & ")"
        Exit Sub
    End If
    For n = LBound(tF�jlok, 1) To UBound(tF�jlok, 1)
        c�mzett(0) = "olah.zoltan3@bfkh.gov.hu" 'Lev�lc�mNexonIDalapj�n(ffsplit(tF�jlok(n), "##", 3))
        c�mzett(1) = "branyi.balazs@bfkh.gov.hu"
        al��rtbeutal�helye(0) = strAl��rtPDF & tF�jlok(n)
        �zenet = "" & Lev�lc�mNexonIDalapj�n(ffsplit(tF�jlok(n), "##", 3))
        t�rgy = "Beutal�"
        Groupwise_Mail myRecipients:=c�mzett(), _
                       myAttachments:=al��rtbeutal�helye(), _
                       mySubject:=t�rgy, _
                       myBodytext:=�zenet, _
                       ClientMessageId:=�zenetaz, _
                       DeliveredDate:=elk�ldve ',_
                       'ccRecipients:=cc, _
                       'bccRecipients:=bcc
        If �zenetaz <> vbNullString Then
            '1. - Feljegyezz�k az esem�nyt
            With c�l
                .AddNew
                    .Fields("NexonID") = ffsplit(tF�jlok(n), "##", 3)
                    .Fields("D�tum") = dtDarabol�(ffsplit(tF�jlok(n), "##", 2))
                    .Fields("ClientMessageId") = �zenetaz
                    .Fields("DeliveredDate") = elk�ldve
                .Update
            End With
            '2. - Az elk�ld�tt f�jlt �thelyezz�k az elk�ld�ttek k�z�
                Set fso = CreateObject("Scripting.FileSystemObject")
                ' �thelyezz�k, ha l�tezik
                If fso.FileExists(al��rtbeutal�helye) Then
                    fso.MoveFile al��rtbeutal�helye, strElk�ld�ttBeutal�kHelye
                Else
                    logba sFN, "Nem tal�lhat� " & n�vel�vel(al��rtbeutal�helye) & ", ez�rt nem lehetett �thelyezni!" & vbNewLine & "Ez k�l�n�s, mert a beutal� kik�ld�se sikeres volt...", 0
                End If
                
                Set fso = Nothing
        Else 'Ha nem siker�lt a beutal�t elk�ldeni
            logba sFN, n�vel�vel(al��rtbeutal�helye) & " nev� beutal�t nem siker�lt elk�ldeni! R�szeletek:" & vbNewLine & _
                                            "C�mzett:" & c�mzett(0) & vbNewLine & _
                                            "D�tum:" & D�tum, 0
        End If
        Debug.Print ClientMessageId, DeliveredDate
        If n > 10 Then Exit Sub
    Next n
fvki
End Sub
Function dtDarabol�(id� As String) As Date
    If Len(id�) < 14 Then Exit Function
    dtDarabol� = CDate( _
        Mid(id�, 1, 4) & "-" & Mid(id�, 5, 2) & "-" & Mid(id�, 7, 2) & " " & _
        Mid(id�, 9, 2) & ":" & Mid(id�, 11, 2) & ":" & Mid(id�, 13, 2))

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
Sub lev�lc�mekBet�lt�se()
    Dim db As DAO.Database

    ' Open the table
    Set db = CurrentDb
    Set lev�lc�mek = db.OpenRecordset("lkNexonID_Email", dbOpenSnapshot)

End Sub

' Function to get Email by NexonID
Function Lev�lc�mNexonIDalapj�n(NexonID As Variant) As String
    If lev�lc�mek Is Nothing Then
        lev�lc�mekBet�lt�se ' Rekordok bet�lt�se TODO: a tal�latok el�sz�k�t�se?
    End If
    With lev�lc�mek
        If Not .EOF And .BOF Then
            .MoveFirst
        End If
        .FindFirst "[NexonID]=" & NexonID
        If Not .NoMatch Then
            Lev�lc�mNexonIDalapj�n = .Fields("Email")
        Else
            Lev�lc�mNexonIDalapj�n = "Not Found"
        End If
    End With
End Function