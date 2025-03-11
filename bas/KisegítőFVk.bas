'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Public Const ¸ As String = ";"
Public idõbélyeg As Date
Public fájllista As Variant
Function ¤(szöveg, Optional távtartó As Variant = "")
'##########
'# Oláh Zoltán (c) 2024 MIT
    távtartó = Left(távtartó, 1)
    Select Case távtartó
        Case ";"
            Debug.Print szöveg;
        Case ","
            Debug.Print szöveg,
        Case Else
            Debug.Print szöveg
    End Select
End Function
Function Nü(érték As Variant, értékhaüres As Variant) As Variant
'##########
'# Oláh Zoltán (c) 2024 MIT
'# Ha az érték üres (Null, "" vagy 0), akkor az értékhaüres értékét adja vissza, egyébként az értéket.
'# Akkor használható, ha nem tudjuk, hogy a vizsgált érték hogyan üres, de szeretnénk helyette egy másik értéket.
'##########
    If IsObject(érték) Then
        If IsEmpty(érték) Then
            If IsObject(értékhaüres) Then
                Set Nü = értékhaüres
            Else
                Nü = értékhaüres
            End If
        Else
           Set Nü = érték
        End If
        Exit Function
    End If
    If IsNull(érték) Or érték = vbNullString Or érték = 0 Then
        If IsObject(értékhaüres) Then
            Set Nü = értékhaüres
        Else
            Nü = értékhaüres
        End If
        Exit Function
    End If
    Nü = érték
End Function

Function ÷(ByRef növelendõ As Variant)
    On Error GoTo Hiba
        növelendõ = Nü(növelendõ, 0)
        növelendõ = CLng(növelendõ) + 1
         ÷ = növelendõ
    Exit Function
Hiba:
    Select Case Err.Number
        Case 13
            növelendõ = 1
        Case Else
            MsgBox Hiba(Err)
    End Select
   
End Function
Function ÷_(növelendõ As Long)
    ÷_ = ÷(Abs(növelendõ)) * -1
End Function
Function ¡(ByRef csökkentendõ As Long)
    On Error GoTo Hiba
        csökkentendõ = Nü(csökkentendõ, 0)
        csökkentendõ = CLng(csökkentendõ) - 1
        ¡ = csökkentendõ
    Exit Function
Hiba:
    Select Case Err.Number
        Case 13
            csökkentendõ = 1
        Case Else
            'MsgBox Hiba(Err)
    End Select
End Function
Function §(Optional ByRef megismétlendõ As Variant = Null)
If Not IsNull(megismétlendõ) Then _
    megismétlendõ = megismétlendõ & megismétlendõ
    § = megismétlendõ
End Function
Function tömbDim(ByVal tömb As Variant) As Integer
'#MIT Oláh Zoltán (c) 2024
'# Egy tömb dimenzióinak a számát adja vissza
    Dim dimSzám As Long
    On Error GoTo Eredmény
    dimSzám = 1
    Do While LBound(tömb, dimSzám) Or True
        ÷ dimSzám
    Loop: Exit Function
Eredmény:
    ÷ dimSzám
    tömbDim = dimSzám
End Function

Function vane(teljesútvonal As String) As Boolean
    vane = (Dir(teljesútvonal) <> vbNullString)
End Function

Function ÚtvonalKészítõ(ByVal Útvonal As String, ByVal fájlnév As String)
'****** (c) Oláh Zoltán 2022 - MIT Licence ****************
Dim per As String
    per = Right(Útvonal, 1)
    'Debug.Print Útvonal, per
    
    If per <> "\" Then
        per = "\"
    Else
        per = ""
    End If
    'Debug.Print "per = " & per
    ÚtvonalKészítõ = Útvonal & per & fájlnév
End Function

Function párkeresõ(ByRef tömb As Variant, keresett As Variant, Optional hanyadik As Integer = 2) As Variant
'******************************************************************
'
' Ez a függvény megkeresi a megadott értéket (keresett) egy kétdimenziós tömb elsõ oszlopában, és visszaadja
' a keresett elemhez tartozó párját a tömb egy másik oszlopából (a hanyadik paraméter szerint).
'
' Paraméterek:
' - tömb (ByRef Variant): A kétdimenziós tömb, amelyben a keresést végezzük. Az elsõ oszlopban keresi a keresett értéket.
' - keresett (Variant): Az az érték, amelyet a tömb elsõ oszlopában keresünk.
' - hanyadik (Optional Integer): Az oszlop száma, amelybõl a keresett értékhez tartozó párt visszaadjuk. Alapértelmezett értéke 2.
'
' Mûködés:
' - A függvény végigmegy a tömb elsõ oszlopán, és ha megtalálja a keresett értéket, visszaadja annak párját a megadott oszlopból.
' - Ha nem találja a keresett értéket, akkor 0-t ad vissza.
'
' Visszatérési érték:
' - Variant: A keresett értékhez tartozó elem a megadott oszlopból, vagy 0, ha a keresett érték nem található.
'
'******************************************************************
    For i = 1 To UBound(tömb, 1)
        If tömb(i, 1) = keresett Then
            párkeresõ = tömb(i, hanyadik)
            Exit Function ' Kilép, ha találtunk
        End If
    Next i
    'Ha nem találtunk, üresen tér vissza
    párkeresõ = 0
End Function



Function LS(ByVal str1 As String, ByVal str2 As String) As Integer 'Levenshtein távolság számítása
    Dim arrLev, intLen1 As Integer, intLen2 As Integer, i As Integer
    Dim j, arrStr1, arrStr2, intMini As Integer
 
    intLen1 = Len(str1)
    ReDim arrStr1(intLen1 + 1)
    intLen2 = Len(str2)
    ReDim arrStr2(intLen2 + 1)
    ReDim arrLev(intLen1 + 1, intLen2 + 1)
 
    arrLev(0, 0) = 0
    For i = 1 To intLen1
        arrLev(i, 0) = i
        arrStr1(i) = Mid(str1, i, 1)
    Next
 
    For j = 1 To intLen2
        arrLev(0, j) = j
        arrStr2(j) = Mid(str2, j, 1)
    Next
 
    For j = 1 To intLen2
        For i = 1 To intLen1
            If arrStr1(i) = arrStr2(j) Then
                arrLev(i, j) = arrLev(i - 1, j - 1)
            Else
                intMini = arrLev(i - 1, j) 'deletion
                If intMini > arrLev(i, j - 1) Then intMini = arrLev(i, j - 1) 'insertion
                If intMini > arrLev(i - 1, j - 1) Then intMini = arrLev(i - 1, j - 1) 'deletion
 
                arrLev(i, j) = intMini + 1
            End If
        Next
    Next
 
    LS = arrLev(intLen1, intLen2)
End Function


Function Lejárat(perc As Integer) As Date
    Dim idõ As Date
    
    idõ = Now()
    Lejárat = TimeSerial(Hour(idõ), Minute(idõ) + perc, Second(idõ))
    
End Function
Function felhasználó()
    felhasználó = Environ("USERNAME")
End Function
Function szgép()
    szgép = Environ("Computername")
End Function
Function gép()
    gép = Environ("Computername")
End Function

Sub várakozás(Optional mp As Integer = 1)
'Másodpercben megadott ideig várakozik, közben fél mp-nként visszaadja a vezérlést...
Dim tMost As Variant
Dim tKöv As Variant
    tVár = Time
    tVár = DateAdd("s", mp, tVár)
    tKöv = DateAdd("s", 1, tMost)
    Do Until tMost >= tVár
        tMost = Time
        If tMost > tKöv Then
            tKöv = DateAdd("s", 0.5, tMost)
            DoEvents
        End If
    Loop
End Sub
Sub Status(pstrStatus As String)
    
    Dim lvarStatus As Variant
    
    If pstrStatus = "" Then
        lvarStatus = SysCmd(acSysCmdClearStatus)
    Else
        lvarStatus = SysCmd(acSysCmdSetStatus, pstrStatus)
    End If
    
End Sub

Function FieldTypeName(fld As DAO.Field) As String
    'Purpose: Converts the numeric results of DAO Field.Type to text.
    'Provided by Allen Browne.  Last updated: April 2010.
    'Forrás: http://allenbrowne.com/func-06.html
    Dim strReturn As String    'Name to return

    Select Case CLng(fld.Type) 'fld.Type is Integer, but constants are Long.
        Case dbBoolean: strReturn = "Yes/No"            ' 1
        Case dbByte: strReturn = "Byte"                 ' 2
        Case dbInteger: strReturn = "Integer"           ' 3
        Case dbLong                                     ' 4
            If (fld.Attributes And dbAutoIncrField) = 0& Then
                strReturn = "Long Integer"
            Else
                strReturn = "AutoNumber"
            End If
        Case dbCurrency: strReturn = "Currency"         ' 5
        Case dbSingle: strReturn = "Single"             ' 6
        Case dbDouble: strReturn = "Double"             ' 7
        Case dbDate: strReturn = "DateTime"            ' 8
        Case dbBinary: strReturn = "Binary"             ' 9 (no interface)
        Case dbText                                     '10
            If (fld.Attributes And dbFixedField) = 0& Then
                strReturn = "Text"
            Else
                strReturn = "Text (fixed width)"        '(no interface)
            End If
        Case dbLongBinary: strReturn = "OLE Object"     '11
        Case dbMemo                                     '12
            If (fld.Attributes And dbHyperlinkField) = 0& Then
                strReturn = "Memo"
            Else
                strReturn = "Hyperlink"
            End If
        Case dbGUID: strReturn = "GUID"                 '15

        'Attached tables only: cannot create these in JET.
        Case dbBigInt: strReturn = "Big Integer"        '16
        Case dbVarBinary: strReturn = "VarBinary"       '17
        Case dbChar: strReturn = "Char"                 '18
        Case dbNumeric: strReturn = "Numeric"           '19
        Case dbDecimal: strReturn = "Decimal"           '20
        Case dbFloat: strReturn = "Float"               '21
        Case dbTime: strReturn = "Time"                 '22
        Case dbTimeStamp: strReturn = "Time Stamp"      '23

        'Constants for complex types don't work prior to Access 2007 and later.
        Case 101&: strReturn = "Attachment"         'dbAttachment
        Case 102&: strReturn = "Complex Byte"       'dbComplexByte
        Case 103&: strReturn = "Complex Integer"    'dbComplexInteger
        Case 104&: strReturn = "Complex Long"       'dbComplexLong
        Case 105&: strReturn = "Complex Single"     'dbComplexSingle
        Case 106&: strReturn = "Complex Double"     'dbComplexDouble
        Case 107&: strReturn = "Complex GUID"       'dbComplexGUID
        Case 108&: strReturn = "Complex Decimal"    'dbComplexDecimal
        Case 109&: strReturn = "Complex Text"       'dbComplexText
        Case Else: strReturn = "Field type " & fld.Type & " unknown"
    End Select

    FieldTypeName = strReturn
End Function
Public Function TableExists(ByVal strTableName As String, Optional ysnRefresh As Boolean, Optional db As DAO.Database) As Boolean
    ' Originally Based on Tony Toews function in TempTables.MDB, http://www.granite.ab.ca/access/temptables.htm
    ' Based on testing, when passed an existing database variable, this is the fastest
    On Error GoTo errHandler
      Dim tdf As DAO.TableDef
      Dim dbjel As Boolean
        dbjel = False
        If db Is Nothing Then
            Set db = CurrentDb()
            dbjel = True
        End If
      If ysnRefresh Then db.TableDefs.Refresh
      Set tdf = db(strTableName)
      TableExists = True
    
exitRoutine:
      Set tdf = Nothing
      If dbjel Then Set db = Nothing
      Exit Function
    
errHandler:
      Select Case Err.Number
        Case 3265
          TableExists = False
        Case Else
          MsgBox (Hiba(Err))
      End Select
      Resume exitRoutine
End Function

Sub mezõlista(táblanév As String)
    Dim db As Database
    Dim tbl As TableDef
    Dim fld As Field
    
    Set db = CurrentDb
    Set tbl = db.TableDefs(táblanév)
    Debug.Print "Create Table " & táblanév & " ("
    For Each fld In tbl.Fields
        Debug.Print "[" & fld.Name & "]" & " " & FieldTypeName(fld) & ","
    Next fld
    
End Sub
'---------------------------------------------------------------------------------------
' Procedure : FF_ListFilesInDir
' Author    : Daniel Pineault, CARDA Consultants Inc.
' Website   : http://www.cardaconsultants.com
' Purpose   : Return a list of files in a given directory
' Copyright : The following is release as Attribution-ShareAlike 4.0 International
'             (CC BY-SA 4.0) - https://creativecommons.org/licenses/by-sa/4.0/
' Req'd Refs: None required
'
' Input Variables:
' ~~~~~~~~~~~~~~~~
' sPath     : Full path of folder to examine with trailing \
' sFilter   : specific file extension to limmit search to, leave blank to list all files
'
' Usage:
' ~~~~~~
' FF_ListFilesInDir("C:\Users\Daniel\Documents\") 'List all the files
' FF_ListFilesInDir("C:\Users\Daniel\Documents\","xls") 'Only list Excel files
' FF_ListFilesInDir("C:\Users\Daniel\Documents\","doc") 'Only list Word files
'
' Revision History:
' Rev       Date(yyyy/mm/dd)        Description
' **************************************************************************************
' 1         2012-Jul-13             Initial Release
' 2         2019-02-03              Updated copyright & function header
'                                   Changed function name to follow naming convention
'                                   Added \ check in sPath string
'                                   Changed the function to return an array of the files
' 3 OZ.     2025-03-04              Ha nincs fájl a mappában, akkor csillagot ad vissza.
'---------------------------------------------------------------------------------------
Function FF_ListFilesInDir(sPath As String, Optional sFilter As String = "*") As Variant
fvbe ("FF_ListFilesInDir")
    Dim aFiles()              As String
    Dim sFile                 As String
    Dim i                     As Long
 
    On Error GoTo Error_Handler
 
    If Right(sPath, 1) <> "\" Then sPath = sPath & "\"
    sFile = Dir(sPath & "*." & sFilter)
    Do While sFile <> vbNullString
        If sFile <> "." And sFile <> ".." Then
            ReDim Preserve aFiles(i)
            aFiles(i) = sFile
            i = i + 1
        End If
        sFile = Dir     'Loop through the next file that was found
    Loop
    'Ha nincs fájl a mappában, akkor csillagot ad vissza.
    If i = 0 Then
        ReDim aFiles(0)
        aFiles(0) = "*"
    End If
    FF_ListFilesInDir = aFiles
 
Error_Handler_Exit:
    On Error Resume Next
fvki
    Exit Function
 
Error_Handler:
    vált1.érték = sPath:     vált1.név = "sPath"
    vált2.érték = i:         vált2.név = "i"
    vált3.érték = sFilter:   vált3.név = "sFilter"
    
    MsgBox Hiba(Err)

    Resume Error_Handler_Exit
End Function

Function strKövFájlNév(szám As Variant, Optional Útvonal As String = strAláírtPDF, Optional minta As String = "pdf") As String
    Dim fájl As Variant
    Dim elsõ As Boolean
    Dim sorszám As Long
'On Error GoTo hiba
If IsNull(szám) Then strKövFájlNév = vbNullString: Exit Function
sorszám = CLng(CsakSzámJegy(szám))
    If sorszám = 0 Or DateDiff("s", idõbélyeg, Now()) > 120 Then
        fájllista = FF_ListFilesInDir(Útvonal, minta)
        idõbélyeg = Now()
    End If
    If sorszám <= UBound(fájllista) Then
        strKövFájlNév = fájllista(sorszám)
    Else
        strKövFájlNév = ""
    End If
ki:
Exit Function
Hiba:
    
        vált1.név = "útvonal": vált1.érték = Útvonal
        vált2.név = "minta": vált2.érték = minta
        MsgBox Hiba(Err)
        Resume ki:
    
End Function
Function flm(Optional Útvonal As String = strAláírtPDF, Optional minta As String = "pdf") As Long
'Fájllista mérete
If IsEmpty(fájllista) Then
    fájllista = FF_ListFilesInDir(Útvonal, minta)
End If
If DateDiff("s", idõbélyeg, Now()) > 120 Then
    fájllista = FF_ListFilesInDir(Útvonal, minta)
End If

    flm = UBound(fájllista)
End Function

'# Ez a modul tartalmazza az idegen forrásból vett, esetleg átalakított kódokat
Public Function RIC(ByVal strSzöveg As String, Optional strHely As Variant = "_") As String 'Optional: OZ
'Forrás: https://www.access-programmers.co.uk/forums/threads/remove-special-characters-from-file-name-when-saving.261147/
'Licencia: MIT Oláh Zoltán 2022 (c)
    strHely = Nz(strHely, "_") 'OZ
    Const cstrTiltott As String = "\,/,:,*,?,"",<,>,|, ,;,(,),.,-,=,"
    
    Dim lnSzámláló As Long
    Dim aTiltottak() As String
    
    aTiltottak() = Split(cstrTiltott, ",")
    
    For lnSzámláló = LBound(aTiltottak()) To UBound(aTiltottak())
        strSzöveg = Replace(strSzöveg, aTiltottak(lnSzámláló), strHely)
    Next lnSzámláló
    strSzöveg = Replace(strSzöveg, ",", strHely)
    RIC = strSzöveg

End Function ' RemoveIllegalCharacters