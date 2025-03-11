#/#/#/
Lekérdezés1
#/#/
SELECT Year(IIf([következõ]<#2/1/2025#,DateSerial(2025,2,Day([következõ])),[következõ])) AS [Vizsgálat éve], Month(IIf([következõ]<#2/1/2025#,DateSerial(2025,2,Day([következõ])),[következõ])) AS [Vizsgálat hónapja], Count(lkEgészségügyiVisszajelzésekSzemélyek.azonosító) AS CountOfazonosító
FROM lkEgészségügyiVisszajelzésekSzemélyek LEFT JOIN lkSzemélyekOrvosiAdatok ON lkEgészségügyiVisszajelzésekSzemélyek.azonosító = lkSzemélyekOrvosiAdatok.NexonId
WHERE (((Nz([Jogviszony típusa / jogviszony típus],"")) Not Like "hivat*" And (Nz([Jogviszony típusa / jogviszony típus],""))<>"Személyes jelenlét") AND ((lkSzemélyekOrvosiAdatok.[Tartós távollét típusa])="" Or (lkSzemélyekOrvosiAdatok.[Tartós távollét típusa]) Is Null))
GROUP BY Year(IIf([következõ]<#2/1/2025#,DateSerial(2025,2,Day([következõ])),[következõ])), Month(IIf([következõ]<#2/1/2025#,DateSerial(2025,2,Day([következõ])),[következõ]))
ORDER BY Year(IIf([következõ]<#2/1/2025#,DateSerial(2025,2,Day([következõ])),[következõ])), Month(IIf([következõ]<#2/1/2025#,DateSerial(2025,2,Day([következõ])),[következõ]));

#/#/#/
Lekérdezés2
#/#/
SELECT DISTINCT lkSzemélyekOrvosiAdatok.Fõosztály, lkSzemélyekOrvosiAdatok.FõosztályKód, lkSzemélyekOrvosiAdatok.[Dolgozó teljes neve], tBejövõÜzenetek.DeliveredDate, lkEgészségügyiVisszajelzésekSzemélyek.azEgészségügyiVisszajelzés
FROM (lkEgészségügyiVisszajelzésekSzemélyek INNER JOIN lkSzemélyekOrvosiAdatok ON lkEgészségügyiVisszajelzésekSzemélyek.azonosító = lkSzemélyekOrvosiAdatok.NexonId) INNER JOIN tBejövõÜzenetek ON lkEgészségügyiVisszajelzésekSzemélyek.azÜzenet = tBejövõÜzenetek.azÜzenet
WHERE (((tBejövõÜzenetek.DeliveredDate) Between DateSerial(Year(Now()),Month(Now()),1) And DateSerial(Year(Now()),Month(Now())+1,0)));

#/#/#/
Lekérdezés3
#/#/
SELECT tElkészültBeutalók.NexonID, lkAláírtBeutalók.Név
FROM tElkészültBeutalók LEFT JOIN lkAláírtBeutalók ON (tElkészültBeutalók.NexonID = lkAláírtBeutalók.NExonID) AND (tElkészültBeutalók.Idõpont = lkAláírtBeutalók.Dátum)
WHERE (((lkAláírtBeutalók.Sorszám) Is Not Null));

#/#/#/
Lekérdezés4
#/#/
SELECT 
FROM tElkészültBeutalók;

#/#/#/
lk2024_4_néviElszámolás
#/#/
SELECT lkSzemélyek.Adójel, [2024_4_néviElszámolás].Osztály, [2024_4_néviElszámolás].[Alk# tipus] AS [Alk tipus], [2024_4_néviElszámolás].[Alk# dátuma] AS [Alk dátuma], [2024_4_néviElszámolás].Érvényes
FROM lkSzemélyek INNER JOIN 2024_4_néviElszámolás ON lkSzemélyek.[TAJ szám] = [2024_4_néviElszámolás].TAJ;

#/#/#/
lk2024IVnévbenVizsgáltak
#/#/
SELECT lkSzemélyekOrvosiAdatok.Adójel, (IIf(Nz([azonosító],0)=0,"igen, az Mvt. 49. § (1a) bekezdése szerinti jogszabály alapján","igen, az Mvt. 49. § (1a) bekezdése szerint, a munkáltató erre irányuló döntése alapján")) AS [orvosi vizsgálathoz kötött-e] INTO t2024IVnévbenVizsgáltak IN 'L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Háttértárak\Ellenõrzés_0.9.6_háttér_.mdb.accdb'
FROM lkSzemélyekOrvosiAdatok LEFT JOIN lkEgészségügyiVisszajelzésekSzemélyek ON lkSzemélyekOrvosiAdatok.NexonId = lkEgészségügyiVisszajelzésekSzemélyek.azonosító
WHERE (((lkSzemélyekOrvosiAdatok.[Orvosi vizsgálat idõpontja]) Between #9/1/2024# And #12/31/2024#));

#/#/#/
lk2024IVnévbenVizsgáltakLétszáma
#/#/
SELECT Month([Orvosi vizsgálat idõpontja]) AS Hónap, Sum(1) AS Résztvevõk, Sum(IIf(Nz([azonosító],0)=0,0,1)) AS Kötelezettek
FROM lkSzemélyekOrvosiAdatok LEFT JOIN lkEgészségügyiVisszajelzésekSzemélyek ON lkSzemélyekOrvosiAdatok.NexonId = lkEgészségügyiVisszajelzésekSzemélyek.azonosító
WHERE (((lkSzemélyekOrvosiAdatok.[Orvosi vizsgálat idõpontja]) Between #9/1/2024# And #12/31/2024#))
GROUP BY Month([Orvosi vizsgálat idõpontja])
ORDER BY Month([Orvosi vizsgálat idõpontja]);

#/#/#/
lkAláírtBeutalók
#/#/
SELECT lkSorszámok.Sorszám, ffsplit(strKövFájlNév([Sorszám]),"##",1) AS Név, CLng(ffsplit(strKövFájlNév([Sorszám]),"##",3)) AS NExonID, dtDaraboló(ffsplit(strKövFájlNév([Sorszám]),"##",2)) AS Dátum
FROM lkSorszámok
WHERE (((lkSorszámok.Sorszám)<=flm()));

#/#/#/
lkAlkalmasságiVizsgáraKötelezettek
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], tMunkakörök.Munkakör, tEüOsztályok.EüOsztály, "https://nexonport.kh.gov.hu/menu/hrmapp/szemelytorzs/szemelyikarton?szemelyAzonosito=" & [lkazNexonAdójel02].[Személy azonosító] & "&r=13" AS Http, "<a href=""https://nexonport.kh.gov.hu/menu/hrmapp/szemelytorzs/szemelyikarton?szemelyAzonosito=" & [lkazNexonAdójel02].[Személy azonosító] & "&r=13"" target=""_blank"">" & [Dolgozó teljes neve] & "</a>" AS htmlLink
FROM tEüOsztályok INNER JOIN (tMunkakörök INNER JOIN ((lkazNexonAdójel02 INNER JOIN lkEgészségügyiVisszajelzésekSzemélyenkéntUtolsó ON lkazNexonAdójel02.[Személy azonosító] = lkEgészségügyiVisszajelzésekSzemélyenkéntUtolsó.azonosító) INNER JOIN lkSzemélyek ON lkazNexonAdójel02.Adójel = lkSzemélyek.Adójel) ON tMunkakörök.MunkakörKód = lkEgészségügyiVisszajelzésekSzemélyenkéntUtolsó.Érték) ON tEüOsztályok.azEüOsztály = tMunkakörök.azEüOsztály
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH, tEüOsztályok.EüOsztály, lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkÁlláshelyek
#/#/
SELECT Álláshelyek.*
FROM Álláshelyek;

#/#/#/
lkazNexonAdójel02
#/#/
SELECT lkNexonAzonosítók.Azonosító, lkNexonAzonosítók.Név, lkNexonAzonosítók.[Személy azonosító], lkNexonAzonosítók.Adójel
FROM lkNexonAzonosítók
WHERE (((lkNexonAzonosítók.Sorszám)=1));

#/#/#/
lkDolgozóLegutolsóVisszajelzésDátuma
#/#/
SELECT tEgészségügyiVisszajelzések.azonosító AS NexonID, Max(tBejövõÜzenetek.DeliveredDate) AS [Legutolsó dátum]
FROM tEgészségügyiVisszajelzések INNER JOIN tBejövõÜzenetek ON tEgészségügyiVisszajelzések.azÜzenet = tBejövõÜzenetek.azÜzenet
GROUP BY tEgészségügyiVisszajelzések.azonosító;

#/#/#/
lkEgészségügyiKövetkezõVizsgálatiIdõpontok
#/#/
SELECT lkEgészségügyiVisszajelzésekKimenet.Fõosztály, lkEgészségügyiVisszajelzésekKimenet.Osztály, lkEgészségügyiVisszajelzésekKimenet.[Dolgozó teljes neve], lkEgészségügyiVisszajelzésekKimenet.[Orvosi vizsgálat következõ idõpontja], IIf([Orvosi vizsgálat következõ idõpontja]<Date() Or [Orvosi vizsgálat következõ idõpontja] Is Null,3,Month([Orvosi vizsgálat következõ idõpontja])) AS Hó, lkEgészségügyiVisszajelzésekKimenet.[Személy azonosító], tEüOsztályok.EüOsztály, lkOrvosiAlkalmasságiDíjtételekEüOsztályonkéntiMax.MaxOfDíjtétel
FROM lkOrvosiAlkalmasságiDíjtételekEüOsztályonkéntiMax INNER JOIN (lkEgészségügyiVisszajelzésekKimenet INNER JOIN tEüOsztályok ON lkEgészségügyiVisszajelzésekKimenet.azEüOsztály = tEüOsztályok.azEüOsztály) ON lkOrvosiAlkalmasságiDíjtételekEüOsztályonkéntiMax.AlkalmasságiOsztály = tEüOsztályok.EüOsztály
ORDER BY lkEgészségügyiVisszajelzésekKimenet.[Orvosi vizsgálat következõ idõpontja], lkEgészségügyiVisszajelzésekKimenet.Fõosztály, lkEgészségügyiVisszajelzésekKimenet.Osztály, lkEgészségügyiVisszajelzésekKimenet.[Dolgozó teljes neve];

#/#/#/
lkEgészségügyiKövetkezõVizsgálatiIdõpontokHaviÖsszegek
#/#/
SELECT lkEgészségügyiKövetkezõVizsgálatiIdõpontok.Hó, lkEgészségügyiKövetkezõVizsgálatiIdõpontok.EüOsztály, lkEgészségügyiKövetkezõVizsgálatiIdõpontok.MaxOfDíjtétel AS Egységár, Count(lkEgészségügyiKövetkezõVizsgálatiIdõpontok.[Dolgozó teljes neve]) AS Létszám, Sum(lkEgészségügyiKövetkezõVizsgálatiIdõpontok.MaxOfDíjtétel) AS Összdíj
FROM lkEgészségügyiKövetkezõVizsgálatiIdõpontok
GROUP BY lkEgészségügyiKövetkezõVizsgálatiIdõpontok.Hó, lkEgészségügyiKövetkezõVizsgálatiIdõpontok.EüOsztály, lkEgészségügyiKövetkezõVizsgálatiIdõpontok.MaxOfDíjtétel;

#/#/#/
lkEgészségügyiVisszajelzésekKimenet
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], tMunkakörök.Munkakör, tMunkakörök.azEüOsztály, lkSzemélyek.[Orvosi vizsgálat idõpontja], lkSzemélyek.[Orvosi vizsgálat eredménye], lkSzemélyek.[Orvosi vizsgálat következõ idõpontja], lkSzemélyek.KilépésDátuma, lkazNexonAdójel02.[Személy azonosító]
FROM ((tMunkakörök INNER JOIN lkEgészségügyiVisszajelzésekSzemélyenkéntUtolsó ON tMunkakörök.MunkakörKód = lkEgészségügyiVisszajelzésekSzemélyenkéntUtolsó.Érték) INNER JOIN lkazNexonAdójel02 ON lkEgészségügyiVisszajelzésekSzemélyenkéntUtolsó.azonosító = lkazNexonAdójel02.[Személy azonosító]) INNER JOIN lkSzemélyek ON lkazNexonAdójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.KilépésDátuma)>Date() Or (lkSzemélyek.KilépésDátuma)=0));

#/#/#/
lkEgészségügyiVisszajelzésekSzemélyek
#/#/
SELECT tEgészségügyiVisszajelzések.azEgészségügyiVisszajelzés, tEgészségügyiVisszajelzések.azÜzenet, IIf([tEgészségügyiVisszajelzések].[azonosító] Not Like "S*",[tEgészségügyiVisszajelzések].[azonosító],0)*1 AS azonosító, tEgészségügyiVisszajelzések.Érték, tBejövõÜzenetek.DeliveredDate
FROM tEgészségügyiVisszajelzések INNER JOIN tBejövõÜzenetek ON tEgészségügyiVisszajelzések.azÜzenet = tBejövõÜzenetek.azÜzenet
WHERE (((IIf([tEgészségügyiVisszajelzések].[azonosító] Not Like "S*",[tEgészségügyiVisszajelzések].[azonosító],0)*1) Not Like "S*" And (IIf([tEgészségügyiVisszajelzések].[azonosító] Not Like "S*",[tEgészségügyiVisszajelzések].[azonosító],0)*1)<>0));

#/#/#/
lkEgészségügyiVisszajelzésekSzemélyenkéntUtolsó
#/#/
SELECT CLng(IIf([tEgészségügyiVisszajelzések].[azonosító] Like "S*" Or [tEgészségügyiVisszajelzések].[azonosító] Is Null,0,[tEgészségügyiVisszajelzések].[azonosító])) AS Azonosító, tEgészségügyiVisszajelzések.Érték, tEgészségügyiVisszajelzések.azÜzenet, lkDolgozóLegutolsóVisszajelzésDátuma.[Legutolsó dátum]
FROM (tEgészségügyiVisszajelzések INNER JOIN tBejövõÜzenetek ON tEgészségügyiVisszajelzések.azÜzenet = tBejövõÜzenetek.azÜzenet) INNER JOIN lkDolgozóLegutolsóVisszajelzésDátuma ON (tEgészségügyiVisszajelzések.azonosító = lkDolgozóLegutolsóVisszajelzésDátuma.NexonID) AND (tBejövõÜzenetek.DeliveredDate = lkDolgozóLegutolsóVisszajelzésDátuma.[Legutolsó dátum])
WHERE (((CLng(IIf([tEgészségügyiVisszajelzések].[azonosító] Like "S*" Or [tEgészségügyiVisszajelzések].[azonosító] Is Null,0,[tEgészségügyiVisszajelzések].[azonosító])))<>0));

#/#/#/
lkEgészségügyiVisszajelzésekSzemélyenkéntUtolsó_Lassú
#/#/
SELECT lkEgészségügyiVisszajelzésekSzemélyek.azonosító, lkEgészségügyiVisszajelzésekSzemélyek.Érték
FROM lkEgészségügyiVisszajelzésekSzemélyek
WHERE (((lkEgészségügyiVisszajelzésekSzemélyek.azÜzenet)=(SELECT Max(azÜzenet) AS [UtolsóLevél]         FROM [lkEgészségügyiVisszajelzésekSzemélyek] as Tmp         WHERE [lkEgészségügyiVisszajelzésekSzemélyek].[azonosító]=Tmp.azonosító         GROUP BY Tmp.azonosító )));

#/#/#/
lkEgyesMunkakörökFõosztályai
#/#/
SELECT tEgyesMunkakörökFõosztályai.Azonosító, bfkh([tEgyesMunkakörökFõosztályai].[Fõosztály]) AS Fõosztály, tEgyesMunkakörökFõosztályai.Osztály
FROM tEgyesMunkakörökFõosztályai;

#/#/#/
lkEgyesMunkakörökFõosztályaiOsztályai
#/#/
SELECT DISTINCT tEgyesMunkakörökFõosztályai.Azonosító, lkSzemélyek.FõosztályKód, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály
FROM tEgyesMunkakörökFõosztályai INNER JOIN lkSzemélyek ON tEgyesMunkakörökFõosztályai.Fõosztály = lkSzemélyek.FõosztályKód
WHERE (((lkSzemélyek.Osztály) Like [tEgyesMunkakörökFõosztályai].[Osztály]));

#/#/#/
lkFõosztályok
#/#/
SELECT DISTINCT lkSzemélyek.FõosztályKód, lkSzemélyek.Fõosztály
FROM lkSzemélyek;

#/#/#/
lkJárási_állomány
#/#/
SELECT Járási_állomány.Sorszám, Járási_állomány.Név, Járási_állomány.Adóazonosító, Járási_állomány.Mezõ4 AS [Születési év \ üres állás], Járási_állomány.Mezõ5 AS Neme, Járási_állomány.[Járási Hivatal], Járási_állomány.Mezõ7 AS Osztály, "" AS Projekt, Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Járási_állomány.Mezõ9 AS [Ellátott feladat], Járási_állomány.Mezõ10 AS Kinevezés, Járási_állomány.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], Járási_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], Járási_állomány.[Heti munkaórák száma], Járási_állomány.Mezõ14 AS [Betöltés aránya], Járási_állomány.[Besorolási fokozat kód:], Járási_állomány.[Besorolási fokozat megnevezése:], Járási_állomány.[Álláshely azonosító], Járási_állomány.Mezõ18 AS [Havi illetmény], Járási_állomány.Mezõ19 AS [Eu finanszírozott], Járási_állomány.Mezõ20 AS [Illetmény forrása], Járási_állomány.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], Járási_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Járási_állomány.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], Járási_állomány.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], Járási_állomány.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], Járási_állomány.Mezõ26 AS [Képesítést adó végzettség], Járási_állomány.Mezõ27 AS KAB, Járási_állomány.[KAB 001-3** Branch ID]
FROM Járási_állomány;

#/#/#/
lkJárásiKormányKözpontosítottUnió
#/#/
SELECT LétszámUnió.Sorszám, LétszámUnió.Név, LétszámUnió.Adóazonosító, LétszámUnió.[Születési év \ üres állás], LétszámUnió.Neme, LétszámUnió.[Járási Hivatal], LétszámUnió.Osztály, LétszámUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], LétszámUnió.[Ellátott feladat], LétszámUnió.Kinevezés, LétszámUnió.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], LétszámUnió.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], LétszámUnió.[Heti munkaórák száma], LétszámUnió.[Betöltés aránya], LétszámUnió.[Besorolási fokozat kód:], LétszámUnió.[Besorolási fokozat megnevezése:], LétszámUnió.[Álláshely azonosító], LétszámUnió.[Havi illetmény], LétszámUnió.[Eu finanszírozott], LétszámUnió.[Illetmény forrása], LétszámUnió.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], LétszámUnió.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], LétszámUnió.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], LétszámUnió.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], LétszámUnió.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], LétszámUnió.[Képesítést adó végzettség], LétszámUnió.KAB, LétszámUnió.[KAB 001-3** Branch ID], IIf([Adóazonosító] Is Null Or [Adóazonosító]="",0,[Adóazonosító]*1) AS Adójel, LétszámUnió.Jelleg, TextToMD5Hex([Álláshely azonosító]) AS Hash, Replace([Járási Hivatal],"budapest fõváros kormányhivatala","BFKH") AS Fõosztály, BFKH(LétszámUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS BFKH
FROM (SELECT *, "A" as Jelleg
FROM lkJárási_állomány
UNION SELECT *, "A" as Jelleg
FROM lkKormányhivatali_állomány
UNION SELECT *, "K" as Jelleg
FROM lkKözpontosítottak
)  AS LétszámUnió;

#/#/#/
lkJárásiKormányKözpontosítottUnióFõosztKód
#/#/
SELECT lkJárásiKormányKözpontosítottUnió.*, bfkh(IIf([Járási Hivatal]=[Osztály] Or [Osztály] Is Null,[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ],strLevág([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ],".") & ".")) AS Fõosztálykód
FROM lkJárásiKormányKözpontosítottUnió;

#/#/#/
lkKEHIOrvosiAlkalmasságik2024_09_2024_12
#/#/
SELECT 789235 AS [PIR törzsszám], "Budapest Fõváros Kormányhivatala" AS [kormányzati igazgatási szerv neve], [lkSzemélyUtolsóSzervezetiEgysége].[Fõosztály] & " " & [lkSzemélyUtolsóSzervezetiEgysége].[osztály] AS [szervezeti egység neve], lkSzemélyek.[Dolgozó teljes neve] AS [családi és utónév], lkSzemélyek.Adójel AS [adóazonosító jel], Mid([Elsõdleges feladatkör],InStr(Nz([elsõdleges Feladatkör],""),"-")+1) AS [munkakör / feladatkör megnevezése], lkSzemélyUtolsóSzervezetiEgysége.ÁNYR AS [álláshely ÁNYR azonosító száma], lkSzervezetiÁlláshelyek.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] AS [az álláshely besorolása], lkSzemélyek.[Jogviszony típusa / jogviszony típus] AS [az álláshelyen fennálló jogviszony típusa], t2024IVnévbenVizsgáltak.[orvosi vizsgálathoz kötött-e], "2024. III-IV. negyedév" AS tárgyidõszak, lkSzemélyek.[Orvosi vizsgálat idõpontja] AS [a vizsgálat idõpontja], Replace(Replace([Orvosi vizsgálat típusa],"Munkábalépés elõtti","elõzetes"),"Munkakör változás elõtti","soron kívüli") AS [a vizsgálat típusa], "-" AS Osztály
FROM t2024IVnévbenVizsgáltak INNER JOIN (lkSzervezetiÁlláshelyek RIGHT JOIN (lkSzemélyUtolsóSzervezetiEgysége INNER JOIN lkSzemélyek ON lkSzemélyUtolsóSzervezetiEgysége.Adójel = lkSzemélyek.Adójel) ON lkSzervezetiÁlláshelyek.ÁlláshelyAzonosító = lkSzemélyUtolsóSzervezetiEgysége.ÁNYR) ON t2024IVnévbenVizsgáltak.Adójel = lkSzemélyek.Adójel;

#/#/#/
lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II
#/#/
SELECT 789235 AS [PIR törzsszám], "Budapest Fõváros Kormányhivatala" AS [kormányzati igazgatási szerv neve], [lkSzemélyUtolsóSzervezetiEgysége].[Fõosztály] & " " & [lkSzemélyUtolsóSzervezetiEgysége].[osztály] AS [szervezeti egység neve], lkSzemélyek.[Dolgozó teljes neve] AS [családi és utónév], lkSzemélyek.Adójel AS [adóazonosító jel], Mid([Elsõdleges feladatkör],InStr(Nz([elsõdleges Feladatkör],""),"-")+1) AS [munkakör / feladatkör megnevezése], lkSzemélyUtolsóSzervezetiEgysége.ÁNYR AS [álláshely ÁNYR azonosító száma], lkSzervezetiÁlláshelyek.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] AS [az álláshely besorolása], lkSzemélyek.[Jogviszony típusa / jogviszony típus] AS [az álláshelyen fennálló jogviszony típusa], "2024. III-IV. negyedév" AS tárgyidõszak, lk2024_4_néviElszámolás.[Alk dátuma] AS [a vizsgálat idõpontja], lk2024_4_néviElszámolás.[alk tipus] AS [a vizsgálat típusa], lk2024_4_néviElszámolás.Osztály
FROM (lkSzervezetiÁlláshelyek RIGHT JOIN (lkSzemélyUtolsóSzervezetiEgysége INNER JOIN lkSzemélyek ON lkSzemélyUtolsóSzervezetiEgysége.Adójel = lkSzemélyek.Adójel) ON lkSzervezetiÁlláshelyek.ÁlláshelyAzonosító = lkSzemélyUtolsóSzervezetiEgysége.ÁNYR) INNER JOIN lk2024_4_néviElszámolás ON lkSzemélyek.[adójel] = lk2024_4_néviElszámolás.adójel;

#/#/#/
lkKEHIOrvosiAlkalmasságik2024_09_2024_12_IIa
#/#/
SELECT lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[PIR törzsszám], lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[kormányzati igazgatási szerv neve], lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[szervezeti egység neve], lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[családi és utónév], lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[adóazonosító jel], lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[munkakör / feladatkör megnevezése], lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[álláshely ÁNYR azonosító száma], lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[az álláshely besorolása], lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[az álláshelyen fennálló jogviszony típusa], Nz([t2024IVnévbenVizsgáltak].[orvosi vizsgálathoz kötött-e],[lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II].[osztály]) AS orvosi, lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.tárgyidõszak, lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[a vizsgálat idõpontja], lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[a vizsgálat típusa]
FROM lkKEHIOrvosiAlkalmasságik2024_09_2024_12 RIGHT JOIN (t2024IVnévbenVizsgáltak RIGHT JOIN lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II ON t2024IVnévbenVizsgáltak.Adójel = lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[adóazonosító jel]) ON lkKEHIOrvosiAlkalmasságik2024_09_2024_12.[adóazonosító jel] = lkKEHIOrvosiAlkalmasságik2024_09_2024_12_II.[adóazonosító jel]
WHERE (((lkKEHIOrvosiAlkalmasságik2024_09_2024_12.[adóazonosító jel]) Is Null));

#/#/#/
lkKilépõUnió
#/#/
SELECT DISTINCT Unió2019_mostanáig.Sorszám, Unió2019_mostanáig.Név, Unió2019_mostanáig.Adóazonosító, Unió2019_mostanáig.Alaplétszám, Unió2019_mostanáig.[Megyei szint VAGY Járási Hivatal], Unió2019_mostanáig.Mezõ5, Unió2019_mostanáig.Mezõ6, Unió2019_mostanáig.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Unió2019_mostanáig.Mezõ8, Unió2019_mostanáig.[Besorolási fokozat kód:], Unió2019_mostanáig.[Besorolási fokozat megnevezése:], Unió2019_mostanáig.[Álláshely azonosító], Unió2019_mostanáig.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva], Unió2019_mostanáig.[Jogviszony kezdõ dátuma], Unió2019_mostanáig.[Jogviszony megszûnésének, megszüntetésének idõpontja], Unió2019_mostanáig.[Illetmény (Ft/hó)], Unió2019_mostanáig.[Végkielégítésre jogosító hónapok száma], Unió2019_mostanáig.[Felmentési idõ hónapok száma], IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, Unió2019_mostanáig.tKilépõkUnió.Mezõ6 AS Osztály, [adóazonosító]*1 AS Adójel, *
FROM (SELECT  tKilépõkUnió.Sorszám, tKilépõkUnió.Név, tKilépõkUnió.Adóazonosító, tKilépõkUnió.Alaplétszám, tKilépõkUnió.[Megyei szint VAGY Járási Hivatal], tKilépõkUnió.Mezõ5, tKilépõkUnió.Mezõ6, tKilépõkUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], tKilépõkUnió.Mezõ8, tKilépõkUnió.[Besorolási fokozat kód:], tKilépõkUnió.[Besorolási fokozat megnevezése:], tKilépõkUnió.[Álláshely azonosító], tKilépõkUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva], tKilépõkUnió.[Jogviszony kezdõ dátuma], tKilépõkUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja], tKilépõkUnió.[Illetmény (Ft/hó)], tKilépõkUnió.[Végkielégítésre jogosító hónapok száma], tKilépõkUnió.[Felmentési idõ hónapok száma], Év
FROM tKilépõkUnió
UNION
SELECT Kilépõk.Sorszám, Kilépõk.Név, Kilépõk.Adóazonosító, Kilépõk.Alaplétszám, Kilépõk.[Megyei szint VAGY Járási Hivatal], Kilépõk.Mezõ5, Kilépõk.Mezõ6, Kilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Kilépõk.Mezõ8, Kilépõk.[Besorolási fokozat kód:], Kilépõk.[Besorolási fokozat megnevezése:], Kilépõk.[Álláshely azonosító], Kilépõk.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva], Kilépõk.[Jogviszony kezdõ dátuma], Kilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja], Kilépõk.[Illetmény (Ft/hó)], Kilépõk.[Végkielégítésre jogosító hónapok száma], Kilépõk.[Felmentési idõ hónapok száma],Year(date()) as Év
FROM Kilépõk)  AS Unió2019_mostanáig;

#/#/#/
lkKormányhivatali_állomány
#/#/
SELECT Kormányhivatali_állomány.Sorszám, Kormányhivatali_állomány.Név, Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.Mezõ4 AS [Születési év \ üres állás], Kormányhivatali_állomány.Mezõ5 AS Neme, Kormányhivatali_állomány.Mezõ6 AS Fõosztály, Kormányhivatali_állomány.Mezõ7 AS Osztály, "" AS Projekt, Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Kormányhivatali_állomány.Mezõ9 AS [Ellátott feladat], Kormányhivatali_állomány.Mezõ10 AS Kinevezés, Kormányhivatali_állomány.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], Kormányhivatali_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], Kormányhivatali_állomány.[Heti munkaórák száma], Kormányhivatali_állomány.Mezõ14 AS [Betöltés aránya], Kormányhivatali_állomány.[Besorolási fokozat kód:], Kormányhivatali_állomány.[Besorolási fokozat megnevezése:], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.Mezõ18 AS [Havi illetmény], Kormányhivatali_állomány.Mezõ19 AS [Eu finanszírozott], Kormányhivatali_állomány.Mezõ20 AS [Illetmény forrása], Kormányhivatali_állomány.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], Kormányhivatali_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Kormányhivatali_állomány.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], Kormányhivatali_állomány.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], Kormányhivatali_állomány.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], Kormányhivatali_állomány.Mezõ26 AS [Képesítést adó végzettség], Kormányhivatali_állomány.Mezõ27 AS KAB, Kormányhivatali_állomány.[KAB 001-3** Branch ID]
FROM Kormányhivatali_állomány;

#/#/#/
lkKövetkezõHaviBeutalók
#/#/
SELECT lkSzemélyek.[TAJ szám], lkSzemélyek.Fõosztály, drelõre(zárójeltelenítõ([lkszemélyek].[Dolgozó teljes neve])) AS [Dolgozó teljes neve], lkSzemélyek.[Születési idõ], lkSzemélyek.[Születési hely], Trim(Replace(Replace([lkszemélyek].[Állandó lakcím],"Magyarország,","")," (levelezési cím is)","")) AS [Állandó lakcím], lkSzemélyek.[Hivatali email], tMunkakörök.Munkakör, tMunkakörök.MunkakörKód, tEüOsztályok.EüOsztály, lkSzemélyek.[Orvosi vizsgálat következõ idõpontja], IIf([Orvosi vizsgálat következõ idõpontja] Is Null Or [Orvosi vizsgálat következõ idõpontja]<Date(),3,Month([Orvosi vizsgálat következõ idõpontja])) AS hó, lkEgészségügyiVisszajelzésekSzemélyenkéntUtolsó.Azonosító AS NexonID, lkMunkakörKockázatPivot.[1_1] AS [1_1Kézi anyagmozgatás (5kp-20kp)], lkMunkakörKockázatPivot.[1_2] AS [1_2Kézi anyagmozgatás (20kp-50kp)], lkMunkakörKockázatPivot.[1_3] AS [1_3Kézi anyagmozgatás (>50kp)], lkMunkakörKockázatPivot.[2_] AS [2_Fokozott baleseti veszély], lkMunkakörKockázatPivot.[3_] AS [3_Kényszertesthelyzet (görnyedés, guggolás)], lkMunkakörKockázatPivot.[4_] AS 4_Ülés, lkMunkakörKockázatPivot.[5_] AS 5_Állás, lkMunkakörKockázatPivot.[6_] AS 6_Járás, lkMunkakörKockázatPivot.[7_] AS [7_Terhelõ munkahelyi klíma (meleg, hideg, nedves, változó)], lkMunkakörKockázatPivot.[8_] AS 8_Zaj, lkMunkakörKockázatPivot.[9_] AS [9_Ionizáló sugárzás], lkMunkakörKockázatPivot.[10_] AS [10_Nem – ionizáló sugárzás], lkMunkakörKockázatPivot.[11_] AS [11_Helyileg ható vibráció], lkMunkakörKockázatPivot.[12_] AS [12_Egésztest vibráció], lkMunkakörKockázatPivot.[13_] AS [13_Ergonómiai tényezõk], lkMunkakörKockázatPivot.[14_] AS [14_Porok megnevezése], lkMunkakörKockázatPivot.[15_] AS [15_Vegyi anyagok], lkMunkakörKockázatPivot.[16_] AS [16_Járványügyi érdekbõl kiemelt munkakör], lkMunkakörKockázatPivot.[17_] AS 17_Fertõzésveszély, lkMunkakörKockázatPivot.[18_] AS [18_Fokozott pszichés terhelés], lkMunkakörKockázatPivot.[19_] AS [19_Képernyõ elõtt végzett munka], lkMunkakörKockázatPivot.[20_] AS [20_Éjszakai mûszakban végzett munka], lkMunkakörKockázatPivot.[21_] AS [21_Pszichoszociális tényezõk], lkMunkakörKockázatPivot.[22_] AS [22_Egyéni védõeszköz általi terhelés], lkMunkakörKockázatPivot.[23_] AS 23_Egyéb
FROM tEüOsztályok INNER JOIN ((tMunkakörök INNER JOIN ((lkEgészségügyiVisszajelzésekSzemélyenkéntUtolsó INNER JOIN lkazNexonAdójel02 ON lkEgészségügyiVisszajelzésekSzemélyenkéntUtolsó.azonosító = lkazNexonAdójel02.[Személy azonosító]) INNER JOIN lkSzemélyek ON lkazNexonAdójel02.Adójel = lkSzemélyek.Adójel) ON tMunkakörök.MunkakörKód = lkEgészségügyiVisszajelzésekSzemélyenkéntUtolsó.Érték) LEFT JOIN lkMunkakörKockázatPivot ON tMunkakörök.azMunkakör = lkMunkakörKockázatPivot.azMunkakör) ON tEüOsztályok.azEüOsztály = tMunkakörök.azEüOsztály
WHERE (((IIf([Orvosi vizsgálat következõ idõpontja] Is Null Or [Orvosi vizsgálat következõ idõpontja]<Date(),3,Month([Orvosi vizsgálat következõ idõpontja])))=IIf(Day(Date())>10,Month(Date())+1,Month(Date()))));

#/#/#/
lkKövetkezõOrvosiMaxFejenként
#/#/
SELECT lkSzemélyekOrvosiAdatok00.adójel, Max(IIf([lkSzemélyekOrvosiAdatok00].[következõ] Is Null,#1/1/1900#,[lkSzemélyekOrvosiAdatok00].[következõ])) AS Következõ
FROM lkSzemélyekOrvosiAdatok00
GROUP BY lkSzemélyekOrvosiAdatok00.adójel;

#/#/#/
lkKövetkezõOrvosiMaxJogviszonyMaxFejenként
#/#/
SELECT lkSzemélyekOrvosiAdatok00.Adójel, Max(lkSzemélyekOrvosiAdatok00.[Jogviszony sorszáma]) AS [MaxOfJogviszony sorszáma]
FROM lkKövetkezõOrvosiMaxFejenként INNER JOIN lkSzemélyekOrvosiAdatok00 ON (lkKövetkezõOrvosiMaxFejenként.Következõ = lkSzemélyekOrvosiAdatok00.Következõ) AND (lkKövetkezõOrvosiMaxFejenként.adójel = lkSzemélyekOrvosiAdatok00.Adójel)
GROUP BY lkSzemélyekOrvosiAdatok00.Adójel;

#/#/#/
lkKözpontosítottak
#/#/
SELECT Központosítottak.Sorszám, Központosítottak.Név, Központosítottak.Adóazonosító, Központosítottak.Mezõ4 AS [Születési év \ üres állás], "" AS Nem, Replace(IIf([Megyei szint VAGY Járási Hivatal]="Megyei szint",[Központosítottak].[Mezõ6],[Megyei szint VAGY Járási Hivatal]),"Budapest Fõváros Kormányhivatala ","BFKH ") AS Fõoszt, Központosítottak.Mezõ7 AS Osztály, Központosítottak.[Projekt megnevezése], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Központosítottak.Mezõ10 AS [Ellátott feladat], Központosítottak.Mezõ11 AS Kinevezés, "SZ" AS [Feladat jellege], Központosítottak.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], 0 AS [Heti munkaórák száma], 1 AS [Betöltés aránya], Központosítottak.[Besorolási fokozat kód:], Központosítottak.[Besorolási fokozat megnevezése:], Központosítottak.[Álláshely azonosító], Központosítottak.Mezõ17 AS [Havi illetmény], "" AS [Eu finanszírozott], "" AS [Illetmény forrása], "" AS [Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], Központosítottak.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Központosítottak.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], Központosítottak.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], "" AS [Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], "" AS [Képesítést adó végzettség], "" AS KAB, "" AS [KAB 001-3** Branch ID]
FROM Központosítottak
WHERE ((("")=True Or ("")='IIf([Neme]="Nõ";2;1)'));

#/#/#/
lkMunkakörKockázat
#/#/
SELECT tMunkakörök.MunkakörKód, tMunkakörök.Munkakör, Replace([tKockázatok].[KockázatiKód],".","_") AS KockázatiKód, tKockázatok.Kockázat, ktMunkakörKockázat.azMunkakör, ktMunkakörKockázat.azKockázat, ktMunkakörKockázat.TeljesMunkaidõben AS 1
FROM tKockázatok INNER JOIN (tMunkakörök INNER JOIN ktMunkakörKockázat ON tMunkakörök.azMunkakör = ktMunkakörKockázat.azMunkakör) ON tKockázatok.azKockázat = ktMunkakörKockázat.azKockázat;

#/#/#/
lkMunkakörKockázatPivot
#/#/
TRANSFORM Sum(lkMunkakörKockázat.[1]) AS 1
SELECT lkMunkakörKockázat.azMunkakör, lkMunkakörKockázat.MunkakörKód
FROM lkMunkakörKockázat
GROUP BY lkMunkakörKockázat.azMunkakör, lkMunkakörKockázat.MunkakörKód
PIVOT lkMunkakörKockázat.KockázatiKód In ("5_","12_","23_","22_","20_","13_","17_","2_","18_","11_","9_","6_","16_","3_","19_","1_3","1_2","1_1","10_","14_","21_","7_","4_","15_","8_");

#/#/#/
lkMunkakörökElõfordulása
#/#/
SELECT DISTINCT lkMunkakörökElõfordulásaFõosztályonként.MunkakörKód, lkMunkakörökElõfordulásaFõosztályonként.Munkakör
FROM lkMunkakörökElõfordulásaFõosztályonként;

#/#/#/
lkMunkakörökElõfordulásaFõosztályonként
#/#/
SELECT DISTINCT tBejövõÜzenetek.SenderEmailAddress, Személyek.Fõosztály AS Fõosztály, tMunkakörök.MunkakörKód, tMunkakörök.Munkakör
FROM ((((SELECT lkSzemélyek.[Hivatali email], lkSzemélyek.[FõosztályKód] AS Fõosztály FROM lkSzemélyek UNION SELECT Email, Fõosztálykód FROM tKiegészítõEmailCímek )  AS Személyek RIGHT JOIN tBejövõÜzenetek ON Személyek.[Hivatali email] = tBejövõÜzenetek.SenderEmailAddress) INNER JOIN lkEgészségügyiVisszajelzésekSzemélyek ON tBejövõÜzenetek.azÜzenet = lkEgészségügyiVisszajelzésekSzemélyek.azÜzenet) INNER JOIN tMunkakörök ON lkEgészségügyiVisszajelzésekSzemélyek.Érték = tMunkakörök.MunkakörKód) LEFT JOIN tEgyesMunkakörökFõosztályai ON Személyek.Fõosztály = tEgyesMunkakörökFõosztályai.Fõosztály
ORDER BY Személyek.Fõosztály, tMunkakörök.Munkakör;

#/#/#/
lkMunkakörökFõosztályJSON
#/#/
SELECT DISTINCT lkJárásiKormányKözpontosítottUnióFõosztKód.BFKH, Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS Fõosztály, "{ id: """ & Nz([Személy azonosító],[Álláshely azonosító]) & """, neve: """ & Nü([lkJárásiKormányKözpontosítottUnióFõosztKód].[Név],"Betöltetlen álláshely (" & [Álláshely azonosító] & ")") & " (" & [lkJárásiKormányKözpontosítottUnióFõosztKód].[Osztály] & ")" & """ }," AS Json, lkJárásiKormányKözpontosítottUnióFõosztKód.Osztály, drhátra([lkJárásiKormányKözpontosítottUnióFõosztKód].[név]) AS Név, lkJárásiKormányKözpontosítottUnióFõosztKód.Osztály, tNexonAzonosítók.[Személy azonosító]
FROM tEgyesMunkakörökFõosztályai INNER JOIN (lkJárásiKormányKözpontosítottUnióFõosztKód LEFT JOIN tNexonAzonosítók ON lkJárásiKormányKözpontosítottUnióFõosztKód.Adóazonosító = tNexonAzonosítók.[Adóazonosító jel]) ON tEgyesMunkakörökFõosztályai.Fõosztály = lkJárásiKormányKözpontosítottUnióFõosztKód.Fõosztálykód
WHERE (((lkJárásiKormányKözpontosítottUnióFõosztKód.Osztály) Like "*" & [tEgyesMunkakörökFõosztályai].[Osztály] & "*"))
ORDER BY lkJárásiKormányKözpontosítottUnióFõosztKód.BFKH, drhátra([lkJárásiKormányKözpontosítottUnióFõosztKód].[név]);

#/#/#/
lkMunkakörökJson
#/#/
SELECT "{ ""id"": """ & [MunkakörKód] & """, ""neve"": """ & [Munkakör] & """ }," AS Json
FROM tMunkakörök
ORDER BY tMunkakörök.Munkakör;

#/#/#/
lkMunkakörökKörlevélCímzettek00
#/#/
SELECT DISTINCT bfkh([FõosztályKód]) AS BFKHFõosztKód, lkSzemélyek.Fõosztály AS Kif1, lkSzemélyek.[Dolgozó teljes neve] AS Kif2, IIf([Neme]="férfi","Úr","Asszony") AS Megszólítás, Replace(Nz([Besorolási  fokozat (KT)],""),"Járási / kerületi hivatal vezetõje","Hivatalvezetõ") AS Cím, lkSzemélyek.[Hivatali email] AS Kif3, lkSzemélyek.Adójel AS Kif4
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="álláshely") And ((lkSzemélyek.[Besorolási  fokozat (KT)])="Járási / kerületi hivatal vezetõje")) Or (((lkSzemélyek.[Státusz neve])="álláshely") And ((lkSzemélyek.[Besorolási  fokozat (KT)])="Fõosztályvezetõ")) Or (((bfkh([FõosztályKód]))="BFKH.01.14") And ((lkSzemélyek.[Státusz neve])="álláshely") And ((lkSzemélyek.[Besorolási  fokozat (KT)])="osztályvezetõ"));

#/#/#/
lkMunkakörökKörlevélCímzettek01
#/#/
SELECT DISTINCT lkMunkakörökKörlevélCímzettek00.BFKHFõosztKód, lkMunkakörökKörlevélCímzettek00.Fõosztály, lkMunkakörökKörlevélCímzettek00.Adójel, lkMunkakörökKörlevélCímzettek00.[Dolgozó teljes neve] AS Név, lkMunkakörökKörlevélCímzettek00.Megszólítás, lkMunkakörökKörlevélCímzettek00.Cím, lkMunkakörökKörlevélCímzettek00.[Hivatali email], lkMunkakörökKörlevélCsakALegfrissebbMaiMellékletek.Útvonal
FROM lkMunkakörökKörlevélCsakALegfrissebbMaiMellékletek INNER JOIN (tEgyesMunkakörökFõosztályai INNER JOIN lkMunkakörökKörlevélCímzettek00 ON tEgyesMunkakörökFõosztályai.Fõosztály = lkMunkakörökKörlevélCímzettek00.BFKHFõosztKód) ON lkMunkakörökKörlevélCsakALegfrissebbMaiMellékletek.FõosztályNeve = lkMunkakörökKörlevélCímzettek00.Fõosztály;

#/#/#/
lkMunkakörökKörlevélCsakALegfrissebbMaiMellékletek
#/#/
SELECT DISTINCT tMunkakörKörlevélMellékletÚtvonalak.azMelléklet, tMunkakörKörlevélMellékletÚtvonalak.FõosztályNeve, tMunkakörKörlevélMellékletÚtvonalak.Útvonal, tMunkakörKörlevélMellékletÚtvonalak.Készült, DateValue([Készült]) AS Dátum
FROM tMunkakörKörlevélMellékletÚtvonalak
WHERE (((tMunkakörKörlevélMellékletÚtvonalak.Készült)=(Select Max([Készült]) from [tMunkakörKörlevélMellékletÚtvonalak] as tmp where [tMunkakörKörlevélMellékletÚtvonalak].[FõosztályNeve]=tmp.fõosztályneve)) AND ((DateValue([Készült]))=Date()));

#/#/#/
lkNexonAzonosítók
#/#/
SELECT tNexonAzonosítók.Azonosító, [Adóazonosító jel]*1 AS Adójel, tNexonAzonosítók.[Személy azonosító], tNexonAzonosítók.[HR kapcsolat azonosító], tNexonAzonosítók.Név, tNexonAzonosítók.[Adóazonosító jel], tNexonAzonosítók.[TAJ szám], tNexonAzonosítók.[Egyedi azonosító], tNexonAzonosítók.Törzsszám, tNexonAzonosítók.[Jogviszony típus], dtátal([tNexonAzonosítók].[Kezdete]) AS Kezdete, dtátal([tNexonAzonosítók].[Vége]) AS Vége, tNexonAzonosítók.[Szervezeti egység], tNexonAzonosítók.[Szervezeti egység kategória], tNexonAzonosítók.Munkakör, tNexonAzonosítók.Státusz, tNexonAzonosítók.TörténetiSorszám, (SELECT COUNT(tnexonazonosítók.Azonosító) 
        FROM tNexonAzonosítók AS Tmp 
        Where (Tmp.Kezdete >= tNexonAzonosítók.Kezdete
        AND Tmp.[Személy azonosító] = tNexonAzonosítók.[Személy azonosító]) AND  Tmp.[Azonosító] > tNexonAzonosítók.[Azonosító]
)+1 AS Sorszám
FROM tNexonAzonosítók;

#/#/#/
lkNexonID_Email
#/#/
SELECT DISTINCT lkazNexonAdójel02.[Személy azonosító] AS NexonID, lkSzemélyek.[Hivatali email] AS Email
FROM lkSzemélyek INNER JOIN lkazNexonAdójel02 ON lkSzemélyek.Adójel = lkazNexonAdójel02.Adójel
WHERE (((lkSzemélyek.[Hivatali email]) Is Not Null))
ORDER BY lkazNexonAdójel02.[Személy azonosító];

#/#/#/
lkOrvosiAlkalmasságiDíjtételekEüOsztályonkéntiMax
#/#/
SELECT tOrvosiAlkalmasságiDíjtételek.AlkalmasságiOsztály, Max(tOrvosiAlkalmasságiDíjtételek.Díjtétel) AS MaxOfDíjtétel
FROM tOrvosiAlkalmasságiDíjtételek
GROUP BY tOrvosiAlkalmasságiDíjtételek.AlkalmasságiOsztály;

#/#/#/
lkSorszámok
#/#/
SELECT ([1]+[10]+[100]+[1000]+[10000]) AS Sorszám
FROM (SELECT [1].Szám*1 AS 1, [10].Szám*10 AS 10, [100].Szám*100 AS 100, [1000].Szám*1000 AS 1000, [10000].Szám*10^4 AS 10000 FROM lkSzámok AS 1, lkSzámok AS 10, lkSzámok AS 100, lkSzámok AS 1000, lkSzámok AS 10000)  AS helyiértékek;

#/#/#/
lkSzámok
#/#/
SELECT DISTINCT [Id] Mod 10 AS Szám
FROM MSysObjects
WHERE ((([Id] Mod 10) Between 0 And 9));

#/#/#/
lkSzemélyek
#/#/
SELECT tSzemélyek.*, Replace(Nz(IIf(IsNull([tSzemélyek].[Szint 6 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 5 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 7 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység név]),[tSzemélyek].[Szint 2 szervezeti egység név] & "",[tSzemélyek].[Szint 3 szervezeti egység név] & ""),[tSzemélyek].[Szint 4 szervezeti egység név] & ""),[tSzemélyek].[Szint 7 szervezeti egység név] & ""),[tSzemélyek].[Szint 5 szervezeti egység név] & ""),[tSzemélyek].[Szint 6 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") & "" AS Fõosztály, bfkh(Replace(Nz(IIf(IsNull([tSzemélyek].[Szint 6 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 5 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 7 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység kód]),[tSzemélyek].[Szint 2 szervezeti egység kód] & "",[tSzemélyek].[Szint 3 szervezeti egység kód] & ""),[tSzemélyek].[Szint 4 szervezeti egység kód] & ""),[tSzemélyek].[Szint 7 szervezeti egység kód] & ""),[tSzemélyek].[Szint 5 szervezeti egység kód] & ""),[tSzemélyek].[Szint 6 szervezeti egység kód] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ")) AS FõosztályKód, IIf([fõosztály]=[Szint 7 szervezeti egység név],"",[Szint 7 szervezeti egység név] & "") AS Osztály, Replace(Nz([Munkavégzés helye - cím],"")," .",".") AS MunkavégzésCíme, tSzemélyek.[besorolási  fokozat (KT)] AS Besorolás, Replace(Nz([tszemélyek].[Besorolási  fokozat (KT)],Nz([tBesorolásÁtalakítóEltérõBesoroláshoz].[Besorolási  fokozat (KT)],"")),"/ ","") AS Besorolás2, bfkh(Nz([szervezeti egység kódja],0)) AS BFKH, Replace([Feladatkör],"Lezárt_","") AS Feladat, Nz([Iskolai végzettség foka],"-") AS VégzettségFok, tSzemélyek.[Születési idõ] AS SzületésiIdeje, tSzemélyek.[Jogviszony vége (kilépés dátuma)] AS KilépésDátuma, Nz([tSzemélyek].[TAJ szám],0)*1 AS TAJ, [Törzsszám]*1 AS SzámTörzsSzám
FROM (tSzemélyek LEFT JOIN lkÁlláshelyek ON tSzemélyek.[Státusz kódja] = lkÁlláshelyek.[Álláshely azonosító]) LEFT JOIN tBesorolásÁtalakítóEltérõBesoroláshoz ON lkÁlláshelyek.[Álláshely besorolási kategóriája] = tBesorolásÁtalakítóEltérõBesoroláshoz.[Álláshely besorolási kategóriája]
WHERE ((((SELECT Max(IIf(Tmp.[Jogviszony vége (kilépés dátuma)]=0,#01/01/3000#,Tmp.[Jogviszony vége (kilépés dátuma)])) AS [MaxOfJogviszony sorszáma]         FROM tSzemélyek as Tmp         WHERE tSzemélyek.Adójel=Tmp.Adójel         GROUP BY Tmp.Adójel     ))=IIf([Jogviszony vége (kilépés dátuma)]=0,#1/1/3000#,[Jogviszony vége (kilépés dátuma)])))
ORDER BY tSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkSzemélyekNemMegbízásÉsNemSzemélyesJelenlét
#/#/
SELECT tSzemélyek.*, Replace(Nz(IIf(IsNull([tSzemélyek].[Szint 6 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 5 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 7 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység név]),[tSzemélyek].[Szint 2 szervezeti egység név] & "",[tSzemélyek].[Szint 3 szervezeti egység név] & ""),[tSzemélyek].[Szint 4 szervezeti egység név] & ""),[tSzemélyek].[Szint 7 szervezeti egység név] & ""),[tSzemélyek].[Szint 5 szervezeti egység név] & ""),[tSzemélyek].[Szint 6 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") & "" AS Fõosztály, Replace(Nz(IIf(IsNull([tSzemélyek].[Szint 6 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 5 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 7 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység kód]),[tSzemélyek].[Szint 2 szervezeti egység kód] & "",[tSzemélyek].[Szint 3 szervezeti egység kód] & ""),[tSzemélyek].[Szint 4 szervezeti egység kód] & ""),[tSzemélyek].[Szint 7 szervezeti egység kód] & ""),[tSzemélyek].[Szint 5 szervezeti egység kód] & ""),[tSzemélyek].[Szint 6 szervezeti egység kód] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") AS FõosztályKód, IIf([fõosztály]=[Szint 7 szervezeti egység név],"",[Szint 7 szervezeti egység név] & "") AS Osztály, Replace(Nz([Munkavégzés helye - cím],"")," .",".") AS MunkavégzésCíme, tSzemélyek.[besorolási  fokozat (KT)] AS Besorolás, Replace(Nz([tszemélyek].[Besorolási  fokozat (KT)],Nz([tBesorolásÁtalakítóEltérõBesoroláshoz].[Besorolási  fokozat (KT)],"")),"/ ","") AS Besorolás2, bfkh(Nz([szervezeti egység kódja],0)) AS BFKH, Replace([Feladatkör],"Lezárt_","") AS Feladat, Nz([Iskolai végzettség foka],"-") AS VégzettségFok, tSzemélyek.[Születési idõ] AS SzületésiIdeje, dtátal([Jogviszony vége (kilépés dátuma)]) AS KilépésDátuma, Nz([tSzemélyek].[TAJ szám],0)*1 AS TAJ, [Törzsszám]*1 AS SzámTörzsSzám
FROM (tSzemélyek LEFT JOIN lkÁlláshelyek ON tSzemélyek.[Státusz kódja] = lkÁlláshelyek.[Álláshely azonosító]) LEFT JOIN tBesorolásÁtalakítóEltérõBesoroláshoz ON lkÁlláshelyek.[Álláshely besorolási kategóriája] = tBesorolásÁtalakítóEltérõBesoroláshoz.[Álláshely besorolási kategóriája]
WHERE ((((SELECT Max(iif(Nz(Tmp.[Jogviszony vége (kilépés dátuma)],0)=0,#01/01/3000#,Tmp.[Jogviszony vége (kilépés dátuma)])) AS [MaxOfJogviszony sorszáma]   FROM tSzemélyek as Tmp         WHERE tSzemélyek.Adójel=Tmp.Adójel AND
[Jogviszony típusa / jogviszony típus]<>"megbízásos"
AND
[Jogviszony típusa / jogviszony típus]<>"személyes jelenlét"
GROUP BY Tmp.Adójel  ))=IIf(Nz([Jogviszony vége (kilépés dátuma)],0)=0,#1/1/3000#,[Jogviszony vége (kilépés dátuma)])))
ORDER BY tSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkSzemélyekOrvosiAdatok
#/#/
SELECT DISTINCT lkSzemélyUtolsóSzervezetiEgysége.Fõosztály, lkSzemélyekOrvosiAdatok00.[Dolgozó teljes neve], lkSzemélyekOrvosiAdatok00.Adójel, lkSzemélyekOrvosiAdatok00.[TAJ szám], lkSzemélyekOrvosiAdatok00.[Adóazonosító jel], lkSzemélyekOrvosiAdatok00.[Orvosi vizsgálat idõpontja], lkSzemélyekOrvosiAdatok00.[Orvosi vizsgálat típusa], lkSzemélyekOrvosiAdatok00.[Orvosi vizsgálat eredménye], lkSzemélyekOrvosiAdatok00.[Orvosi vizsgálat észrevételek], lkSzemélyekOrvosiAdatok00.Következõ, lkSzemélyekOrvosiAdatok00.FõosztályKód, lkSzemélyekOrvosiAdatok00.BFKH, lkSzemélyekOrvosiAdatok00.[Jogviszony típusa / jogviszony típus], lkSzemélyekOrvosiAdatok00.[Tartós távollét típusa], lkSzemélyekOrvosiAdatok00.[Jogviszony sorszáma], lkSzemélyekOrvosiAdatok00.Belépés, lkSzemélyekOrvosiAdatok00.Kilépés, lkSzemélyekOrvosiAdatok00.NexonID, lkSzemélyekOrvosiAdatok00.[státusz kódja] AS [státusz kódja], lkSzemélyUtolsóSzervezetiEgysége.Osztály
FROM (lkSzemélyekOrvosiAdatok00 INNER JOIN lkKövetkezõOrvosiMaxJogviszonyMaxFejenként ON (
      lkSzemélyekOrvosiAdatok00.Adójel = lkKövetkezõOrvosiMaxJogviszonyMaxFejenként.Adójel
    ) AND (
      lkSzemélyekOrvosiAdatok00.[Jogviszony sorszáma] = lkKövetkezõOrvosiMaxJogviszonyMaxFejenként.[MaxOfJogviszony sorszáma]
    )) INNER JOIN lkSzemélyUtolsóSzervezetiEgysége ON lkSzemélyekOrvosiAdatok00.Adójel = lkSzemélyUtolsóSzervezetiEgysége.Adójel;

#/#/#/
lkSzemélyekOrvosiAdatok00
#/#/
SELECT DISTINCT Replace(
    Nz(
      IIf(
        IsNull(
          [tSzemélyek].[Szint 6 szervezeti egység név]
        ), 
        IIf(
          IsNull(
            [tSzemélyek].[Szint 5 szervezeti egység név]
          ), 
          IIf(
            IsNull(
              [tSzemélyek].[Szint 7 szervezeti egység név]
            ), 
            IIf(
              IsNull(
                [tSzemélyek].[Szint 4 szervezeti egység név]
              ), 
              IIf(
                IsNull(
                  [tSzemélyek].[Szint 3 szervezeti egység név]
                ), 
                [tSzemélyek].[Szint 2 szervezeti egység név], 
                [tSzemélyek].[Szint 3 szervezeti egység név]
              ), 
              [tSzemélyek].[Szint 4 szervezeti egység név]
            ), 
            [tSzemélyek].[Szint 7 szervezeti egység név]
          ), 
          [tSzemélyek].[Szint 5 szervezeti egység név]
        ), 
        [tSzemélyek].[Szint 6 szervezeti egység név]
      ), 
      ""
    ), 
    "Budapest Fõváros Kormányhivatala ", 
    "BFKH "
  ) AS Fõosztály, tSzemélyek.[Dolgozó teljes neve], tSzemélyek.Adójel, tSzemélyek.[TAJ szám], tSzemélyek.[Adóazonosító jel], tSzemélyek.[Orvosi vizsgálat idõpontja], tSzemélyek.[Orvosi vizsgálat típusa], tSzemélyek.[Orvosi vizsgálat eredménye], tSzemélyek.[Orvosi vizsgálat észrevételek], (
    [tSzemélyek].[Orvosi vizsgálat következõ idõpontja]
  ) AS Következõ, Replace(
    Nz(
      IIf(
        IsNull(
          [tSzemélyek].[Szint 6 szervezeti egység kód]
        ), 
        IIf(
          IsNull(
            [tSzemélyek].[Szint 5 szervezeti egység kód]
          ), 
          IIf(
            IsNull(
              [tSzemélyek].[Szint 7 szervezeti egység kód]
            ), 
            IIf(
              IsNull(
                [tSzemélyek].[Szint 4 szervezeti egység kód]
              ), 
              IIf(
                IsNull(
                  [tSzemélyek].[Szint 3 szervezeti egység kód]
                ), 
                [tSzemélyek].[Szint 2 szervezeti egység kód], 
                [tSzemélyek].[Szint 3 szervezeti egység kód]
              ), 
              [tSzemélyek].[Szint 4 szervezeti egység kód]
            ), 
            [tSzemélyek].[Szint 7 szervezeti egység kód]
          ), 
          [tSzemélyek].[Szint 5 szervezeti egység kód]
        ), 
        [tSzemélyek].[Szint 6 szervezeti egység kód]
      ), 
      ""
    ), 
    "Budapest Fõváros Kormányhivatala ", 
    "BFKH "
  ) AS FõosztályKód, tSzemélyek.[Szervezeti egység kódja] AS BFKH, tSzemélyek.[Jogviszony típusa / jogviszony típus], tSzemélyek.[Tartós távollét típusa], tSzemélyek.[Jogviszony sorszáma], (
    [Jogviszony kezdete (belépés dátuma) ]
  ) AS Belépés, (
    [Jogviszony vége (kilépés dátuma) ]
  ) AS Kilépés, lkNexonAzonosítók.[Személy azonosító] AS NexonID, tSzemélyek.[Státusz kódja], IIf(
    [fõosztály] = [Szint 7 szervezeti egység név], 
    "", [Szint 7 szervezeti egység név] & ""
  ) AS Osztály
FROM lkNexonAzonosítók RIGHT JOIN tSzemélyek ON lkNexonAzonosítók.Adójel = tSzemélyek.Adójel;

#/#/#/
lkSzemélyUtolsóSzervezetiEgysége
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Jogviszony vége (kilépés dátuma)], IIf(lkSzemélyek.fõosztály="" Or lkSzemélyek.fõosztály Is Null,IIf(lkKilépõUnió.fõosztály="","-",lkKilépõUnió.fõosztály),lkSzemélyek.fõosztály) AS Fõosztály, IIf(lkSzemélyek.osztály="",IIf(lkKilépõUnió.osztály="","-",lkKilépõUnió.osztály),lkSzemélyek.osztály) AS Osztály, IIf(lkSzemélyek.fõosztálykód="",[ányr szervezeti egység azonosító],lkSzemélyek.fõosztálykód) AS FõosztályKód, IIf([Státusz kódja] Is Null,[Álláshely azonosító],[Státusz kódja]) AS ÁNYR
FROM lkSzemélyek LEFT JOIN lkKilépõUnió ON (lkSzemélyek.Adójel = lkKilépõUnió.Adójel) AND (lkSzemélyek.[Jogviszony vége (kilépés dátuma)] = lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja]);

#/#/#/
lkSzervezetiÁlláshelyek
#/#/
SELECT tSzervezeti.OSZLOPOK, bfkh(Nz([tSzervezeti].[Szülõ szervezeti egységének kódja],"")) AS SzervezetKód, tSzervezeti.[Szülõ szervezeti egységének kódja], tSzervezeti.[Szervezetmenedzsment kód] AS ÁlláshelyAzonosító, IIf([Szervezeti egységének szintje]=7 And [Szint3 - kód]="",[Szülõ szervezeti egységének kódja],IIf([Szint6 - kód]="",IIf([Szint5 - kód]="",IIf([Szint4 - kód]="",IIf([Szint3 - kód]="",[Szint2 - kód],[Szint3 - kód]),[Szint4 - kód]),[Szint5 - kód]),[Szint6 - kód])) AS FõosztályKód, tSzervezeti.[Megnevezés szótárelem kódja], tSzervezeti.Név, tSzervezeti.[Érvényesség kezdete], tSzervezeti.[Érvényesség vége], tSzervezeti.[Költséghely kód], tSzervezeti.[Költséghely megnevezés], tSzervezeti.[Szervezeti egységének szintje], tSzervezeti.[Szülõ szervezeti egységének kódja], tSzervezeti.[Szervezeti egységének megnevezése], tSzervezeti.[Szervezeti egységének vezetõje], tSzervezeti.[Szervezeti egységének vezetõjének azonosítója], tSzervezeti.[A költséghely eltér a szervezeti egységének költséghelytõl?], tSzervezeti.[Szervezeti munkakörének kódja], tSzervezeti.[Szervezeti munkakörének megnevezése], tSzervezeti.[A költséghely eltér a szervezeti munkakörének költséghelyétõl?], tSzervezeti.[Vezetõi státusz], tSzervezeti.[Helyettes vezetõ-e], tSzervezeti.[Tervezett betöltési adatok - Jogviszony típus], tSzervezeti.[Tervezett betöltési adatok - Kulcsszám kód], tSzervezeti.[Tervezett betöltési adatok - Kulcsszám megnevezés], tSzervezeti.[Tervezett betöltési adatok - Elõmeneteli fokozat kód], tSzervezeti.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés], tSzervezeti.[Pályáztatás határideje], tSzervezeti.[Vezetõi beosztás KT], tSzervezeti.[Pályáztatás alatt áll], tSzervezeti.Megjegyzés, tSzervezeti.[Státusz engedélyezett óraszáma], tSzervezeti.[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)], tSzervezeti.[Átmeneti óraszám], tSzervezeti.[Átmeneti létszám (FTE)], tSzervezeti.[Közzétett hierarchiában megjelenítendõ], tSzervezeti.[Asszisztens státusz], tSzervezeti.[Létszámon felül létrehozott státusz], tSzervezeti.[Státusz típusa], tSzervezeti.[Státusz betöltési óraszáma], tSzervezeti.[Státusz betöltési FTE], tSzervezeti.[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma], tSzervezeti.[Státusz betöltési FTE minusz státusz engedélyezett FTE], tSzervezeti.[Mióta betöltetlen a státusz (dátum)], tSzervezeti.[Hány napja betöltetlen (munkanap, alapnaptár alapján)], tSzervezeti.[Szint1 - kód], tSzervezeti.[Szint1 - leírás], tSzervezeti.[Szint2 - kód], tSzervezeti.[Szint2 - leírás], tSzervezeti.[Szint3 - kód], tSzervezeti.[Szint3 - leírás], tSzervezeti.[Szint4 - kód], tSzervezeti.[Szint4 - leírás], tSzervezeti.[Szint5 - kód], tSzervezeti.[Szint5 - leírás], tSzervezeti.[Szint6 - kód], tSzervezeti.[Szint6 - leírás], tSzervezeti.[Szint7 - kód], tSzervezeti.[Szint7 - leírás], tSzervezeti.[Szint8 - kód], tSzervezeti.[Szint8 - leírás], Replace(Choose(IIf([Szervezeti egységének szintje]>6,IIf([tSzervezeti].[Szint6 - leírás]="",5,6),[Szervezeti egységének szintje]),[tSzervezeti].[Szint1 - leírás],[tSzervezeti].[Szint2 - leírás],[tSzervezeti].[Szint3 - leírás],[tSzervezeti].[Szint4 - leírás],[tSzervezeti].[Szint5 - leírás],[tSzervezeti].[Szint6 - leírás]) & IIf([tSzervezeti].[Szint7 - kód]="BFKH.1.7.",[tSzervezeti].[Szint7 - leírás],""),"Budapest Fõváros Kormányhivatala","BFKH") AS Fõosztály, IIf([tSzervezeti].[Szint7 - kód]="BFKH.1.7.","",[tSzervezeti].[Szint7 - leírás]) AS Osztály
FROM tSzervezeti
WHERE (((tSzervezeti.[Szervezetmenedzsment kód]) Like "S-*") AND ((tSzervezeti.[Érvényesség kezdete])<=Date()) AND ((tSzervezeti.[Érvényesség vége])>=Date() Or (tSzervezeti.[Érvényesség vége])=0));

#/#/#/
lkSzolgáltatónakBeutaltakról
#/#/
SELECT DISTINCT lkSzemélyek.[TAJ szám], lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Hivatali email], lkSzemélyek.[Hivatali telefon], tBeutalóTípus.BeutalóTípus, Year([Dátum]) AS Év, Month([Dátum]) AS Hó
FROM (lkazNexonAdójel02 INNER JOIN lkSzemélyek ON lkazNexonAdójel02.Adójel = lkSzemélyek.Adójel) INNER JOIN ((tBeutalóTípus INNER JOIN tElkészültBeutalók ON tBeutalóTípus.azBeutalóTípus = tElkészültBeutalók.azBeutalóTípus) INNER JOIN tElküldöttBeutalók ON (tElkészültBeutalók.Idõpont = tElküldöttBeutalók.Dátum) AND (tElkészültBeutalók.NexonID = tElküldöttBeutalók.NexonID)) ON lkazNexonAdójel02.[Személy azonosító] = tElküldöttBeutalók.NexonID;

#/#/#/
lkTMPKövetkezõHaviBeutalók
#/#/
SELECT tTMPKövetkezõHaviBeutalók.[TAJ szám], tTMPKövetkezõHaviBeutalók.Fõosztály, tTMPKövetkezõHaviBeutalók.[Dolgozó teljes neve], tTMPKövetkezõHaviBeutalók.[Születési idõ], tTMPKövetkezõHaviBeutalók.[Születési hely], Replace([tTMPKövetkezõHaviBeutalók].[Állandó lakcím]," (levelezési cím is)","") AS [Állandó lakcím], tTMPKövetkezõHaviBeutalók.[Hivatali email], tTMPKövetkezõHaviBeutalók.munkakör, lkMunkakörKockázatPivot.[1_1] AS [1_1Kézi anyagmozgatás (5kp-20kp)], lkMunkakörKockázatPivot.[1_2] AS [1_2Kézi anyagmozgatás (20kp-50kp)], lkMunkakörKockázatPivot.[1_3] AS [1_3Kézi anyagmozgatás (>50kp)], lkMunkakörKockázatPivot.[2_] AS [2_Fokozott baleseti veszély], lkMunkakörKockázatPivot.[3_] AS [3_Kényszertesthelyzet (görnyedés, guggolás)], lkMunkakörKockázatPivot.[4_] AS 4_Ülés, lkMunkakörKockázatPivot.[5_] AS 5_Állás, lkMunkakörKockázatPivot.[6_] AS 6_Járás, lkMunkakörKockázatPivot.[7_] AS [7_Terhelõ munkahelyi klíma (meleg, hideg, nedves, változó)], lkMunkakörKockázatPivot.[8_] AS 8_Zaj, lkMunkakörKockázatPivot.[9_] AS [9_Ionizáló sugárzás], lkMunkakörKockázatPivot.[10_] AS [10_Nem – ionizáló sugárzás], lkMunkakörKockázatPivot.[11_] AS [11_Helyileg ható vibráció], lkMunkakörKockázatPivot.[12_] AS [12_Egésztest vibráció], lkMunkakörKockázatPivot.[13_] AS [13_Ergonómiai tényezõk], lkMunkakörKockázatPivot.[14_] AS [14_Porok megnevezése], lkMunkakörKockázatPivot.[15_] AS [15_Vegyi anyagok], lkMunkakörKockázatPivot.[16_] AS [16_Járványügyi érdekbõl kiemelt munkakör], lkMunkakörKockázatPivot.[17_] AS 17_Fertõzésveszély, lkMunkakörKockázatPivot.[18_] AS [18_Fokozott pszichés terhelés], lkMunkakörKockázatPivot.[19_] AS [19_Képernyõ elõtt végzett munka], lkMunkakörKockázatPivot.[20_] AS [20_Éjszakai mûszakban végzett munka], lkMunkakörKockázatPivot.[21_] AS [21_Pszichoszociális tényezõk], lkMunkakörKockázatPivot.[22_] AS [22_Egyéni védõeszköz általi terhelés], lkMunkakörKockázatPivot.[23_] AS 23_Egyéb
FROM lkMunkakörKockázatPivot INNER JOIN tTMPKövetkezõHaviBeutalók ON lkMunkakörKockázatPivot.MunkakörKód = tTMPKövetkezõHaviBeutalók.MunkakörKÓD;

#/#/#/
lktTMPKövetkezõHaviBeutalókKészítõ
#/#/
SELECT lkKövetkezõHaviBeutalók.* INTO tTMPKövetkezõHaviBeutalók
FROM lkKövetkezõHaviBeutalók;

#/#/#/
lkVisszajelzésekSzámaFõosztályonként
#/#/
SELECT lkSzemélyek.FõosztályKód, Count(lkEgészségügyiVisszajelzésekSzemélyek.azEgészségügyiVisszajelzés) AS Visszajelzés
FROM (lkEgészségügyiVisszajelzésekSzemélyek INNER JOIN tNexonAzonosítók ON lkEgészségügyiVisszajelzésekSzemélyek.azonosító = tNexonAzonosítók.[Személy azonosító]) INNER JOIN lkSzemélyek ON tNexonAzonosítók.[Adóazonosító jel] = lkSzemélyek.[Adóazonosító jel]
GROUP BY lkSzemélyek.FõosztályKód;

#/#/#/
lkVisszajelzésekSzámaFõosztályonként01
#/#/
SELECT Unió.Fõosztály AS [Fõosztály Kódja], lkFõosztályok.Fõosztály AS [Fõosztály neve], Sum(Unió.Visszajelzés) AS [A visszajelzések száma]
FROM lkFõosztályok INNER JOIN (SELECT tEgyesMunkakörökFõosztályai.Fõosztály, 0 AS Visszajelzés
FROM tEgyesMunkakörökFõosztályai
UNION
SELECT * FROM lkVisszajelzésekSzámaFõosztályonként)  AS Unió ON lkFõosztályok.FõosztályKód = Unió.Fõosztály
GROUP BY Unió.Fõosztály, lkFõosztályok.Fõosztály
ORDER BY Unió.Fõosztály;

#/#/#/
lkVisszajelzésekSzámaFõosztályonként02
#/#/
SELECT Subquery.Fõosztály, Subquery.FõosztályKód, lkVisszajelzésekSzámaFõosztályonként01.[A visszajelzések száma]
FROM (SELECT DISTINCT lkSzemélyek.Fõosztály, lkSzemélyek.FõosztályKód FROM lkSzemélyek INNER JOIN tBejövõÜzenetek ON lkSzemélyek.[Hivatali email] = tBejövõÜzenetek.SenderEmailAddress WHERE (((lkSzemélyek.Fõosztály)<>"Humánpolitikai Fõosztály" And (lkSzemélyek.Fõosztály) Is Not Null And (lkSzemélyek.Fõosztály)<>"")))  AS Subquery RIGHT JOIN lkVisszajelzésekSzámaFõosztályonként01 ON Subquery.FõosztályKód = lkVisszajelzésekSzámaFõosztályonként01.[Fõosztály Kódja];

