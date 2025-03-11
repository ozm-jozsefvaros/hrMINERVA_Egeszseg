#/#/#/
Lek�rdez�s1
#/#/
SELECT Year(IIf([k�vetkez�]<#2/1/2025#,DateSerial(2025,2,Day([k�vetkez�])),[k�vetkez�])) AS [Vizsg�lat �ve], Month(IIf([k�vetkez�]<#2/1/2025#,DateSerial(2025,2,Day([k�vetkez�])),[k�vetkez�])) AS [Vizsg�lat h�napja], Count(lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.azonos�t�) AS CountOfazonos�t�
FROM lkEg�szs�g�gyiVisszajelz�sekSzem�lyek LEFT JOIN lkSzem�lyekOrvosiAdatok ON lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.azonos�t� = lkSzem�lyekOrvosiAdatok.NexonId
WHERE (((Nz([Jogviszony t�pusa / jogviszony t�pus],"")) Not Like "hivat*" And (Nz([Jogviszony t�pusa / jogviszony t�pus],""))<>"Szem�lyes jelenl�t") AND ((lkSzem�lyekOrvosiAdatok.[Tart�s t�voll�t t�pusa])="" Or (lkSzem�lyekOrvosiAdatok.[Tart�s t�voll�t t�pusa]) Is Null))
GROUP BY Year(IIf([k�vetkez�]<#2/1/2025#,DateSerial(2025,2,Day([k�vetkez�])),[k�vetkez�])), Month(IIf([k�vetkez�]<#2/1/2025#,DateSerial(2025,2,Day([k�vetkez�])),[k�vetkez�]))
ORDER BY Year(IIf([k�vetkez�]<#2/1/2025#,DateSerial(2025,2,Day([k�vetkez�])),[k�vetkez�])), Month(IIf([k�vetkez�]<#2/1/2025#,DateSerial(2025,2,Day([k�vetkez�])),[k�vetkez�]));

#/#/#/
Lek�rdez�s2
#/#/
SELECT DISTINCT lkSzem�lyekOrvosiAdatok.F�oszt�ly, lkSzem�lyekOrvosiAdatok.F�oszt�lyK�d, lkSzem�lyekOrvosiAdatok.[Dolgoz� teljes neve], tBej�v��zenetek.DeliveredDate, lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.azEg�szs�g�gyiVisszajelz�s
FROM (lkEg�szs�g�gyiVisszajelz�sekSzem�lyek INNER JOIN lkSzem�lyekOrvosiAdatok ON lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.azonos�t� = lkSzem�lyekOrvosiAdatok.NexonId) INNER JOIN tBej�v��zenetek ON lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.az�zenet = tBej�v��zenetek.az�zenet
WHERE (((tBej�v��zenetek.DeliveredDate) Between DateSerial(Year(Now()),Month(Now()),1) And DateSerial(Year(Now()),Month(Now())+1,0)));

#/#/#/
Lek�rdez�s3
#/#/
SELECT tElk�sz�ltBeutal�k.NexonID, lkAl��rtBeutal�k.N�v
FROM tElk�sz�ltBeutal�k LEFT JOIN lkAl��rtBeutal�k ON (tElk�sz�ltBeutal�k.NexonID = lkAl��rtBeutal�k.NExonID) AND (tElk�sz�ltBeutal�k.Id�pont = lkAl��rtBeutal�k.D�tum)
WHERE (((lkAl��rtBeutal�k.Sorsz�m) Is Not Null));

#/#/#/
Lek�rdez�s4
#/#/
SELECT 
FROM tElk�sz�ltBeutal�k;

#/#/#/
lk2024_4_n�viElsz�mol�s
#/#/
SELECT lkSzem�lyek.Ad�jel, [2024_4_n�viElsz�mol�s].Oszt�ly, [2024_4_n�viElsz�mol�s].[Alk# tipus] AS [Alk tipus], [2024_4_n�viElsz�mol�s].[Alk# d�tuma] AS [Alk d�tuma], [2024_4_n�viElsz�mol�s].�rv�nyes
FROM lkSzem�lyek INNER JOIN 2024_4_n�viElsz�mol�s ON lkSzem�lyek.[TAJ sz�m] = [2024_4_n�viElsz�mol�s].TAJ;

#/#/#/
lk2024IVn�vbenVizsg�ltak
#/#/
SELECT lkSzem�lyekOrvosiAdatok.Ad�jel, (IIf(Nz([azonos�t�],0)=0,"igen, az Mvt. 49. � (1a) bekezd�se szerinti jogszab�ly alapj�n","igen, az Mvt. 49. � (1a) bekezd�se szerint, a munk�ltat� erre ir�nyul� d�nt�se alapj�n")) AS [orvosi vizsg�lathoz k�t�tt-e] INTO t2024IVn�vbenVizsg�ltak IN 'L:\Ugyintezok\Adatszolg�ltat�k\Adatb�zisok\H�tt�rt�rak\Ellen�rz�s_0.9.6_h�tt�r_.mdb.accdb'
FROM lkSzem�lyekOrvosiAdatok LEFT JOIN lkEg�szs�g�gyiVisszajelz�sekSzem�lyek ON lkSzem�lyekOrvosiAdatok.NexonId = lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.azonos�t�
WHERE (((lkSzem�lyekOrvosiAdatok.[Orvosi vizsg�lat id�pontja]) Between #9/1/2024# And #12/31/2024#));

#/#/#/
lk2024IVn�vbenVizsg�ltakL�tsz�ma
#/#/
SELECT Month([Orvosi vizsg�lat id�pontja]) AS H�nap, Sum(1) AS R�sztvev�k, Sum(IIf(Nz([azonos�t�],0)=0,0,1)) AS K�telezettek
FROM lkSzem�lyekOrvosiAdatok LEFT JOIN lkEg�szs�g�gyiVisszajelz�sekSzem�lyek ON lkSzem�lyekOrvosiAdatok.NexonId = lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.azonos�t�
WHERE (((lkSzem�lyekOrvosiAdatok.[Orvosi vizsg�lat id�pontja]) Between #9/1/2024# And #12/31/2024#))
GROUP BY Month([Orvosi vizsg�lat id�pontja])
ORDER BY Month([Orvosi vizsg�lat id�pontja]);

#/#/#/
lkAl��rtBeutal�k
#/#/
SELECT lkSorsz�mok.Sorsz�m, ffsplit(strK�vF�jlN�v([Sorsz�m]),"##",1) AS N�v, CLng(ffsplit(strK�vF�jlN�v([Sorsz�m]),"##",3)) AS NExonID, dtDarabol�(ffsplit(strK�vF�jlN�v([Sorsz�m]),"##",2)) AS D�tum
FROM lkSorsz�mok
WHERE (((lkSorsz�mok.Sorsz�m)<=flm()));

#/#/#/
lkAlkalmass�giVizsg�raK�telezettek
#/#/
SELECT lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve], tMunkak�r�k.Munkak�r, tE�Oszt�lyok.E�Oszt�ly, "https://nexonport.kh.gov.hu/menu/hrmapp/szemelytorzs/szemelyikarton?szemelyAzonosito=" & [lkazNexonAd�jel02].[Szem�ly azonos�t�] & "&r=13" AS Http, "<a href=""https://nexonport.kh.gov.hu/menu/hrmapp/szemelytorzs/szemelyikarton?szemelyAzonosito=" & [lkazNexonAd�jel02].[Szem�ly azonos�t�] & "&r=13"" target=""_blank"">" & [Dolgoz� teljes neve] & "</a>" AS htmlLink
FROM tE�Oszt�lyok INNER JOIN (tMunkak�r�k INNER JOIN ((lkazNexonAd�jel02 INNER JOIN lkEg�szs�g�gyiVisszajelz�sekSzem�lyenk�ntUtols� ON lkazNexonAd�jel02.[Szem�ly azonos�t�] = lkEg�szs�g�gyiVisszajelz�sekSzem�lyenk�ntUtols�.azonos�t�) INNER JOIN lkSzem�lyek ON lkazNexonAd�jel02.Ad�jel = lkSzem�lyek.Ad�jel) ON tMunkak�r�k.Munkak�rK�d = lkEg�szs�g�gyiVisszajelz�sekSzem�lyenk�ntUtols�.�rt�k) ON tE�Oszt�lyok.azE�Oszt�ly = tMunkak�r�k.azE�Oszt�ly
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY lkSzem�lyek.BFKH, tE�Oszt�lyok.E�Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve];

#/#/#/
lk�ll�shelyek
#/#/
SELECT �ll�shelyek.*
FROM �ll�shelyek;

#/#/#/
lkazNexonAd�jel02
#/#/
SELECT lkNexonAzonos�t�k.Azonos�t�, lkNexonAzonos�t�k.N�v, lkNexonAzonos�t�k.[Szem�ly azonos�t�], lkNexonAzonos�t�k.Ad�jel
FROM lkNexonAzonos�t�k
WHERE (((lkNexonAzonos�t�k.Sorsz�m)=1));

#/#/#/
lkDolgoz�Legutols�Visszajelz�sD�tuma
#/#/
SELECT tEg�szs�g�gyiVisszajelz�sek.azonos�t� AS NexonID, Max(tBej�v��zenetek.DeliveredDate) AS [Legutols� d�tum]
FROM tEg�szs�g�gyiVisszajelz�sek INNER JOIN tBej�v��zenetek ON tEg�szs�g�gyiVisszajelz�sek.az�zenet = tBej�v��zenetek.az�zenet
GROUP BY tEg�szs�g�gyiVisszajelz�sek.azonos�t�;

#/#/#/
lkEg�szs�g�gyiK�vetkez�Vizsg�latiId�pontok
#/#/
SELECT lkEg�szs�g�gyiVisszajelz�sekKimenet.F�oszt�ly, lkEg�szs�g�gyiVisszajelz�sekKimenet.Oszt�ly, lkEg�szs�g�gyiVisszajelz�sekKimenet.[Dolgoz� teljes neve], lkEg�szs�g�gyiVisszajelz�sekKimenet.[Orvosi vizsg�lat k�vetkez� id�pontja], IIf([Orvosi vizsg�lat k�vetkez� id�pontja]<Date() Or [Orvosi vizsg�lat k�vetkez� id�pontja] Is Null,3,Month([Orvosi vizsg�lat k�vetkez� id�pontja])) AS H�, lkEg�szs�g�gyiVisszajelz�sekKimenet.[Szem�ly azonos�t�], tE�Oszt�lyok.E�Oszt�ly, lkOrvosiAlkalmass�giD�jt�telekE�Oszt�lyonk�ntiMax.MaxOfD�jt�tel
FROM lkOrvosiAlkalmass�giD�jt�telekE�Oszt�lyonk�ntiMax INNER JOIN (lkEg�szs�g�gyiVisszajelz�sekKimenet INNER JOIN tE�Oszt�lyok ON lkEg�szs�g�gyiVisszajelz�sekKimenet.azE�Oszt�ly = tE�Oszt�lyok.azE�Oszt�ly) ON lkOrvosiAlkalmass�giD�jt�telekE�Oszt�lyonk�ntiMax.Alkalmass�giOszt�ly = tE�Oszt�lyok.E�Oszt�ly
ORDER BY lkEg�szs�g�gyiVisszajelz�sekKimenet.[Orvosi vizsg�lat k�vetkez� id�pontja], lkEg�szs�g�gyiVisszajelz�sekKimenet.F�oszt�ly, lkEg�szs�g�gyiVisszajelz�sekKimenet.Oszt�ly, lkEg�szs�g�gyiVisszajelz�sekKimenet.[Dolgoz� teljes neve];

#/#/#/
lkEg�szs�g�gyiK�vetkez�Vizsg�latiId�pontokHavi�sszegek
#/#/
SELECT lkEg�szs�g�gyiK�vetkez�Vizsg�latiId�pontok.H�, lkEg�szs�g�gyiK�vetkez�Vizsg�latiId�pontok.E�Oszt�ly, lkEg�szs�g�gyiK�vetkez�Vizsg�latiId�pontok.MaxOfD�jt�tel AS Egys�g�r, Count(lkEg�szs�g�gyiK�vetkez�Vizsg�latiId�pontok.[Dolgoz� teljes neve]) AS L�tsz�m, Sum(lkEg�szs�g�gyiK�vetkez�Vizsg�latiId�pontok.MaxOfD�jt�tel) AS �sszd�j
FROM lkEg�szs�g�gyiK�vetkez�Vizsg�latiId�pontok
GROUP BY lkEg�szs�g�gyiK�vetkez�Vizsg�latiId�pontok.H�, lkEg�szs�g�gyiK�vetkez�Vizsg�latiId�pontok.E�Oszt�ly, lkEg�szs�g�gyiK�vetkez�Vizsg�latiId�pontok.MaxOfD�jt�tel;

#/#/#/
lkEg�szs�g�gyiVisszajelz�sekKimenet
#/#/
SELECT lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve], tMunkak�r�k.Munkak�r, tMunkak�r�k.azE�Oszt�ly, lkSzem�lyek.[Orvosi vizsg�lat id�pontja], lkSzem�lyek.[Orvosi vizsg�lat eredm�nye], lkSzem�lyek.[Orvosi vizsg�lat k�vetkez� id�pontja], lkSzem�lyek.Kil�p�sD�tuma, lkazNexonAd�jel02.[Szem�ly azonos�t�]
FROM ((tMunkak�r�k INNER JOIN lkEg�szs�g�gyiVisszajelz�sekSzem�lyenk�ntUtols� ON tMunkak�r�k.Munkak�rK�d = lkEg�szs�g�gyiVisszajelz�sekSzem�lyenk�ntUtols�.�rt�k) INNER JOIN lkazNexonAd�jel02 ON lkEg�szs�g�gyiVisszajelz�sekSzem�lyenk�ntUtols�.azonos�t� = lkazNexonAd�jel02.[Szem�ly azonos�t�]) INNER JOIN lkSzem�lyek ON lkazNexonAd�jel02.Ad�jel = lkSzem�lyek.Ad�jel
WHERE (((lkSzem�lyek.Kil�p�sD�tuma)>Date() Or (lkSzem�lyek.Kil�p�sD�tuma)=0));

#/#/#/
lkEg�szs�g�gyiVisszajelz�sekSzem�lyek
#/#/
SELECT tEg�szs�g�gyiVisszajelz�sek.azEg�szs�g�gyiVisszajelz�s, tEg�szs�g�gyiVisszajelz�sek.az�zenet, IIf([tEg�szs�g�gyiVisszajelz�sek].[azonos�t�] Not Like "S*",[tEg�szs�g�gyiVisszajelz�sek].[azonos�t�],0)*1 AS azonos�t�, tEg�szs�g�gyiVisszajelz�sek.�rt�k, tBej�v��zenetek.DeliveredDate
FROM tEg�szs�g�gyiVisszajelz�sek INNER JOIN tBej�v��zenetek ON tEg�szs�g�gyiVisszajelz�sek.az�zenet = tBej�v��zenetek.az�zenet
WHERE (((IIf([tEg�szs�g�gyiVisszajelz�sek].[azonos�t�] Not Like "S*",[tEg�szs�g�gyiVisszajelz�sek].[azonos�t�],0)*1) Not Like "S*" And (IIf([tEg�szs�g�gyiVisszajelz�sek].[azonos�t�] Not Like "S*",[tEg�szs�g�gyiVisszajelz�sek].[azonos�t�],0)*1)<>0));

#/#/#/
lkEg�szs�g�gyiVisszajelz�sekSzem�lyenk�ntUtols�
#/#/
SELECT CLng(IIf([tEg�szs�g�gyiVisszajelz�sek].[azonos�t�] Like "S*" Or [tEg�szs�g�gyiVisszajelz�sek].[azonos�t�] Is Null,0,[tEg�szs�g�gyiVisszajelz�sek].[azonos�t�])) AS Azonos�t�, tEg�szs�g�gyiVisszajelz�sek.�rt�k, tEg�szs�g�gyiVisszajelz�sek.az�zenet, lkDolgoz�Legutols�Visszajelz�sD�tuma.[Legutols� d�tum]
FROM (tEg�szs�g�gyiVisszajelz�sek INNER JOIN tBej�v��zenetek ON tEg�szs�g�gyiVisszajelz�sek.az�zenet = tBej�v��zenetek.az�zenet) INNER JOIN lkDolgoz�Legutols�Visszajelz�sD�tuma ON (tEg�szs�g�gyiVisszajelz�sek.azonos�t� = lkDolgoz�Legutols�Visszajelz�sD�tuma.NexonID) AND (tBej�v��zenetek.DeliveredDate = lkDolgoz�Legutols�Visszajelz�sD�tuma.[Legutols� d�tum])
WHERE (((CLng(IIf([tEg�szs�g�gyiVisszajelz�sek].[azonos�t�] Like "S*" Or [tEg�szs�g�gyiVisszajelz�sek].[azonos�t�] Is Null,0,[tEg�szs�g�gyiVisszajelz�sek].[azonos�t�])))<>0));

#/#/#/
lkEg�szs�g�gyiVisszajelz�sekSzem�lyenk�ntUtols�_Lass�
#/#/
SELECT lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.azonos�t�, lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.�rt�k
FROM lkEg�szs�g�gyiVisszajelz�sekSzem�lyek
WHERE (((lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.az�zenet)=(SELECT Max(az�zenet) AS [Utols�Lev�l]         FROM [lkEg�szs�g�gyiVisszajelz�sekSzem�lyek] as Tmp         WHERE [lkEg�szs�g�gyiVisszajelz�sekSzem�lyek].[azonos�t�]=Tmp.azonos�t�         GROUP BY Tmp.azonos�t� )));

#/#/#/
lkEgyesMunkak�r�kF�oszt�lyai
#/#/
SELECT tEgyesMunkak�r�kF�oszt�lyai.Azonos�t�, bfkh([tEgyesMunkak�r�kF�oszt�lyai].[F�oszt�ly]) AS F�oszt�ly, tEgyesMunkak�r�kF�oszt�lyai.Oszt�ly
FROM tEgyesMunkak�r�kF�oszt�lyai;

#/#/#/
lkEgyesMunkak�r�kF�oszt�lyaiOszt�lyai
#/#/
SELECT DISTINCT tEgyesMunkak�r�kF�oszt�lyai.Azonos�t�, lkSzem�lyek.F�oszt�lyK�d, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly
FROM tEgyesMunkak�r�kF�oszt�lyai INNER JOIN lkSzem�lyek ON tEgyesMunkak�r�kF�oszt�lyai.F�oszt�ly = lkSzem�lyek.F�oszt�lyK�d
WHERE (((lkSzem�lyek.Oszt�ly) Like [tEgyesMunkak�r�kF�oszt�lyai].[Oszt�ly]));

#/#/#/
lkF�oszt�lyok
#/#/
SELECT DISTINCT lkSzem�lyek.F�oszt�lyK�d, lkSzem�lyek.F�oszt�ly
FROM lkSzem�lyek;

#/#/#/
lkJ�r�si_�llom�ny
#/#/
SELECT J�r�si_�llom�ny.Sorsz�m, J�r�si_�llom�ny.N�v, J�r�si_�llom�ny.Ad�azonos�t�, J�r�si_�llom�ny.Mez�4 AS [Sz�let�si �v \ �res �ll�s], J�r�si_�llom�ny.Mez�5 AS Neme, J�r�si_�llom�ny.[J�r�si Hivatal], J�r�si_�llom�ny.Mez�7 AS Oszt�ly, "" AS Projekt, J�r�si_�llom�ny.[�NYR SZERVEZETI EGYS�G AZONOS�T�], J�r�si_�llom�ny.Mez�9 AS [Ell�tott feladat], J�r�si_�llom�ny.Mez�10 AS Kinevez�s, J�r�si_�llom�ny.[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;], J�r�si_�llom�ny.[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ], J�r�si_�llom�ny.[Heti munka�r�k sz�ma], J�r�si_�llom�ny.Mez�14 AS [Bet�lt�s ar�nya], J�r�si_�llom�ny.[Besorol�si fokozat k�d:], J�r�si_�llom�ny.[Besorol�si fokozat megnevez�se:], J�r�si_�llom�ny.[�ll�shely azonos�t�], J�r�si_�llom�ny.Mez�18 AS [Havi illetm�ny], J�r�si_�llom�ny.Mez�19 AS [Eu finansz�rozott], J�r�si_�llom�ny.Mez�20 AS [Illetm�ny forr�sa], J�r�si_�llom�ny.[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h], J�r�si_�llom�ny.[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp], J�r�si_�llom�ny.[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)], J�r�si_�llom�ny.[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is], J�r�si_�llom�ny.[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs], J�r�si_�llom�ny.Mez�26 AS [K�pes�t�st ad� v�gzetts�g], J�r�si_�llom�ny.Mez�27 AS KAB, J�r�si_�llom�ny.[KAB 001-3** Branch ID]
FROM J�r�si_�llom�ny;

#/#/#/
lkJ�r�siKorm�nyK�zpontos�tottUni�
#/#/
SELECT L�tsz�mUni�.Sorsz�m, L�tsz�mUni�.N�v, L�tsz�mUni�.Ad�azonos�t�, L�tsz�mUni�.[Sz�let�si �v \ �res �ll�s], L�tsz�mUni�.Neme, L�tsz�mUni�.[J�r�si Hivatal], L�tsz�mUni�.Oszt�ly, L�tsz�mUni�.[�NYR SZERVEZETI EGYS�G AZONOS�T�], L�tsz�mUni�.[Ell�tott feladat], L�tsz�mUni�.Kinevez�s, L�tsz�mUni�.[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;], L�tsz�mUni�.[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ], L�tsz�mUni�.[Heti munka�r�k sz�ma], L�tsz�mUni�.[Bet�lt�s ar�nya], L�tsz�mUni�.[Besorol�si fokozat k�d:], L�tsz�mUni�.[Besorol�si fokozat megnevez�se:], L�tsz�mUni�.[�ll�shely azonos�t�], L�tsz�mUni�.[Havi illetm�ny], L�tsz�mUni�.[Eu finansz�rozott], L�tsz�mUni�.[Illetm�ny forr�sa], L�tsz�mUni�.[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h], L�tsz�mUni�.[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp], L�tsz�mUni�.[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)], L�tsz�mUni�.[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is], L�tsz�mUni�.[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs], L�tsz�mUni�.[K�pes�t�st ad� v�gzetts�g], L�tsz�mUni�.KAB, L�tsz�mUni�.[KAB 001-3** Branch ID], IIf([Ad�azonos�t�] Is Null Or [Ad�azonos�t�]="",0,[Ad�azonos�t�]*1) AS Ad�jel, L�tsz�mUni�.Jelleg, TextToMD5Hex([�ll�shely azonos�t�]) AS Hash, Replace([J�r�si Hivatal],"budapest f�v�ros korm�nyhivatala","BFKH") AS F�oszt�ly, BFKH(L�tsz�mUni�.[�NYR SZERVEZETI EGYS�G AZONOS�T�]) AS BFKH
FROM (SELECT *, "A" as Jelleg
FROM lkJ�r�si_�llom�ny
UNION SELECT *, "A" as Jelleg
FROM lkKorm�nyhivatali_�llom�ny
UNION SELECT *, "K" as Jelleg
FROM lkK�zpontos�tottak
)  AS L�tsz�mUni�;

#/#/#/
lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d
#/#/
SELECT lkJ�r�siKorm�nyK�zpontos�tottUni�.*, bfkh(IIf([J�r�si Hivatal]=[Oszt�ly] Or [Oszt�ly] Is Null,[�NYR SZERVEZETI EGYS�G AZONOS�T�],strLev�g([�NYR SZERVEZETI EGYS�G AZONOS�T�],".") & ".")) AS F�oszt�lyk�d
FROM lkJ�r�siKorm�nyK�zpontos�tottUni�;

#/#/#/
lkKEHIOrvosiAlkalmass�gik2024_09_2024_12
#/#/
SELECT 789235 AS [PIR t�rzssz�m], "Budapest F�v�ros Korm�nyhivatala" AS [korm�nyzati igazgat�si szerv neve], [lkSzem�lyUtols�SzervezetiEgys�ge].[F�oszt�ly] & " " & [lkSzem�lyUtols�SzervezetiEgys�ge].[oszt�ly] AS [szervezeti egys�g neve], lkSzem�lyek.[Dolgoz� teljes neve] AS [csal�di �s ut�n�v], lkSzem�lyek.Ad�jel AS [ad�azonos�t� jel], Mid([Els�dleges feladatk�r],InStr(Nz([els�dleges Feladatk�r],""),"-")+1) AS [munkak�r / feladatk�r megnevez�se], lkSzem�lyUtols�SzervezetiEgys�ge.�NYR AS [�ll�shely �NYR azonos�t� sz�ma], lkSzervezeti�ll�shelyek.[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] AS [az �ll�shely besorol�sa], lkSzem�lyek.[Jogviszony t�pusa / jogviszony t�pus] AS [az �ll�shelyen fenn�ll� jogviszony t�pusa], t2024IVn�vbenVizsg�ltak.[orvosi vizsg�lathoz k�t�tt-e], "2024. III-IV. negyed�v" AS t�rgyid�szak, lkSzem�lyek.[Orvosi vizsg�lat id�pontja] AS [a vizsg�lat id�pontja], Replace(Replace([Orvosi vizsg�lat t�pusa],"Munk�bal�p�s el�tti","el�zetes"),"Munkak�r v�ltoz�s el�tti","soron k�v�li") AS [a vizsg�lat t�pusa], "-" AS Oszt�ly
FROM t2024IVn�vbenVizsg�ltak INNER JOIN (lkSzervezeti�ll�shelyek RIGHT JOIN (lkSzem�lyUtols�SzervezetiEgys�ge INNER JOIN lkSzem�lyek ON lkSzem�lyUtols�SzervezetiEgys�ge.Ad�jel = lkSzem�lyek.Ad�jel) ON lkSzervezeti�ll�shelyek.�ll�shelyAzonos�t� = lkSzem�lyUtols�SzervezetiEgys�ge.�NYR) ON t2024IVn�vbenVizsg�ltak.Ad�jel = lkSzem�lyek.Ad�jel;

#/#/#/
lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II
#/#/
SELECT 789235 AS [PIR t�rzssz�m], "Budapest F�v�ros Korm�nyhivatala" AS [korm�nyzati igazgat�si szerv neve], [lkSzem�lyUtols�SzervezetiEgys�ge].[F�oszt�ly] & " " & [lkSzem�lyUtols�SzervezetiEgys�ge].[oszt�ly] AS [szervezeti egys�g neve], lkSzem�lyek.[Dolgoz� teljes neve] AS [csal�di �s ut�n�v], lkSzem�lyek.Ad�jel AS [ad�azonos�t� jel], Mid([Els�dleges feladatk�r],InStr(Nz([els�dleges Feladatk�r],""),"-")+1) AS [munkak�r / feladatk�r megnevez�se], lkSzem�lyUtols�SzervezetiEgys�ge.�NYR AS [�ll�shely �NYR azonos�t� sz�ma], lkSzervezeti�ll�shelyek.[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] AS [az �ll�shely besorol�sa], lkSzem�lyek.[Jogviszony t�pusa / jogviszony t�pus] AS [az �ll�shelyen fenn�ll� jogviszony t�pusa], "2024. III-IV. negyed�v" AS t�rgyid�szak, lk2024_4_n�viElsz�mol�s.[Alk d�tuma] AS [a vizsg�lat id�pontja], lk2024_4_n�viElsz�mol�s.[alk tipus] AS [a vizsg�lat t�pusa], lk2024_4_n�viElsz�mol�s.Oszt�ly
FROM (lkSzervezeti�ll�shelyek RIGHT JOIN (lkSzem�lyUtols�SzervezetiEgys�ge INNER JOIN lkSzem�lyek ON lkSzem�lyUtols�SzervezetiEgys�ge.Ad�jel = lkSzem�lyek.Ad�jel) ON lkSzervezeti�ll�shelyek.�ll�shelyAzonos�t� = lkSzem�lyUtols�SzervezetiEgys�ge.�NYR) INNER JOIN lk2024_4_n�viElsz�mol�s ON lkSzem�lyek.[ad�jel] = lk2024_4_n�viElsz�mol�s.ad�jel;

#/#/#/
lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_IIa
#/#/
SELECT lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[PIR t�rzssz�m], lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[korm�nyzati igazgat�si szerv neve], lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[szervezeti egys�g neve], lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[csal�di �s ut�n�v], lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[ad�azonos�t� jel], lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[munkak�r / feladatk�r megnevez�se], lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[�ll�shely �NYR azonos�t� sz�ma], lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[az �ll�shely besorol�sa], lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[az �ll�shelyen fenn�ll� jogviszony t�pusa], Nz([t2024IVn�vbenVizsg�ltak].[orvosi vizsg�lathoz k�t�tt-e],[lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II].[oszt�ly]) AS orvosi, lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.t�rgyid�szak, lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[a vizsg�lat id�pontja], lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[a vizsg�lat t�pusa]
FROM lkKEHIOrvosiAlkalmass�gik2024_09_2024_12 RIGHT JOIN (t2024IVn�vbenVizsg�ltak RIGHT JOIN lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II ON t2024IVn�vbenVizsg�ltak.Ad�jel = lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[ad�azonos�t� jel]) ON lkKEHIOrvosiAlkalmass�gik2024_09_2024_12.[ad�azonos�t� jel] = lkKEHIOrvosiAlkalmass�gik2024_09_2024_12_II.[ad�azonos�t� jel]
WHERE (((lkKEHIOrvosiAlkalmass�gik2024_09_2024_12.[ad�azonos�t� jel]) Is Null));

#/#/#/
lkKil�p�Uni�
#/#/
SELECT DISTINCT Uni�2019_mostan�ig.Sorsz�m, Uni�2019_mostan�ig.N�v, Uni�2019_mostan�ig.Ad�azonos�t�, Uni�2019_mostan�ig.Alapl�tsz�m, Uni�2019_mostan�ig.[Megyei szint VAGY J�r�si Hivatal], Uni�2019_mostan�ig.Mez�5, Uni�2019_mostan�ig.Mez�6, Uni�2019_mostan�ig.[�NYR SZERVEZETI EGYS�G AZONOS�T�], Uni�2019_mostan�ig.Mez�8, Uni�2019_mostan�ig.[Besorol�si fokozat k�d:], Uni�2019_mostan�ig.[Besorol�si fokozat megnevez�se:], Uni�2019_mostan�ig.[�ll�shely azonos�t�], Uni�2019_mostan�ig.[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva], Uni�2019_mostan�ig.[Jogviszony kezd� d�tuma], Uni�2019_mostan�ig.[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja], Uni�2019_mostan�ig.[Illetm�ny (Ft/h�)], Uni�2019_mostan�ig.[V�gkiel�g�t�sre jogos�t� h�napok sz�ma], Uni�2019_mostan�ig.[Felment�si id� h�napok sz�ma], IIf([Megyei szint VAGY J�r�si Hivatal]="megyei szint",[Mez�5],[Megyei szint VAGY J�r�si Hivatal]) AS F�oszt�ly, Uni�2019_mostan�ig.tKil�p�kUni�.Mez�6 AS Oszt�ly, [ad�azonos�t�]*1 AS Ad�jel, *
FROM (SELECT  tKil�p�kUni�.Sorsz�m, tKil�p�kUni�.N�v, tKil�p�kUni�.Ad�azonos�t�, tKil�p�kUni�.Alapl�tsz�m, tKil�p�kUni�.[Megyei szint VAGY J�r�si Hivatal], tKil�p�kUni�.Mez�5, tKil�p�kUni�.Mez�6, tKil�p�kUni�.[�NYR SZERVEZETI EGYS�G AZONOS�T�], tKil�p�kUni�.Mez�8, tKil�p�kUni�.[Besorol�si fokozat k�d:], tKil�p�kUni�.[Besorol�si fokozat megnevez�se:], tKil�p�kUni�.[�ll�shely azonos�t�], tKil�p�kUni�.[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva], tKil�p�kUni�.[Jogviszony kezd� d�tuma], tKil�p�kUni�.[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja], tKil�p�kUni�.[Illetm�ny (Ft/h�)], tKil�p�kUni�.[V�gkiel�g�t�sre jogos�t� h�napok sz�ma], tKil�p�kUni�.[Felment�si id� h�napok sz�ma], �v
FROM tKil�p�kUni�
UNION
SELECT Kil�p�k.Sorsz�m, Kil�p�k.N�v, Kil�p�k.Ad�azonos�t�, Kil�p�k.Alapl�tsz�m, Kil�p�k.[Megyei szint VAGY J�r�si Hivatal], Kil�p�k.Mez�5, Kil�p�k.Mez�6, Kil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�], Kil�p�k.Mez�8, Kil�p�k.[Besorol�si fokozat k�d:], Kil�p�k.[Besorol�si fokozat megnevez�se:], Kil�p�k.[�ll�shely azonos�t�], Kil�p�k.[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva], Kil�p�k.[Jogviszony kezd� d�tuma], Kil�p�k.[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja], Kil�p�k.[Illetm�ny (Ft/h�)], Kil�p�k.[V�gkiel�g�t�sre jogos�t� h�napok sz�ma], Kil�p�k.[Felment�si id� h�napok sz�ma],Year(date()) as �v
FROM Kil�p�k)  AS Uni�2019_mostan�ig;

#/#/#/
lkKorm�nyhivatali_�llom�ny
#/#/
SELECT Korm�nyhivatali_�llom�ny.Sorsz�m, Korm�nyhivatali_�llom�ny.N�v, Korm�nyhivatali_�llom�ny.Ad�azonos�t�, Korm�nyhivatali_�llom�ny.Mez�4 AS [Sz�let�si �v \ �res �ll�s], Korm�nyhivatali_�llom�ny.Mez�5 AS Neme, Korm�nyhivatali_�llom�ny.Mez�6 AS F�oszt�ly, Korm�nyhivatali_�llom�ny.Mez�7 AS Oszt�ly, "" AS Projekt, Korm�nyhivatali_�llom�ny.[�NYR SZERVEZETI EGYS�G AZONOS�T�], Korm�nyhivatali_�llom�ny.Mez�9 AS [Ell�tott feladat], Korm�nyhivatali_�llom�ny.Mez�10 AS Kinevez�s, Korm�nyhivatali_�llom�ny.[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;], Korm�nyhivatali_�llom�ny.[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ], Korm�nyhivatali_�llom�ny.[Heti munka�r�k sz�ma], Korm�nyhivatali_�llom�ny.Mez�14 AS [Bet�lt�s ar�nya], Korm�nyhivatali_�llom�ny.[Besorol�si fokozat k�d:], Korm�nyhivatali_�llom�ny.[Besorol�si fokozat megnevez�se:], Korm�nyhivatali_�llom�ny.[�ll�shely azonos�t�], Korm�nyhivatali_�llom�ny.Mez�18 AS [Havi illetm�ny], Korm�nyhivatali_�llom�ny.Mez�19 AS [Eu finansz�rozott], Korm�nyhivatali_�llom�ny.Mez�20 AS [Illetm�ny forr�sa], Korm�nyhivatali_�llom�ny.[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h], Korm�nyhivatali_�llom�ny.[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp], Korm�nyhivatali_�llom�ny.[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)], Korm�nyhivatali_�llom�ny.[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is], Korm�nyhivatali_�llom�ny.[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs], Korm�nyhivatali_�llom�ny.Mez�26 AS [K�pes�t�st ad� v�gzetts�g], Korm�nyhivatali_�llom�ny.Mez�27 AS KAB, Korm�nyhivatali_�llom�ny.[KAB 001-3** Branch ID]
FROM Korm�nyhivatali_�llom�ny;

#/#/#/
lkK�vetkez�HaviBeutal�k
#/#/
SELECT lkSzem�lyek.[TAJ sz�m], lkSzem�lyek.F�oszt�ly, drel�re(z�r�jeltelen�t�([lkszem�lyek].[Dolgoz� teljes neve])) AS [Dolgoz� teljes neve], lkSzem�lyek.[Sz�let�si id�], lkSzem�lyek.[Sz�let�si hely], Trim(Replace(Replace([lkszem�lyek].[�lland� lakc�m],"Magyarorsz�g,","")," (levelez�si c�m is)","")) AS [�lland� lakc�m], lkSzem�lyek.[Hivatali email], tMunkak�r�k.Munkak�r, tMunkak�r�k.Munkak�rK�d, tE�Oszt�lyok.E�Oszt�ly, lkSzem�lyek.[Orvosi vizsg�lat k�vetkez� id�pontja], IIf([Orvosi vizsg�lat k�vetkez� id�pontja] Is Null Or [Orvosi vizsg�lat k�vetkez� id�pontja]<Date(),3,Month([Orvosi vizsg�lat k�vetkez� id�pontja])) AS h�, lkEg�szs�g�gyiVisszajelz�sekSzem�lyenk�ntUtols�.Azonos�t� AS NexonID, lkMunkak�rKock�zatPivot.[1_1] AS [1_1K�zi anyagmozgat�s (5kp-20kp)], lkMunkak�rKock�zatPivot.[1_2] AS [1_2K�zi anyagmozgat�s (20kp-50kp)], lkMunkak�rKock�zatPivot.[1_3] AS [1_3K�zi anyagmozgat�s (>50kp)], lkMunkak�rKock�zatPivot.[2_] AS [2_Fokozott baleseti vesz�ly], lkMunkak�rKock�zatPivot.[3_] AS [3_K�nyszertesthelyzet (g�rnyed�s, guggol�s)], lkMunkak�rKock�zatPivot.[4_] AS 4_�l�s, lkMunkak�rKock�zatPivot.[5_] AS 5_�ll�s, lkMunkak�rKock�zatPivot.[6_] AS 6_J�r�s, lkMunkak�rKock�zatPivot.[7_] AS [7_Terhel� munkahelyi kl�ma (meleg, hideg, nedves, v�ltoz�)], lkMunkak�rKock�zatPivot.[8_] AS 8_Zaj, lkMunkak�rKock�zatPivot.[9_] AS [9_Ioniz�l� sug�rz�s], lkMunkak�rKock�zatPivot.[10_] AS [10_Nem � ioniz�l� sug�rz�s], lkMunkak�rKock�zatPivot.[11_] AS [11_Helyileg hat� vibr�ci�], lkMunkak�rKock�zatPivot.[12_] AS [12_Eg�sztest vibr�ci�], lkMunkak�rKock�zatPivot.[13_] AS [13_Ergon�miai t�nyez�k], lkMunkak�rKock�zatPivot.[14_] AS [14_Porok megnevez�se], lkMunkak�rKock�zatPivot.[15_] AS [15_Vegyi anyagok], lkMunkak�rKock�zatPivot.[16_] AS [16_J�rv�ny�gyi �rdekb�l kiemelt munkak�r], lkMunkak�rKock�zatPivot.[17_] AS 17_Fert�z�svesz�ly, lkMunkak�rKock�zatPivot.[18_] AS [18_Fokozott pszich�s terhel�s], lkMunkak�rKock�zatPivot.[19_] AS [19_K�perny� el�tt v�gzett munka], lkMunkak�rKock�zatPivot.[20_] AS [20_�jszakai m�szakban v�gzett munka], lkMunkak�rKock�zatPivot.[21_] AS [21_Pszichoszoci�lis t�nyez�k], lkMunkak�rKock�zatPivot.[22_] AS [22_Egy�ni v�d�eszk�z �ltali terhel�s], lkMunkak�rKock�zatPivot.[23_] AS 23_Egy�b
FROM tE�Oszt�lyok INNER JOIN ((tMunkak�r�k INNER JOIN ((lkEg�szs�g�gyiVisszajelz�sekSzem�lyenk�ntUtols� INNER JOIN lkazNexonAd�jel02 ON lkEg�szs�g�gyiVisszajelz�sekSzem�lyenk�ntUtols�.azonos�t� = lkazNexonAd�jel02.[Szem�ly azonos�t�]) INNER JOIN lkSzem�lyek ON lkazNexonAd�jel02.Ad�jel = lkSzem�lyek.Ad�jel) ON tMunkak�r�k.Munkak�rK�d = lkEg�szs�g�gyiVisszajelz�sekSzem�lyenk�ntUtols�.�rt�k) LEFT JOIN lkMunkak�rKock�zatPivot ON tMunkak�r�k.azMunkak�r = lkMunkak�rKock�zatPivot.azMunkak�r) ON tE�Oszt�lyok.azE�Oszt�ly = tMunkak�r�k.azE�Oszt�ly
WHERE (((IIf([Orvosi vizsg�lat k�vetkez� id�pontja] Is Null Or [Orvosi vizsg�lat k�vetkez� id�pontja]<Date(),3,Month([Orvosi vizsg�lat k�vetkez� id�pontja])))=IIf(Day(Date())>10,Month(Date())+1,Month(Date()))));

#/#/#/
lkK�vetkez�OrvosiMaxFejenk�nt
#/#/
SELECT lkSzem�lyekOrvosiAdatok00.ad�jel, Max(IIf([lkSzem�lyekOrvosiAdatok00].[k�vetkez�] Is Null,#1/1/1900#,[lkSzem�lyekOrvosiAdatok00].[k�vetkez�])) AS K�vetkez�
FROM lkSzem�lyekOrvosiAdatok00
GROUP BY lkSzem�lyekOrvosiAdatok00.ad�jel;

#/#/#/
lkK�vetkez�OrvosiMaxJogviszonyMaxFejenk�nt
#/#/
SELECT lkSzem�lyekOrvosiAdatok00.Ad�jel, Max(lkSzem�lyekOrvosiAdatok00.[Jogviszony sorsz�ma]) AS [MaxOfJogviszony sorsz�ma]
FROM lkK�vetkez�OrvosiMaxFejenk�nt INNER JOIN lkSzem�lyekOrvosiAdatok00 ON (lkK�vetkez�OrvosiMaxFejenk�nt.K�vetkez� = lkSzem�lyekOrvosiAdatok00.K�vetkez�) AND (lkK�vetkez�OrvosiMaxFejenk�nt.ad�jel = lkSzem�lyekOrvosiAdatok00.Ad�jel)
GROUP BY lkSzem�lyekOrvosiAdatok00.Ad�jel;

#/#/#/
lkK�zpontos�tottak
#/#/
SELECT K�zpontos�tottak.Sorsz�m, K�zpontos�tottak.N�v, K�zpontos�tottak.Ad�azonos�t�, K�zpontos�tottak.Mez�4 AS [Sz�let�si �v \ �res �ll�s], "" AS Nem, Replace(IIf([Megyei szint VAGY J�r�si Hivatal]="Megyei szint",[K�zpontos�tottak].[Mez�6],[Megyei szint VAGY J�r�si Hivatal]),"Budapest F�v�ros Korm�nyhivatala ","BFKH ") AS F�oszt, K�zpontos�tottak.Mez�7 AS Oszt�ly, K�zpontos�tottak.[Projekt megnevez�se], K�zpontos�tottak.[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] AS [�NYR SZERVEZETI EGYS�G AZONOS�T�], K�zpontos�tottak.Mez�10 AS [Ell�tott feladat], K�zpontos�tottak.Mez�11 AS Kinevez�s, "SZ" AS [Feladat jellege], K�zpontos�tottak.[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ], 0 AS [Heti munka�r�k sz�ma], 1 AS [Bet�lt�s ar�nya], K�zpontos�tottak.[Besorol�si fokozat k�d:], K�zpontos�tottak.[Besorol�si fokozat megnevez�se:], K�zpontos�tottak.[�ll�shely azonos�t�], K�zpontos�tottak.Mez�17 AS [Havi illetm�ny], "" AS [Eu finansz�rozott], "" AS [Illetm�ny forr�sa], "" AS [Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h], K�zpontos�tottak.[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp], K�zpontos�tottak.[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)], K�zpontos�tottak.[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is], "" AS [�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs], "" AS [K�pes�t�st ad� v�gzetts�g], "" AS KAB, "" AS [KAB 001-3** Branch ID]
FROM K�zpontos�tottak
WHERE ((("")=True Or ("")='IIf([Neme]="N�";2;1)'));

#/#/#/
lkMunkak�rKock�zat
#/#/
SELECT tMunkak�r�k.Munkak�rK�d, tMunkak�r�k.Munkak�r, Replace([tKock�zatok].[Kock�zatiK�d],".","_") AS Kock�zatiK�d, tKock�zatok.Kock�zat, ktMunkak�rKock�zat.azMunkak�r, ktMunkak�rKock�zat.azKock�zat, ktMunkak�rKock�zat.TeljesMunkaid�ben AS 1
FROM tKock�zatok INNER JOIN (tMunkak�r�k INNER JOIN ktMunkak�rKock�zat ON tMunkak�r�k.azMunkak�r = ktMunkak�rKock�zat.azMunkak�r) ON tKock�zatok.azKock�zat = ktMunkak�rKock�zat.azKock�zat;

#/#/#/
lkMunkak�rKock�zatPivot
#/#/
TRANSFORM Sum(lkMunkak�rKock�zat.[1]) AS 1
SELECT lkMunkak�rKock�zat.azMunkak�r, lkMunkak�rKock�zat.Munkak�rK�d
FROM lkMunkak�rKock�zat
GROUP BY lkMunkak�rKock�zat.azMunkak�r, lkMunkak�rKock�zat.Munkak�rK�d
PIVOT lkMunkak�rKock�zat.Kock�zatiK�d In ("5_","12_","23_","22_","20_","13_","17_","2_","18_","11_","9_","6_","16_","3_","19_","1_3","1_2","1_1","10_","14_","21_","7_","4_","15_","8_");

#/#/#/
lkMunkak�r�kEl�fordul�sa
#/#/
SELECT DISTINCT lkMunkak�r�kEl�fordul�saF�oszt�lyonk�nt.Munkak�rK�d, lkMunkak�r�kEl�fordul�saF�oszt�lyonk�nt.Munkak�r
FROM lkMunkak�r�kEl�fordul�saF�oszt�lyonk�nt;

#/#/#/
lkMunkak�r�kEl�fordul�saF�oszt�lyonk�nt
#/#/
SELECT DISTINCT tBej�v��zenetek.SenderEmailAddress, Szem�lyek.F�oszt�ly AS F�oszt�ly, tMunkak�r�k.Munkak�rK�d, tMunkak�r�k.Munkak�r
FROM ((((SELECT lkSzem�lyek.[Hivatali email], lkSzem�lyek.[F�oszt�lyK�d] AS F�oszt�ly FROM lkSzem�lyek UNION SELECT Email, F�oszt�lyk�d FROM tKieg�sz�t�EmailC�mek )  AS Szem�lyek RIGHT JOIN tBej�v��zenetek ON Szem�lyek.[Hivatali email] = tBej�v��zenetek.SenderEmailAddress) INNER JOIN lkEg�szs�g�gyiVisszajelz�sekSzem�lyek ON tBej�v��zenetek.az�zenet = lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.az�zenet) INNER JOIN tMunkak�r�k ON lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.�rt�k = tMunkak�r�k.Munkak�rK�d) LEFT JOIN tEgyesMunkak�r�kF�oszt�lyai ON Szem�lyek.F�oszt�ly = tEgyesMunkak�r�kF�oszt�lyai.F�oszt�ly
ORDER BY Szem�lyek.F�oszt�ly, tMunkak�r�k.Munkak�r;

#/#/#/
lkMunkak�r�kF�oszt�lyJSON
#/#/
SELECT DISTINCT lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d.BFKH, Replace([J�r�si Hivatal],"Budapest F�v�ros Korm�nyhivatala","BFKH") AS F�oszt�ly, "{ id: """ & Nz([Szem�ly azonos�t�],[�ll�shely azonos�t�]) & """, neve: """ & N�([lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d].[N�v],"Bet�ltetlen �ll�shely (" & [�ll�shely azonos�t�] & ")") & " (" & [lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d].[Oszt�ly] & ")" & """ }," AS Json, lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d.Oszt�ly, drh�tra([lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d].[n�v]) AS N�v, lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d.Oszt�ly, tNexonAzonos�t�k.[Szem�ly azonos�t�]
FROM tEgyesMunkak�r�kF�oszt�lyai INNER JOIN (lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d LEFT JOIN tNexonAzonos�t�k ON lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d.Ad�azonos�t� = tNexonAzonos�t�k.[Ad�azonos�t� jel]) ON tEgyesMunkak�r�kF�oszt�lyai.F�oszt�ly = lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d.F�oszt�lyk�d
WHERE (((lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d.Oszt�ly) Like "*" & [tEgyesMunkak�r�kF�oszt�lyai].[Oszt�ly] & "*"))
ORDER BY lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d.BFKH, drh�tra([lkJ�r�siKorm�nyK�zpontos�tottUni�F�osztK�d].[n�v]);

#/#/#/
lkMunkak�r�kJson
#/#/
SELECT "{ ""id"": """ & [Munkak�rK�d] & """, ""neve"": """ & [Munkak�r] & """ }," AS Json
FROM tMunkak�r�k
ORDER BY tMunkak�r�k.Munkak�r;

#/#/#/
lkMunkak�r�kK�rlev�lC�mzettek00
#/#/
SELECT DISTINCT bfkh([F�oszt�lyK�d]) AS BFKHF�osztK�d, lkSzem�lyek.F�oszt�ly AS Kif1, lkSzem�lyek.[Dolgoz� teljes neve] AS Kif2, IIf([Neme]="f�rfi","�r","Asszony") AS Megsz�l�t�s, Replace(Nz([Besorol�si  fokozat (KT)],""),"J�r�si / ker�leti hivatal vezet�je","Hivatalvezet�") AS C�m, lkSzem�lyek.[Hivatali email] AS Kif3, lkSzem�lyek.Ad�jel AS Kif4
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely") And ((lkSzem�lyek.[Besorol�si  fokozat (KT)])="J�r�si / ker�leti hivatal vezet�je")) Or (((lkSzem�lyek.[St�tusz neve])="�ll�shely") And ((lkSzem�lyek.[Besorol�si  fokozat (KT)])="F�oszt�lyvezet�")) Or (((bfkh([F�oszt�lyK�d]))="BFKH.01.14") And ((lkSzem�lyek.[St�tusz neve])="�ll�shely") And ((lkSzem�lyek.[Besorol�si  fokozat (KT)])="oszt�lyvezet�"));

#/#/#/
lkMunkak�r�kK�rlev�lC�mzettek01
#/#/
SELECT DISTINCT lkMunkak�r�kK�rlev�lC�mzettek00.BFKHF�osztK�d, lkMunkak�r�kK�rlev�lC�mzettek00.F�oszt�ly, lkMunkak�r�kK�rlev�lC�mzettek00.Ad�jel, lkMunkak�r�kK�rlev�lC�mzettek00.[Dolgoz� teljes neve] AS N�v, lkMunkak�r�kK�rlev�lC�mzettek00.Megsz�l�t�s, lkMunkak�r�kK�rlev�lC�mzettek00.C�m, lkMunkak�r�kK�rlev�lC�mzettek00.[Hivatali email], lkMunkak�r�kK�rlev�lCsakALegfrissebbMaiMell�kletek.�tvonal
FROM lkMunkak�r�kK�rlev�lCsakALegfrissebbMaiMell�kletek INNER JOIN (tEgyesMunkak�r�kF�oszt�lyai INNER JOIN lkMunkak�r�kK�rlev�lC�mzettek00 ON tEgyesMunkak�r�kF�oszt�lyai.F�oszt�ly = lkMunkak�r�kK�rlev�lC�mzettek00.BFKHF�osztK�d) ON lkMunkak�r�kK�rlev�lCsakALegfrissebbMaiMell�kletek.F�oszt�lyNeve = lkMunkak�r�kK�rlev�lC�mzettek00.F�oszt�ly;

#/#/#/
lkMunkak�r�kK�rlev�lCsakALegfrissebbMaiMell�kletek
#/#/
SELECT DISTINCT tMunkak�rK�rlev�lMell�klet�tvonalak.azMell�klet, tMunkak�rK�rlev�lMell�klet�tvonalak.F�oszt�lyNeve, tMunkak�rK�rlev�lMell�klet�tvonalak.�tvonal, tMunkak�rK�rlev�lMell�klet�tvonalak.K�sz�lt, DateValue([K�sz�lt]) AS D�tum
FROM tMunkak�rK�rlev�lMell�klet�tvonalak
WHERE (((tMunkak�rK�rlev�lMell�klet�tvonalak.K�sz�lt)=(Select Max([K�sz�lt]) from [tMunkak�rK�rlev�lMell�klet�tvonalak] as tmp where [tMunkak�rK�rlev�lMell�klet�tvonalak].[F�oszt�lyNeve]=tmp.f�oszt�lyneve)) AND ((DateValue([K�sz�lt]))=Date()));

#/#/#/
lkNexonAzonos�t�k
#/#/
SELECT tNexonAzonos�t�k.Azonos�t�, [Ad�azonos�t� jel]*1 AS Ad�jel, tNexonAzonos�t�k.[Szem�ly azonos�t�], tNexonAzonos�t�k.[HR kapcsolat azonos�t�], tNexonAzonos�t�k.N�v, tNexonAzonos�t�k.[Ad�azonos�t� jel], tNexonAzonos�t�k.[TAJ sz�m], tNexonAzonos�t�k.[Egyedi azonos�t�], tNexonAzonos�t�k.T�rzssz�m, tNexonAzonos�t�k.[Jogviszony t�pus], dt�tal([tNexonAzonos�t�k].[Kezdete]) AS Kezdete, dt�tal([tNexonAzonos�t�k].[V�ge]) AS V�ge, tNexonAzonos�t�k.[Szervezeti egys�g], tNexonAzonos�t�k.[Szervezeti egys�g kateg�ria], tNexonAzonos�t�k.Munkak�r, tNexonAzonos�t�k.St�tusz, tNexonAzonos�t�k.T�rt�netiSorsz�m, (SELECT COUNT(tnexonazonos�t�k.Azonos�t�) 
        FROM tNexonAzonos�t�k AS Tmp 
        Where (Tmp.Kezdete >= tNexonAzonos�t�k.Kezdete
        AND Tmp.[Szem�ly azonos�t�] = tNexonAzonos�t�k.[Szem�ly azonos�t�]) AND  Tmp.[Azonos�t�] > tNexonAzonos�t�k.[Azonos�t�]
)+1 AS Sorsz�m
FROM tNexonAzonos�t�k;

#/#/#/
lkNexonID_Email
#/#/
SELECT DISTINCT lkazNexonAd�jel02.[Szem�ly azonos�t�] AS NexonID, lkSzem�lyek.[Hivatali email] AS Email
FROM lkSzem�lyek INNER JOIN lkazNexonAd�jel02 ON lkSzem�lyek.Ad�jel = lkazNexonAd�jel02.Ad�jel
WHERE (((lkSzem�lyek.[Hivatali email]) Is Not Null))
ORDER BY lkazNexonAd�jel02.[Szem�ly azonos�t�];

#/#/#/
lkOrvosiAlkalmass�giD�jt�telekE�Oszt�lyonk�ntiMax
#/#/
SELECT tOrvosiAlkalmass�giD�jt�telek.Alkalmass�giOszt�ly, Max(tOrvosiAlkalmass�giD�jt�telek.D�jt�tel) AS MaxOfD�jt�tel
FROM tOrvosiAlkalmass�giD�jt�telek
GROUP BY tOrvosiAlkalmass�giD�jt�telek.Alkalmass�giOszt�ly;

#/#/#/
lkSorsz�mok
#/#/
SELECT ([1]+[10]+[100]+[1000]+[10000]) AS Sorsz�m
FROM (SELECT [1].Sz�m*1 AS 1, [10].Sz�m*10 AS 10, [100].Sz�m*100 AS 100, [1000].Sz�m*1000 AS 1000, [10000].Sz�m*10^4 AS 10000 FROM lkSz�mok AS 1, lkSz�mok AS 10, lkSz�mok AS 100, lkSz�mok AS 1000, lkSz�mok AS 10000)  AS helyi�rt�kek;

#/#/#/
lkSz�mok
#/#/
SELECT DISTINCT [Id] Mod 10 AS Sz�m
FROM MSysObjects
WHERE ((([Id] Mod 10) Between 0 And 9));

#/#/#/
lkSzem�lyek
#/#/
SELECT tSzem�lyek.*, Replace(Nz(IIf(IsNull([tSzem�lyek].[Szint 6 szervezeti egys�g n�v]),IIf(IsNull([tSzem�lyek].[Szint 5 szervezeti egys�g n�v]),IIf(IsNull([tSzem�lyek].[Szint 7 szervezeti egys�g n�v]),IIf(IsNull([tSzem�lyek].[Szint 4 szervezeti egys�g n�v]),IIf(IsNull([tSzem�lyek].[Szint 3 szervezeti egys�g n�v]),[tSzem�lyek].[Szint 2 szervezeti egys�g n�v] & "",[tSzem�lyek].[Szint 3 szervezeti egys�g n�v] & ""),[tSzem�lyek].[Szint 4 szervezeti egys�g n�v] & ""),[tSzem�lyek].[Szint 7 szervezeti egys�g n�v] & ""),[tSzem�lyek].[Szint 5 szervezeti egys�g n�v] & ""),[tSzem�lyek].[Szint 6 szervezeti egys�g n�v] & ""),""),"Budapest F�v�ros Korm�nyhivatala ","BFKH ") & "" AS F�oszt�ly, bfkh(Replace(Nz(IIf(IsNull([tSzem�lyek].[Szint 6 szervezeti egys�g k�d]),IIf(IsNull([tSzem�lyek].[Szint 5 szervezeti egys�g k�d]),IIf(IsNull([tSzem�lyek].[Szint 7 szervezeti egys�g k�d]),IIf(IsNull([tSzem�lyek].[Szint 4 szervezeti egys�g k�d]),IIf(IsNull([tSzem�lyek].[Szint 3 szervezeti egys�g k�d]),[tSzem�lyek].[Szint 2 szervezeti egys�g k�d] & "",[tSzem�lyek].[Szint 3 szervezeti egys�g k�d] & ""),[tSzem�lyek].[Szint 4 szervezeti egys�g k�d] & ""),[tSzem�lyek].[Szint 7 szervezeti egys�g k�d] & ""),[tSzem�lyek].[Szint 5 szervezeti egys�g k�d] & ""),[tSzem�lyek].[Szint 6 szervezeti egys�g k�d] & ""),""),"Budapest F�v�ros Korm�nyhivatala ","BFKH ")) AS F�oszt�lyK�d, IIf([f�oszt�ly]=[Szint 7 szervezeti egys�g n�v],"",[Szint 7 szervezeti egys�g n�v] & "") AS Oszt�ly, Replace(Nz([Munkav�gz�s helye - c�m],"")," .",".") AS Munkav�gz�sC�me, tSzem�lyek.[besorol�si  fokozat (KT)] AS Besorol�s, Replace(Nz([tszem�lyek].[Besorol�si  fokozat (KT)],Nz([tBesorol�s�talak�t�Elt�r�Besorol�shoz].[Besorol�si  fokozat (KT)],"")),"/ ","") AS Besorol�s2, bfkh(Nz([szervezeti egys�g k�dja],0)) AS BFKH, Replace([Feladatk�r],"Lez�rt_","") AS Feladat, Nz([Iskolai v�gzetts�g foka],"-") AS V�gzetts�gFok, tSzem�lyek.[Sz�let�si id�] AS Sz�let�siIdeje, tSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)] AS Kil�p�sD�tuma, Nz([tSzem�lyek].[TAJ sz�m],0)*1 AS TAJ, [T�rzssz�m]*1 AS Sz�mT�rzsSz�m
FROM (tSzem�lyek LEFT JOIN lk�ll�shelyek ON tSzem�lyek.[St�tusz k�dja] = lk�ll�shelyek.[�ll�shely azonos�t�]) LEFT JOIN tBesorol�s�talak�t�Elt�r�Besorol�shoz ON lk�ll�shelyek.[�ll�shely besorol�si kateg�ri�ja] = tBesorol�s�talak�t�Elt�r�Besorol�shoz.[�ll�shely besorol�si kateg�ri�ja]
WHERE ((((SELECT Max(IIf(Tmp.[Jogviszony v�ge (kil�p�s d�tuma)]=0,#01/01/3000#,Tmp.[Jogviszony v�ge (kil�p�s d�tuma)])) AS [MaxOfJogviszony sorsz�ma]         FROM tSzem�lyek as Tmp         WHERE tSzem�lyek.Ad�jel=Tmp.Ad�jel         GROUP BY Tmp.Ad�jel     ))=IIf([Jogviszony v�ge (kil�p�s d�tuma)]=0,#1/1/3000#,[Jogviszony v�ge (kil�p�s d�tuma)])))
ORDER BY tSzem�lyek.[Dolgoz� teljes neve];

#/#/#/
lkSzem�lyekNemMegb�z�s�sNemSzem�lyesJelenl�t
#/#/
SELECT tSzem�lyek.*, Replace(Nz(IIf(IsNull([tSzem�lyek].[Szint 6 szervezeti egys�g n�v]),IIf(IsNull([tSzem�lyek].[Szint 5 szervezeti egys�g n�v]),IIf(IsNull([tSzem�lyek].[Szint 7 szervezeti egys�g n�v]),IIf(IsNull([tSzem�lyek].[Szint 4 szervezeti egys�g n�v]),IIf(IsNull([tSzem�lyek].[Szint 3 szervezeti egys�g n�v]),[tSzem�lyek].[Szint 2 szervezeti egys�g n�v] & "",[tSzem�lyek].[Szint 3 szervezeti egys�g n�v] & ""),[tSzem�lyek].[Szint 4 szervezeti egys�g n�v] & ""),[tSzem�lyek].[Szint 7 szervezeti egys�g n�v] & ""),[tSzem�lyek].[Szint 5 szervezeti egys�g n�v] & ""),[tSzem�lyek].[Szint 6 szervezeti egys�g n�v] & ""),""),"Budapest F�v�ros Korm�nyhivatala ","BFKH ") & "" AS F�oszt�ly, Replace(Nz(IIf(IsNull([tSzem�lyek].[Szint 6 szervezeti egys�g k�d]),IIf(IsNull([tSzem�lyek].[Szint 5 szervezeti egys�g k�d]),IIf(IsNull([tSzem�lyek].[Szint 7 szervezeti egys�g k�d]),IIf(IsNull([tSzem�lyek].[Szint 4 szervezeti egys�g k�d]),IIf(IsNull([tSzem�lyek].[Szint 3 szervezeti egys�g k�d]),[tSzem�lyek].[Szint 2 szervezeti egys�g k�d] & "",[tSzem�lyek].[Szint 3 szervezeti egys�g k�d] & ""),[tSzem�lyek].[Szint 4 szervezeti egys�g k�d] & ""),[tSzem�lyek].[Szint 7 szervezeti egys�g k�d] & ""),[tSzem�lyek].[Szint 5 szervezeti egys�g k�d] & ""),[tSzem�lyek].[Szint 6 szervezeti egys�g k�d] & ""),""),"Budapest F�v�ros Korm�nyhivatala ","BFKH ") AS F�oszt�lyK�d, IIf([f�oszt�ly]=[Szint 7 szervezeti egys�g n�v],"",[Szint 7 szervezeti egys�g n�v] & "") AS Oszt�ly, Replace(Nz([Munkav�gz�s helye - c�m],"")," .",".") AS Munkav�gz�sC�me, tSzem�lyek.[besorol�si  fokozat (KT)] AS Besorol�s, Replace(Nz([tszem�lyek].[Besorol�si  fokozat (KT)],Nz([tBesorol�s�talak�t�Elt�r�Besorol�shoz].[Besorol�si  fokozat (KT)],"")),"/ ","") AS Besorol�s2, bfkh(Nz([szervezeti egys�g k�dja],0)) AS BFKH, Replace([Feladatk�r],"Lez�rt_","") AS Feladat, Nz([Iskolai v�gzetts�g foka],"-") AS V�gzetts�gFok, tSzem�lyek.[Sz�let�si id�] AS Sz�let�siIdeje, dt�tal([Jogviszony v�ge (kil�p�s d�tuma)]) AS Kil�p�sD�tuma, Nz([tSzem�lyek].[TAJ sz�m],0)*1 AS TAJ, [T�rzssz�m]*1 AS Sz�mT�rzsSz�m
FROM (tSzem�lyek LEFT JOIN lk�ll�shelyek ON tSzem�lyek.[St�tusz k�dja] = lk�ll�shelyek.[�ll�shely azonos�t�]) LEFT JOIN tBesorol�s�talak�t�Elt�r�Besorol�shoz ON lk�ll�shelyek.[�ll�shely besorol�si kateg�ri�ja] = tBesorol�s�talak�t�Elt�r�Besorol�shoz.[�ll�shely besorol�si kateg�ri�ja]
WHERE ((((SELECT Max(iif(Nz(Tmp.[Jogviszony v�ge (kil�p�s d�tuma)],0)=0,#01/01/3000#,Tmp.[Jogviszony v�ge (kil�p�s d�tuma)])) AS [MaxOfJogviszony sorsz�ma]   FROM tSzem�lyek as Tmp         WHERE tSzem�lyek.Ad�jel=Tmp.Ad�jel AND
[Jogviszony t�pusa / jogviszony t�pus]<>"megb�z�sos"
AND
[Jogviszony t�pusa / jogviszony t�pus]<>"szem�lyes jelenl�t"
GROUP BY Tmp.Ad�jel  ))=IIf(Nz([Jogviszony v�ge (kil�p�s d�tuma)],0)=0,#1/1/3000#,[Jogviszony v�ge (kil�p�s d�tuma)])))
ORDER BY tSzem�lyek.[Dolgoz� teljes neve];

#/#/#/
lkSzem�lyekOrvosiAdatok
#/#/
SELECT DISTINCT lkSzem�lyUtols�SzervezetiEgys�ge.F�oszt�ly, lkSzem�lyekOrvosiAdatok00.[Dolgoz� teljes neve], lkSzem�lyekOrvosiAdatok00.Ad�jel, lkSzem�lyekOrvosiAdatok00.[TAJ sz�m], lkSzem�lyekOrvosiAdatok00.[Ad�azonos�t� jel], lkSzem�lyekOrvosiAdatok00.[Orvosi vizsg�lat id�pontja], lkSzem�lyekOrvosiAdatok00.[Orvosi vizsg�lat t�pusa], lkSzem�lyekOrvosiAdatok00.[Orvosi vizsg�lat eredm�nye], lkSzem�lyekOrvosiAdatok00.[Orvosi vizsg�lat �szrev�telek], lkSzem�lyekOrvosiAdatok00.K�vetkez�, lkSzem�lyekOrvosiAdatok00.F�oszt�lyK�d, lkSzem�lyekOrvosiAdatok00.BFKH, lkSzem�lyekOrvosiAdatok00.[Jogviszony t�pusa / jogviszony t�pus], lkSzem�lyekOrvosiAdatok00.[Tart�s t�voll�t t�pusa], lkSzem�lyekOrvosiAdatok00.[Jogviszony sorsz�ma], lkSzem�lyekOrvosiAdatok00.Bel�p�s, lkSzem�lyekOrvosiAdatok00.Kil�p�s, lkSzem�lyekOrvosiAdatok00.NexonID, lkSzem�lyekOrvosiAdatok00.[st�tusz k�dja] AS [st�tusz k�dja], lkSzem�lyUtols�SzervezetiEgys�ge.Oszt�ly
FROM (lkSzem�lyekOrvosiAdatok00 INNER JOIN lkK�vetkez�OrvosiMaxJogviszonyMaxFejenk�nt ON (
      lkSzem�lyekOrvosiAdatok00.Ad�jel = lkK�vetkez�OrvosiMaxJogviszonyMaxFejenk�nt.Ad�jel
    ) AND (
      lkSzem�lyekOrvosiAdatok00.[Jogviszony sorsz�ma] = lkK�vetkez�OrvosiMaxJogviszonyMaxFejenk�nt.[MaxOfJogviszony sorsz�ma]
    )) INNER JOIN lkSzem�lyUtols�SzervezetiEgys�ge ON lkSzem�lyekOrvosiAdatok00.Ad�jel = lkSzem�lyUtols�SzervezetiEgys�ge.Ad�jel;

#/#/#/
lkSzem�lyekOrvosiAdatok00
#/#/
SELECT DISTINCT Replace(
    Nz(
      IIf(
        IsNull(
          [tSzem�lyek].[Szint 6 szervezeti egys�g n�v]
        ), 
        IIf(
          IsNull(
            [tSzem�lyek].[Szint 5 szervezeti egys�g n�v]
          ), 
          IIf(
            IsNull(
              [tSzem�lyek].[Szint 7 szervezeti egys�g n�v]
            ), 
            IIf(
              IsNull(
                [tSzem�lyek].[Szint 4 szervezeti egys�g n�v]
              ), 
              IIf(
                IsNull(
                  [tSzem�lyek].[Szint 3 szervezeti egys�g n�v]
                ), 
                [tSzem�lyek].[Szint 2 szervezeti egys�g n�v], 
                [tSzem�lyek].[Szint 3 szervezeti egys�g n�v]
              ), 
              [tSzem�lyek].[Szint 4 szervezeti egys�g n�v]
            ), 
            [tSzem�lyek].[Szint 7 szervezeti egys�g n�v]
          ), 
          [tSzem�lyek].[Szint 5 szervezeti egys�g n�v]
        ), 
        [tSzem�lyek].[Szint 6 szervezeti egys�g n�v]
      ), 
      ""
    ), 
    "Budapest F�v�ros Korm�nyhivatala ", 
    "BFKH "
  ) AS F�oszt�ly, tSzem�lyek.[Dolgoz� teljes neve], tSzem�lyek.Ad�jel, tSzem�lyek.[TAJ sz�m], tSzem�lyek.[Ad�azonos�t� jel], tSzem�lyek.[Orvosi vizsg�lat id�pontja], tSzem�lyek.[Orvosi vizsg�lat t�pusa], tSzem�lyek.[Orvosi vizsg�lat eredm�nye], tSzem�lyek.[Orvosi vizsg�lat �szrev�telek], (
    [tSzem�lyek].[Orvosi vizsg�lat k�vetkez� id�pontja]
  ) AS K�vetkez�, Replace(
    Nz(
      IIf(
        IsNull(
          [tSzem�lyek].[Szint 6 szervezeti egys�g k�d]
        ), 
        IIf(
          IsNull(
            [tSzem�lyek].[Szint 5 szervezeti egys�g k�d]
          ), 
          IIf(
            IsNull(
              [tSzem�lyek].[Szint 7 szervezeti egys�g k�d]
            ), 
            IIf(
              IsNull(
                [tSzem�lyek].[Szint 4 szervezeti egys�g k�d]
              ), 
              IIf(
                IsNull(
                  [tSzem�lyek].[Szint 3 szervezeti egys�g k�d]
                ), 
                [tSzem�lyek].[Szint 2 szervezeti egys�g k�d], 
                [tSzem�lyek].[Szint 3 szervezeti egys�g k�d]
              ), 
              [tSzem�lyek].[Szint 4 szervezeti egys�g k�d]
            ), 
            [tSzem�lyek].[Szint 7 szervezeti egys�g k�d]
          ), 
          [tSzem�lyek].[Szint 5 szervezeti egys�g k�d]
        ), 
        [tSzem�lyek].[Szint 6 szervezeti egys�g k�d]
      ), 
      ""
    ), 
    "Budapest F�v�ros Korm�nyhivatala ", 
    "BFKH "
  ) AS F�oszt�lyK�d, tSzem�lyek.[Szervezeti egys�g k�dja] AS BFKH, tSzem�lyek.[Jogviszony t�pusa / jogviszony t�pus], tSzem�lyek.[Tart�s t�voll�t t�pusa], tSzem�lyek.[Jogviszony sorsz�ma], (
    [Jogviszony kezdete (bel�p�s d�tuma) ]
  ) AS Bel�p�s, (
    [Jogviszony v�ge (kil�p�s d�tuma) ]
  ) AS Kil�p�s, lkNexonAzonos�t�k.[Szem�ly azonos�t�] AS NexonID, tSzem�lyek.[St�tusz k�dja], IIf(
    [f�oszt�ly] = [Szint 7 szervezeti egys�g n�v], 
    "", [Szint 7 szervezeti egys�g n�v] & ""
  ) AS Oszt�ly
FROM lkNexonAzonos�t�k RIGHT JOIN tSzem�lyek ON lkNexonAzonos�t�k.Ad�jel = tSzem�lyek.Ad�jel;

#/#/#/
lkSzem�lyUtols�SzervezetiEgys�ge
#/#/
SELECT lkSzem�lyek.Ad�jel, lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)], IIf(lkSzem�lyek.f�oszt�ly="" Or lkSzem�lyek.f�oszt�ly Is Null,IIf(lkKil�p�Uni�.f�oszt�ly="","-",lkKil�p�Uni�.f�oszt�ly),lkSzem�lyek.f�oszt�ly) AS F�oszt�ly, IIf(lkSzem�lyek.oszt�ly="",IIf(lkKil�p�Uni�.oszt�ly="","-",lkKil�p�Uni�.oszt�ly),lkSzem�lyek.oszt�ly) AS Oszt�ly, IIf(lkSzem�lyek.f�oszt�lyk�d="",[�nyr szervezeti egys�g azonos�t�],lkSzem�lyek.f�oszt�lyk�d) AS F�oszt�lyK�d, IIf([St�tusz k�dja] Is Null,[�ll�shely azonos�t�],[St�tusz k�dja]) AS �NYR
FROM lkSzem�lyek LEFT JOIN lkKil�p�Uni� ON (lkSzem�lyek.Ad�jel = lkKil�p�Uni�.Ad�jel) AND (lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)] = lkKil�p�Uni�.[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja]);

#/#/#/
lkSzervezeti�ll�shelyek
#/#/
SELECT tSzervezeti.OSZLOPOK, bfkh(Nz([tSzervezeti].[Sz�l� szervezeti egys�g�nek k�dja],"")) AS SzervezetK�d, tSzervezeti.[Sz�l� szervezeti egys�g�nek k�dja], tSzervezeti.[Szervezetmenedzsment k�d] AS �ll�shelyAzonos�t�, IIf([Szervezeti egys�g�nek szintje]=7 And [Szint3 - k�d]="",[Sz�l� szervezeti egys�g�nek k�dja],IIf([Szint6 - k�d]="",IIf([Szint5 - k�d]="",IIf([Szint4 - k�d]="",IIf([Szint3 - k�d]="",[Szint2 - k�d],[Szint3 - k�d]),[Szint4 - k�d]),[Szint5 - k�d]),[Szint6 - k�d])) AS F�oszt�lyK�d, tSzervezeti.[Megnevez�s sz�t�relem k�dja], tSzervezeti.N�v, tSzervezeti.[�rv�nyess�g kezdete], tSzervezeti.[�rv�nyess�g v�ge], tSzervezeti.[K�lts�ghely k�d], tSzervezeti.[K�lts�ghely megnevez�s], tSzervezeti.[Szervezeti egys�g�nek szintje], tSzervezeti.[Sz�l� szervezeti egys�g�nek k�dja], tSzervezeti.[Szervezeti egys�g�nek megnevez�se], tSzervezeti.[Szervezeti egys�g�nek vezet�je], tSzervezeti.[Szervezeti egys�g�nek vezet�j�nek azonos�t�ja], tSzervezeti.[A k�lts�ghely elt�r a szervezeti egys�g�nek k�lts�ghelyt�l?], tSzervezeti.[Szervezeti munkak�r�nek k�dja], tSzervezeti.[Szervezeti munkak�r�nek megnevez�se], tSzervezeti.[A k�lts�ghely elt�r a szervezeti munkak�r�nek k�lts�ghely�t�l?], tSzervezeti.[Vezet�i st�tusz], tSzervezeti.[Helyettes vezet�-e], tSzervezeti.[Tervezett bet�lt�si adatok - Jogviszony t�pus], tSzervezeti.[Tervezett bet�lt�si adatok - Kulcssz�m k�d], tSzervezeti.[Tervezett bet�lt�si adatok - Kulcssz�m megnevez�s], tSzervezeti.[Tervezett bet�lt�si adatok - El�meneteli fokozat k�d], tSzervezeti.[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s], tSzervezeti.[P�ly�ztat�s hat�rideje], tSzervezeti.[Vezet�i beoszt�s KT], tSzervezeti.[P�ly�ztat�s alatt �ll], tSzervezeti.Megjegyz�s, tSzervezeti.[St�tusz enged�lyezett �rasz�ma], tSzervezeti.[St�tusz enged�lyezett FTE (�zleti param�ter szerint sz�molva)], tSzervezeti.[�tmeneti �rasz�m], tSzervezeti.[�tmeneti l�tsz�m (FTE)], tSzervezeti.[K�zz�tett hierarchi�ban megjelen�tend�], tSzervezeti.[Asszisztens st�tusz], tSzervezeti.[L�tsz�mon fel�l l�trehozott st�tusz], tSzervezeti.[St�tusz t�pusa], tSzervezeti.[St�tusz bet�lt�si �rasz�ma], tSzervezeti.[St�tusz bet�lt�si FTE], tSzervezeti.[St�tusz bet�lt�si �rasz�ma minusz st�tusz enged�lyezett �rasz�ma], tSzervezeti.[St�tusz bet�lt�si FTE minusz st�tusz enged�lyezett FTE], tSzervezeti.[Mi�ta bet�ltetlen a st�tusz (d�tum)], tSzervezeti.[H�ny napja bet�ltetlen (munkanap, alapnapt�r alapj�n)], tSzervezeti.[Szint1 - k�d], tSzervezeti.[Szint1 - le�r�s], tSzervezeti.[Szint2 - k�d], tSzervezeti.[Szint2 - le�r�s], tSzervezeti.[Szint3 - k�d], tSzervezeti.[Szint3 - le�r�s], tSzervezeti.[Szint4 - k�d], tSzervezeti.[Szint4 - le�r�s], tSzervezeti.[Szint5 - k�d], tSzervezeti.[Szint5 - le�r�s], tSzervezeti.[Szint6 - k�d], tSzervezeti.[Szint6 - le�r�s], tSzervezeti.[Szint7 - k�d], tSzervezeti.[Szint7 - le�r�s], tSzervezeti.[Szint8 - k�d], tSzervezeti.[Szint8 - le�r�s], Replace(Choose(IIf([Szervezeti egys�g�nek szintje]>6,IIf([tSzervezeti].[Szint6 - le�r�s]="",5,6),[Szervezeti egys�g�nek szintje]),[tSzervezeti].[Szint1 - le�r�s],[tSzervezeti].[Szint2 - le�r�s],[tSzervezeti].[Szint3 - le�r�s],[tSzervezeti].[Szint4 - le�r�s],[tSzervezeti].[Szint5 - le�r�s],[tSzervezeti].[Szint6 - le�r�s]) & IIf([tSzervezeti].[Szint7 - k�d]="BFKH.1.7.",[tSzervezeti].[Szint7 - le�r�s],""),"Budapest F�v�ros Korm�nyhivatala","BFKH") AS F�oszt�ly, IIf([tSzervezeti].[Szint7 - k�d]="BFKH.1.7.","",[tSzervezeti].[Szint7 - le�r�s]) AS Oszt�ly
FROM tSzervezeti
WHERE (((tSzervezeti.[Szervezetmenedzsment k�d]) Like "S-*") AND ((tSzervezeti.[�rv�nyess�g kezdete])<=Date()) AND ((tSzervezeti.[�rv�nyess�g v�ge])>=Date() Or (tSzervezeti.[�rv�nyess�g v�ge])=0));

#/#/#/
lkSzolg�ltat�nakBeutaltakr�l
#/#/
SELECT DISTINCT lkSzem�lyek.[TAJ sz�m], lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.[Hivatali email], lkSzem�lyek.[Hivatali telefon], tBeutal�T�pus.Beutal�T�pus, Year([D�tum]) AS �v, Month([D�tum]) AS H�
FROM (lkazNexonAd�jel02 INNER JOIN lkSzem�lyek ON lkazNexonAd�jel02.Ad�jel = lkSzem�lyek.Ad�jel) INNER JOIN ((tBeutal�T�pus INNER JOIN tElk�sz�ltBeutal�k ON tBeutal�T�pus.azBeutal�T�pus = tElk�sz�ltBeutal�k.azBeutal�T�pus) INNER JOIN tElk�ld�ttBeutal�k ON (tElk�sz�ltBeutal�k.Id�pont = tElk�ld�ttBeutal�k.D�tum) AND (tElk�sz�ltBeutal�k.NexonID = tElk�ld�ttBeutal�k.NexonID)) ON lkazNexonAd�jel02.[Szem�ly azonos�t�] = tElk�ld�ttBeutal�k.NexonID;

#/#/#/
lkTMPK�vetkez�HaviBeutal�k
#/#/
SELECT tTMPK�vetkez�HaviBeutal�k.[TAJ sz�m], tTMPK�vetkez�HaviBeutal�k.F�oszt�ly, tTMPK�vetkez�HaviBeutal�k.[Dolgoz� teljes neve], tTMPK�vetkez�HaviBeutal�k.[Sz�let�si id�], tTMPK�vetkez�HaviBeutal�k.[Sz�let�si hely], Replace([tTMPK�vetkez�HaviBeutal�k].[�lland� lakc�m]," (levelez�si c�m is)","") AS [�lland� lakc�m], tTMPK�vetkez�HaviBeutal�k.[Hivatali email], tTMPK�vetkez�HaviBeutal�k.munkak�r, lkMunkak�rKock�zatPivot.[1_1] AS [1_1K�zi anyagmozgat�s (5kp-20kp)], lkMunkak�rKock�zatPivot.[1_2] AS [1_2K�zi anyagmozgat�s (20kp-50kp)], lkMunkak�rKock�zatPivot.[1_3] AS [1_3K�zi anyagmozgat�s (>50kp)], lkMunkak�rKock�zatPivot.[2_] AS [2_Fokozott baleseti vesz�ly], lkMunkak�rKock�zatPivot.[3_] AS [3_K�nyszertesthelyzet (g�rnyed�s, guggol�s)], lkMunkak�rKock�zatPivot.[4_] AS 4_�l�s, lkMunkak�rKock�zatPivot.[5_] AS 5_�ll�s, lkMunkak�rKock�zatPivot.[6_] AS 6_J�r�s, lkMunkak�rKock�zatPivot.[7_] AS [7_Terhel� munkahelyi kl�ma (meleg, hideg, nedves, v�ltoz�)], lkMunkak�rKock�zatPivot.[8_] AS 8_Zaj, lkMunkak�rKock�zatPivot.[9_] AS [9_Ioniz�l� sug�rz�s], lkMunkak�rKock�zatPivot.[10_] AS [10_Nem � ioniz�l� sug�rz�s], lkMunkak�rKock�zatPivot.[11_] AS [11_Helyileg hat� vibr�ci�], lkMunkak�rKock�zatPivot.[12_] AS [12_Eg�sztest vibr�ci�], lkMunkak�rKock�zatPivot.[13_] AS [13_Ergon�miai t�nyez�k], lkMunkak�rKock�zatPivot.[14_] AS [14_Porok megnevez�se], lkMunkak�rKock�zatPivot.[15_] AS [15_Vegyi anyagok], lkMunkak�rKock�zatPivot.[16_] AS [16_J�rv�ny�gyi �rdekb�l kiemelt munkak�r], lkMunkak�rKock�zatPivot.[17_] AS 17_Fert�z�svesz�ly, lkMunkak�rKock�zatPivot.[18_] AS [18_Fokozott pszich�s terhel�s], lkMunkak�rKock�zatPivot.[19_] AS [19_K�perny� el�tt v�gzett munka], lkMunkak�rKock�zatPivot.[20_] AS [20_�jszakai m�szakban v�gzett munka], lkMunkak�rKock�zatPivot.[21_] AS [21_Pszichoszoci�lis t�nyez�k], lkMunkak�rKock�zatPivot.[22_] AS [22_Egy�ni v�d�eszk�z �ltali terhel�s], lkMunkak�rKock�zatPivot.[23_] AS 23_Egy�b
FROM lkMunkak�rKock�zatPivot INNER JOIN tTMPK�vetkez�HaviBeutal�k ON lkMunkak�rKock�zatPivot.Munkak�rK�d = tTMPK�vetkez�HaviBeutal�k.Munkak�rK�D;

#/#/#/
lktTMPK�vetkez�HaviBeutal�kK�sz�t�
#/#/
SELECT lkK�vetkez�HaviBeutal�k.* INTO tTMPK�vetkez�HaviBeutal�k
FROM lkK�vetkez�HaviBeutal�k;

#/#/#/
lkVisszajelz�sekSz�maF�oszt�lyonk�nt
#/#/
SELECT lkSzem�lyek.F�oszt�lyK�d, Count(lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.azEg�szs�g�gyiVisszajelz�s) AS Visszajelz�s
FROM (lkEg�szs�g�gyiVisszajelz�sekSzem�lyek INNER JOIN tNexonAzonos�t�k ON lkEg�szs�g�gyiVisszajelz�sekSzem�lyek.azonos�t� = tNexonAzonos�t�k.[Szem�ly azonos�t�]) INNER JOIN lkSzem�lyek ON tNexonAzonos�t�k.[Ad�azonos�t� jel] = lkSzem�lyek.[Ad�azonos�t� jel]
GROUP BY lkSzem�lyek.F�oszt�lyK�d;

#/#/#/
lkVisszajelz�sekSz�maF�oszt�lyonk�nt01
#/#/
SELECT Uni�.F�oszt�ly AS [F�oszt�ly K�dja], lkF�oszt�lyok.F�oszt�ly AS [F�oszt�ly neve], Sum(Uni�.Visszajelz�s) AS [A visszajelz�sek sz�ma]
FROM lkF�oszt�lyok INNER JOIN (SELECT tEgyesMunkak�r�kF�oszt�lyai.F�oszt�ly, 0 AS Visszajelz�s
FROM tEgyesMunkak�r�kF�oszt�lyai
UNION
SELECT * FROM lkVisszajelz�sekSz�maF�oszt�lyonk�nt)  AS Uni� ON lkF�oszt�lyok.F�oszt�lyK�d = Uni�.F�oszt�ly
GROUP BY Uni�.F�oszt�ly, lkF�oszt�lyok.F�oszt�ly
ORDER BY Uni�.F�oszt�ly;

#/#/#/
lkVisszajelz�sekSz�maF�oszt�lyonk�nt02
#/#/
SELECT Subquery.F�oszt�ly, Subquery.F�oszt�lyK�d, lkVisszajelz�sekSz�maF�oszt�lyonk�nt01.[A visszajelz�sek sz�ma]
FROM (SELECT DISTINCT lkSzem�lyek.F�oszt�ly, lkSzem�lyek.F�oszt�lyK�d FROM lkSzem�lyek INNER JOIN tBej�v��zenetek ON lkSzem�lyek.[Hivatali email] = tBej�v��zenetek.SenderEmailAddress WHERE (((lkSzem�lyek.F�oszt�ly)<>"Hum�npolitikai F�oszt�ly" And (lkSzem�lyek.F�oszt�ly) Is Not Null And (lkSzem�lyek.F�oszt�ly)<>"")))  AS Subquery RIGHT JOIN lkVisszajelz�sekSz�maF�oszt�lyonk�nt01 ON Subquery.F�oszt�lyK�d = lkVisszajelz�sekSz�maF�oszt�lyonk�nt01.[F�oszt�ly K�dja];

