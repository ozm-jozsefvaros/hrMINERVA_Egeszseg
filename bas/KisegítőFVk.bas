'E gy�tem�nyben, ha az MIT licencia eml�ttettik, (megjel�lve a szerz�t �s a m� sz�let�s�nek �v�t) azon az al�bbi felhaszn�l�si enged�lyt kell �rteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Public Const � As String = ";"
Public id�b�lyeg As Date
Public f�jllista As Variant
Function �(sz�veg, Optional t�vtart� As Variant = "")
'##########
'# Ol�h Zolt�n (c) 2024 MIT
    t�vtart� = Left(t�vtart�, 1)
    Select Case t�vtart�
        Case ";"
            Debug.Print sz�veg;
        Case ","
            Debug.Print sz�veg,
        Case Else
            Debug.Print sz�veg
    End Select
End Function
Function N�(�rt�k As Variant, �rt�kha�res As Variant) As Variant
'##########
'# Ol�h Zolt�n (c) 2024 MIT
'# Ha az �rt�k �res (Null, "" vagy 0), akkor az �rt�kha�res �rt�k�t adja vissza, egy�bk�nt az �rt�ket.
'# Akkor haszn�lhat�, ha nem tudjuk, hogy a vizsg�lt �rt�k hogyan �res, de szeretn�nk helyette egy m�sik �rt�ket.
'##########
    If IsObject(�rt�k) Then
        If IsEmpty(�rt�k) Then
            If IsObject(�rt�kha�res) Then
                Set N� = �rt�kha�res
            Else
                N� = �rt�kha�res
            End If
        Else
           Set N� = �rt�k
        End If
        Exit Function
    End If
    If IsNull(�rt�k) Or �rt�k = vbNullString Or �rt�k = 0 Then
        If IsObject(�rt�kha�res) Then
            Set N� = �rt�kha�res
        Else
            N� = �rt�kha�res
        End If
        Exit Function
    End If
    N� = �rt�k
End Function

Function �(ByRef n�velend� As Variant)
    On Error GoTo Hiba
        n�velend� = N�(n�velend�, 0)
        n�velend� = CLng(n�velend�) + 1
         � = n�velend�
    Exit Function
Hiba:
    Select Case Err.Number
        Case 13
            n�velend� = 1
        Case Else
            MsgBox Hiba(Err)
    End Select
   
End Function
Function �_(n�velend� As Long)
    �_ = �(Abs(n�velend�)) * -1
End Function
Function �(ByRef cs�kkentend� As Long)
    On Error GoTo Hiba
        cs�kkentend� = N�(cs�kkentend�, 0)
        cs�kkentend� = CLng(cs�kkentend�) - 1
        � = cs�kkentend�
    Exit Function
Hiba:
    Select Case Err.Number
        Case 13
            cs�kkentend� = 1
        Case Else
            'MsgBox Hiba(Err)
    End Select
End Function
Function �(Optional ByRef megism�tlend� As Variant = Null)
If Not IsNull(megism�tlend�) Then _
    megism�tlend� = megism�tlend� & megism�tlend�
    � = megism�tlend�
End Function
Function t�mbDim(ByVal t�mb As Variant) As Integer
'#MIT Ol�h Zolt�n (c) 2024
'# Egy t�mb dimenzi�inak a sz�m�t adja vissza
    Dim dimSz�m As Long
    On Error GoTo Eredm�ny
    dimSz�m = 1
    Do While LBound(t�mb, dimSz�m) Or True
        � dimSz�m
    Loop: Exit Function
Eredm�ny:
    � dimSz�m
    t�mbDim = dimSz�m
End Function

Function vane(teljes�tvonal As String) As Boolean
    vane = (Dir(teljes�tvonal) <> vbNullString)
End Function

Function �tvonalK�sz�t�(ByVal �tvonal As String, ByVal f�jln�v As String)
'****** (c) Ol�h Zolt�n 2022 - MIT Licence ****************
Dim per As String
    per = Right(�tvonal, 1)
    'Debug.Print �tvonal, per
    
    If per <> "\" Then
        per = "\"
    Else
        per = ""
    End If
    'Debug.Print "per = " & per
    �tvonalK�sz�t� = �tvonal & per & f�jln�v
End Function

Function p�rkeres�(ByRef t�mb As Variant, keresett As Variant, Optional hanyadik As Integer = 2) As Variant
'******************************************************************
'
' Ez a f�ggv�ny megkeresi a megadott �rt�ket (keresett) egy k�tdimenzi�s t�mb els� oszlop�ban, �s visszaadja
' a keresett elemhez tartoz� p�rj�t a t�mb egy m�sik oszlop�b�l (a hanyadik param�ter szerint).
'
' Param�terek:
' - t�mb (ByRef Variant): A k�tdimenzi�s t�mb, amelyben a keres�st v�gezz�k. Az els� oszlopban keresi a keresett �rt�ket.
' - keresett (Variant): Az az �rt�k, amelyet a t�mb els� oszlop�ban keres�nk.
' - hanyadik (Optional Integer): Az oszlop sz�ma, amelyb�l a keresett �rt�khez tartoz� p�rt visszaadjuk. Alap�rtelmezett �rt�ke 2.
'
' M�k�d�s:
' - A f�ggv�ny v�gigmegy a t�mb els� oszlop�n, �s ha megtal�lja a keresett �rt�ket, visszaadja annak p�rj�t a megadott oszlopb�l.
' - Ha nem tal�lja a keresett �rt�ket, akkor 0-t ad vissza.
'
' Visszat�r�si �rt�k:
' - Variant: A keresett �rt�khez tartoz� elem a megadott oszlopb�l, vagy 0, ha a keresett �rt�k nem tal�lhat�.
'
'******************************************************************
    For i = 1 To UBound(t�mb, 1)
        If t�mb(i, 1) = keresett Then
            p�rkeres� = t�mb(i, hanyadik)
            Exit Function ' Kil�p, ha tal�ltunk
        End If
    Next i
    'Ha nem tal�ltunk, �resen t�r vissza
    p�rkeres� = 0
End Function



Function LS(ByVal str1 As String, ByVal str2 As String) As Integer 'Levenshtein t�vols�g sz�m�t�sa
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


Function Lej�rat(perc As Integer) As Date
    Dim id� As Date
    
    id� = Now()
    Lej�rat = TimeSerial(Hour(id�), Minute(id�) + perc, Second(id�))
    
End Function
Function felhaszn�l�()
    felhaszn�l� = Environ("USERNAME")
End Function
Function szg�p()
    szg�p = Environ("Computername")
End Function
Function g�p()
    g�p = Environ("Computername")
End Function

Sub v�rakoz�s(Optional mp As Integer = 1)
'M�sodpercben megadott ideig v�rakozik, k�zben f�l mp-nk�nt visszaadja a vez�rl�st...
Dim tMost As Variant
Dim tK�v As Variant
    tV�r = Time
    tV�r = DateAdd("s", mp, tV�r)
    tK�v = DateAdd("s", 1, tMost)
    Do Until tMost >= tV�r
        tMost = Time
        If tMost > tK�v Then
            tK�v = DateAdd("s", 0.5, tMost)
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
    'Forr�s: http://allenbrowne.com/func-06.html
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

Sub mez�lista(t�blan�v As String)
    Dim db As Database
    Dim tbl As TableDef
    Dim fld As Field
    
    Set db = CurrentDb
    Set tbl = db.TableDefs(t�blan�v)
    Debug.Print "Create Table " & t�blan�v & " ("
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
' 3 OZ.     2025-03-04              Ha nincs f�jl a mapp�ban, akkor csillagot ad vissza.
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
    'Ha nincs f�jl a mapp�ban, akkor csillagot ad vissza.
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
    v�lt1.�rt�k = sPath:     v�lt1.n�v = "sPath"
    v�lt2.�rt�k = i:         v�lt2.n�v = "i"
    v�lt3.�rt�k = sFilter:   v�lt3.n�v = "sFilter"
    
    MsgBox Hiba(Err)

    Resume Error_Handler_Exit
End Function

Function strK�vF�jlN�v(sz�m As Variant, Optional �tvonal As String = strAl��rtPDF, Optional minta As String = "pdf") As String
    Dim f�jl As Variant
    Dim els� As Boolean
    Dim sorsz�m As Long
'On Error GoTo hiba
If IsNull(sz�m) Then strK�vF�jlN�v = vbNullString: Exit Function
sorsz�m = CLng(CsakSz�mJegy(sz�m))
    If sorsz�m = 0 Or DateDiff("s", id�b�lyeg, Now()) > 120 Then
        f�jllista = FF_ListFilesInDir(�tvonal, minta)
        id�b�lyeg = Now()
    End If
    If sorsz�m <= UBound(f�jllista) Then
        strK�vF�jlN�v = f�jllista(sorsz�m)
    Else
        strK�vF�jlN�v = ""
    End If
ki:
Exit Function
Hiba:
    
        v�lt1.n�v = "�tvonal": v�lt1.�rt�k = �tvonal
        v�lt2.n�v = "minta": v�lt2.�rt�k = minta
        MsgBox Hiba(Err)
        Resume ki:
    
End Function
Function flm(Optional �tvonal As String = strAl��rtPDF, Optional minta As String = "pdf") As Long
'F�jllista m�rete
If IsEmpty(f�jllista) Then
    f�jllista = FF_ListFilesInDir(�tvonal, minta)
End If
If DateDiff("s", id�b�lyeg, Now()) > 120 Then
    f�jllista = FF_ListFilesInDir(�tvonal, minta)
End If

    flm = UBound(f�jllista)
End Function

'# Ez a modul tartalmazza az idegen forr�sb�l vett, esetleg �talak�tott k�dokat
Public Function RIC(ByVal strSz�veg As String, Optional strHely As Variant = "_") As String 'Optional: OZ
'Forr�s: https://www.access-programmers.co.uk/forums/threads/remove-special-characters-from-file-name-when-saving.261147/
'Licencia: MIT Ol�h Zolt�n 2022 (c)
    strHely = Nz(strHely, "_") 'OZ
    Const cstrTiltott As String = "\,/,:,*,?,"",<,>,|, ,;,(,),.,-,=,"
    
    Dim lnSz�ml�l� As Long
    Dim aTiltottak() As String
    
    aTiltottak() = Split(cstrTiltott, ",")
    
    For lnSz�ml�l� = LBound(aTiltottak()) To UBound(aTiltottak())
        strSz�veg = Replace(strSz�veg, aTiltottak(lnSz�ml�l�), strHely)
    Next lnSz�ml�l�
    strSz�veg = Replace(strSz�veg, ",", strHely)
    RIC = strSz�veg

End Function ' RemoveIllegalCharacters