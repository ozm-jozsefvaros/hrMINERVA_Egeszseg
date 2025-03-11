CREATE TABLE [2024_4_néviElszámolás] (
[TAJ] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[Alk# tipus] TEXT(255) NULL,
[Alk# dátuma] DATETIME NULL,
[Érvényes] DATETIME NULL
);

CREATE TABLE [Álláshelyek] (
[Azonosító] LONG NULL,
[Szervezet] TEXT(255) NULL,
[1 szint] TEXT(255) NULL,
[2 szint] TEXT(255) NULL,
[3 szint] TEXT(255) NULL,
[4 szint] TEXT(255) NULL,
[5 szint] TEXT(255) NULL,
[6 szint] TEXT(255) NULL,
[7 szint] TEXT(255) NULL,
[8 szint] TEXT(255) NULL,
[Álláshely típusa] TEXT(255) NULL,
[Álláshely altípusa] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Álláshely besorolási osztálya] TEXT(255) NULL,
[Álláshely besorolási kategóriája] TEXT(255) NULL,
[Hatályosság kezdete] DATETIME NULL,
[Álláshely státusza] TEXT(255) NULL,
[Zárolás várható dátuma] DATETIME NULL,
[Álláshelyen fennálló jogviszony] TEXT(255) NULL,
[Álláshelykeretbe tartozó álláshely] TEXT(255) NULL,
[Álláshelyen fennálló jogviszony ideje] DOUBLE NULL,
[Álláshely hatályának jellege] TEXT(255) NULL,
[Álláshely finanszírozási forrása] TEXT(255) NULL,
[Munkaidõ jellege] TEXT(255) NULL,
[Részmunkaidõs darabszám] DOUBLE NULL,
[Hatályosság vége] TEXT(255) NULL,
[Utolsó módosítás dátuma] DATETIME NULL,
[Migrációs állomány neve] TEXT(255) NULL,
[Állomány sora] TEXT(255) NULL,
[Hatály] DATETIME NULL
);

ALTER TABLE [Álláshelyek] ADD CONSTRAINT [PK_Álláshelyek] PRIMARY KEY ([Azonosító]);

CREATE TABLE [Beillesztési hiba] (
[azMunkakör] TEXT(255) NULL,
[azKockázat] TEXT(255) NULL,
[TeljesMunkaidõben] LONG NULL
);

CREATE TABLE [Járási_állomány] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Mezõ4] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Járási Hivatal] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ9] TEXT(255) NULL,
[Mezõ10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;] TEXT(255) NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Heti munkaórák száma] DOUBLE NULL,
[Mezõ14] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Mezõ18] CURRENCY NULL,
[Mezõ19] CURRENCY NULL,
[Mezõ20] TEXT(255) NULL,
[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs] TEXT(255) NULL,
[Mezõ26] TEXT(255) NULL,
[Mezõ27] TEXT(255) NULL,
[Mezõ28] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [Adóazonosító] ON [Járási_állomány] ([Adóazonosító]);

CREATE INDEX [HatályaID] ON [Járási_állomány] ([HatályaID]);

CREATE TABLE [Kilépõk] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva] TEXT(255) NULL,
[Jogviszony kezdõ dátuma] DATETIME NULL,
[Jogviszony megszûnésének, megszüntetésének idõpontja] DATETIME NULL,
[Illetmény (Ft/hó)] CURRENCY NULL,
[Végkielégítésre jogosító hónapok száma] DOUBLE NULL,
[Felmentési idõ hónapok száma] TEXT(255) NULL
);

CREATE INDEX [Alaplétszám] ON [Kilépõk] ([Alaplétszám]);

CREATE INDEX [Sorszám] ON [Kilépõk] ([Sorszám]);

CREATE TABLE [Kormányhivatali_állomány] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Mezõ4] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ9] TEXT(255) NULL,
[Mezõ10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;] TEXT(255) NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Heti munkaórák száma] DOUBLE NULL,
[Mezõ14] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Mezõ18] CURRENCY NULL,
[Mezõ19] CURRENCY NULL,
[Mezõ20] TEXT(255) NULL,
[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs] TEXT(255) NULL,
[Mezõ26] TEXT(255) NULL,
[Mezõ27] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [HatályaID] ON [Kormányhivatali_állomány] ([HatályaID]);

CREATE TABLE [Központosítottak] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Mezõ4] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] TEXT(255) NULL,
[Mezõ10] TEXT(255) NULL,
[Mezõ11] DATETIME NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Mezõ13] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Mezõ17] CURRENCY NULL,
[Mezõ18] TEXT(255) NULL,
[Tartós távollévõ nincs helyettese (TT)/ tartós távollévõnek van ] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [Adóazonosító] ON [Központosítottak] ([Adóazonosító]);

CREATE INDEX [HatályaID] ON [Központosítottak] ([HatályaID]);

CREATE TABLE [ktMunkakörKockázat] (
[azMunkakör] LONG NOT NULL,
[azKockázat] LONG NOT NULL,
[TeljesMunkaidõben] LONG NULL
);

ALTER TABLE [ktMunkakörKockázat] ADD CONSTRAINT [PK_ktMunkakörKockázat] PRIMARY KEY ([azMunkakör],[azKockázat]);

CREATE TABLE [t2024IVnévbenVizsgáltak] (
[Adójel] DOUBLE NULL,
[orvosi vizsgálathoz kötött-e] TEXT(255) NULL
);

CREATE TABLE [tBejövõÜzenetek] (
[azÜzenet] LONG NULL,
[CommonMessageId] TEXT(255) NOT NULL,
[SenderEmailAddress] TEXT(255) NULL,
[DeliveredDate] DATETIME NULL
);

CREATE INDEX [CommonMessageId] ON [tBejövõÜzenetek] ([CommonMessageId]);

ALTER TABLE [tBejövõÜzenetek] ADD CONSTRAINT [PK_tBejövõÜzenetek] PRIMARY KEY ([azÜzenet]);

CREATE TABLE [tBesorolásÁtalakítóEltérõBesoroláshoz] (
[Azonosító] LONG NULL,
[Besorolási  fokozat (KT)] TEXT(255) NULL,
[Álláshely besorolási kategóriája] TEXT(255) NULL,
[rang] LONG NULL,
[jel] TEXT(255) NULL
);

ALTER TABLE [tBesorolásÁtalakítóEltérõBesoroláshoz] ADD CONSTRAINT [PK_tBesorolásÁtalakítóEltérõBesoroláshoz] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tBeutalóTípus] (
[azBeutalóTípus] LONG NULL,
[BeutalóTípus] TEXT(255) NULL
);

ALTER TABLE [tBeutalóTípus] ADD CONSTRAINT [PK_tBeutalóTípus] PRIMARY KEY ([azBeutalóTípus]);

CREATE TABLE [tEgészségügyiVisszajelzések] (
[azEgészségügyiVisszajelzés] LONG NULL,
[azÜzenet] LONG NULL,
[azonosító] TEXT(255) NULL,
[Érték] TEXT(4) NULL
);

CREATE INDEX [tBejövõÜzenetektEgészségügyiVisszajelzések] ON [tEgészségügyiVisszajelzések] ([azÜzenet]);

CREATE INDEX [tEgészségügyiVisszajelzésekazÜzenet] ON [tEgészségügyiVisszajelzések] ([azÜzenet]);

ALTER TABLE [tEgészségügyiVisszajelzések] ADD CONSTRAINT [PK_tEgészségügyiVisszajelzések] PRIMARY KEY ([azEgészségügyiVisszajelzés]);

CREATE TABLE [tEgyesMunkakörökFõosztályai] (
[Azonosító] LONG NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL
);

ALTER TABLE [tEgyesMunkakörökFõosztályai] ADD CONSTRAINT [PK_tEgyesMunkakörökFõosztályai] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tElkészültBeutalók] (
[azBeutaló] LONG NULL,
[NexonID] LONG NULL,
[Idõpont] DATETIME NULL,
[azBeutalóTípus] LONG NULL,
[MunkakörKÓD] TEXT(3) NULL
);

CREATE INDEX [azBeutalóTípus] ON [tElkészültBeutalók] ([azBeutalóTípus]);

CREATE INDEX [MunkakörKÓD] ON [tElkészültBeutalók] ([MunkakörKÓD]);

CREATE INDEX [NexonID] ON [tElkészültBeutalók] ([NexonID]);

CREATE INDEX [tBeutalóTípustElkészültBeutalók] ON [tElkészültBeutalók] ([azBeutalóTípus]);

CREATE INDEX [tMunkaköröktElkészültBeutalók] ON [tElkészültBeutalók] ([MunkakörKÓD]);

ALTER TABLE [tElkészültBeutalók] ADD CONSTRAINT [PK_tElkészültBeutalók] PRIMARY KEY ([azBeutaló]);

CREATE TABLE [tElküldöttBeutalók] (
[azElküldöttBeutaló] LONG NULL,
[NexonID] LONG NULL,
[Dátum] DATETIME NULL,
[DeliveredDate] DATETIME NULL,
[ClientMessageId] TEXT(255) NULL
);

CREATE INDEX [ClientMessageId] ON [tElküldöttBeutalók] ([ClientMessageId]);

CREATE INDEX [NexonID] ON [tElküldöttBeutalók] ([NexonID]);

ALTER TABLE [tElküldöttBeutalók] ADD CONSTRAINT [PK_tElküldöttBeutalók] PRIMARY KEY ([azElküldöttBeutaló]);

CREATE TABLE [tEüÁr] (
[azEüÁr] LONG NULL,
[EüÁr] CURRENCY NULL,
[Hatály] DATETIME NULL,
[azEüOsztály] LONG NULL
);

CREATE INDEX [tEüOsztályoktEüÁr] ON [tEüÁr] ([azEüOsztály]);

ALTER TABLE [tEüÁr] ADD CONSTRAINT [PK_tEüÁr] PRIMARY KEY ([azEüÁr]);

CREATE TABLE [tEüOsztályok] (
[azEüOsztály] LONG NULL,
[EüOsztály] TEXT(255) NULL
);

ALTER TABLE [tEüOsztályok] ADD CONSTRAINT [PK_tEüOsztályok] PRIMARY KEY ([azEüOsztály]);

CREATE TABLE [tKiegészítõEmailCímek] (
[azKiegEmail] LONG NULL,
[Email] TEXT(255) NULL,
[FõosztályKód] TEXT(255) NULL
);

ALTER TABLE [tKiegészítõEmailCímek] ADD CONSTRAINT [PK_tKiegészítõEmailCímek] PRIMARY KEY ([azKiegEmail]);

CREATE TABLE [tKilépõkUnió] (
[Adójel] DOUBLE NULL,
[azKilépõk] LONG NULL,
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva] TEXT(255) NULL,
[Jogviszony kezdõ dátuma] DATETIME NULL,
[Jogviszony megszûnésének, megszüntetésének idõpontja] DATETIME NULL,
[Illetmény (Ft/hó)] CURRENCY NULL,
[Végkielégítésre jogosító hónapok száma] DOUBLE NULL,
[Felmentési idõ hónapok száma] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[BFKH] TEXT(255) NULL,
[Kilépés] DATETIME NULL,
[Év] DATETIME NULL
);

CREATE TABLE [tKockázatok] (
[azKockázat] LONG NULL,
[KockázatiKód] TEXT(4) NULL,
[Kockázat] TEXT(255) NULL
);

CREATE INDEX [KockázatiKód] ON [tKockázatok] ([KockázatiKód]);

ALTER TABLE [tKockázatok] ADD CONSTRAINT [PK_tKockázatok] PRIMARY KEY ([azKockázat]);

CREATE TABLE [tMunkakörElküldöttLevelek] (
[azLevél] LONG NULL,
[ClientMessageId] TEXT(255) NULL,
[deliveredDate] DATETIME NULL,
[Adójel] DOUBLE NULL,
[BFKHKód] TEXT(255) NULL,
[username] TEXT(255) NULL
);

CREATE INDEX [tMunkakörElküldöttLevelekAdójel] ON [tMunkakörElküldöttLevelek] ([Adójel]);

ALTER TABLE [tMunkakörElküldöttLevelek] ADD CONSTRAINT [PK_tMunkakörElküldöttLevelek] PRIMARY KEY ([azLevél]);

CREATE TABLE [tMunkakörKörlevélMellékletÚtvonalak] (
[azMelléklet] LONG NULL,
[FõosztályNeve] TEXT(255) NULL,
[Útvonal] TEXT(255) NULL,
[Készült] DATETIME NULL
);

ALTER TABLE [tMunkakörKörlevélMellékletÚtvonalak] ADD CONSTRAINT [PK_tMunkakörKörlevélMellékletÚtvonalak] PRIMARY KEY ([azMelléklet]);

CREATE TABLE [tMunkakörök] (
[azMunkakör] LONG NULL,
[MunkakörKód] TEXT(4) NULL,
[Munkakör] TEXT(255) NULL,
[azEüOsztály] LONG NULL
);

CREATE INDEX [körkód] ON [tMunkakörök] ([MunkakörKód]);

CREATE INDEX [tEüOsztályoktMunkakörök] ON [tMunkakörök] ([azEüOsztály]);

ALTER TABLE [tMunkakörök] ADD CONSTRAINT [PK_tMunkakörök] PRIMARY KEY ([azMunkakör]);

CREATE TABLE [tMunkakörökMellékletbeKerültek] (
[Az] LONG NULL,
[azMelléklet] LONG NULL,
[Idõpont] DATETIME NULL,
[ID] TEXT(255) NULL
);

CREATE INDEX [tMunkakörKörlevélMellékletÚtvtMunkakörökMellékletbeKerültek] ON [tMunkakörökMellékletbeKerültek] ([azMelléklet]);

ALTER TABLE [tMunkakörökMellékletbeKerültek] ADD CONSTRAINT [PK_tMunkakörökMellékletbeKerültek] PRIMARY KEY ([Az]);

CREATE TABLE [tNexonAzonosítók] (
[Azonosító] LONG NULL,
[Személy azonosító] DOUBLE NOT NULL,
[HR kapcsolat azonosító] DOUBLE NOT NULL,
[Név] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Egyedi azonosító] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Jogviszony típus] TEXT(255) NULL,
[Kezdete] TEXT(255) NULL,
[Vége] TEXT(255) NULL,
[Szervezeti egység] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Munkakör] TEXT(255) NULL,
[Státusz] TEXT(255) NULL,
[TörténetiSorszám] LONG NULL
);

CREATE INDEX [Adóazonosító jel] ON [tNexonAzonosítók] ([Adóazonosító jel]);

CREATE INDEX [HR kapcsolat azonosító] ON [tNexonAzonosítók] ([HR kapcsolat azonosító]);

CREATE INDEX [Személy azonosító] ON [tNexonAzonosítók] ([Személy azonosító]);

CREATE INDEX [SzemélyKapcsolat] ON [tNexonAzonosítók] ([Személy azonosító],[HR kapcsolat azonosító]);

CREATE INDEX [tNexonAzonosítókazonosító] ON [tNexonAzonosítók] ([Azonosító]);

ALTER TABLE [tNexonAzonosítók] ADD CONSTRAINT [PK_tNexonAzonosítók] PRIMARY KEY ([HR kapcsolat azonosító]);

CREATE TABLE [tOrvosiAlkalmasságiDíjtételek] (
[azOrvosiDíjtétel] LONG NULL,
[AlkalmasságiOsztály] TEXT(255) NULL,
[Alk# tipus] TEXT(255) NULL,
[Díjtétel] CURRENCY NULL
);

ALTER TABLE [tOrvosiAlkalmasságiDíjtételek] ADD CONSTRAINT [PK_tOrvosiAlkalmasságiDíjtételek] PRIMARY KEY ([azOrvosiDíjtétel]);

CREATE TABLE [tSzemélyek] (
[Azonosító] LONG NULL,
[Adójel] DOUBLE NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Dolgozó születési neve] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Születési hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Egyedi azonosító] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Ügyfélkapu kód] TEXT(255) NULL,
[Elsõdleges állampolgárság] TEXT(255) NULL,
[Személyi igazolvány száma] TEXT(255) NULL,
[Személyi igazolvány érvényesség kezdete] DATETIME NULL,
[Személyi igazolvány érvényesség vége] DATETIME NULL,
[Nyelvtudás Angol] TEXT(255) NULL,
[Nyelvtudás Arab] TEXT(255) NULL,
[Nyelvtudás Bolgár] TEXT(255) NULL,
[Nyelvtudás Cigány] TEXT(255) NULL,
[Nyelvtudás Cigány (lovári)] TEXT(255) NULL,
[Nyelvtudás Cseh] TEXT(255) NULL,
[Nyelvtudás Eszperantó] TEXT(255) NULL,
[Nyelvtudás Finn] TEXT(255) NULL,
[Nyelvtudás Francia] TEXT(255) NULL,
[Nyelvtudás Héber] TEXT(255) NULL,
[Nyelvtudás Holland] TEXT(255) NULL,
[Nyelvtudás Horvát] TEXT(255) NULL,
[Nyelvtudás Japán] TEXT(255) NULL,
[Nyelvtudás Jelnyelv] TEXT(255) NULL,
[Nyelvtudás Kínai] TEXT(255) NULL,
[Nyelvtudás Koreai] TEXT(255) NULL,
[Nyelvtudás Latin] TEXT(255) NULL,
[Nyelvtudás Lengyel] TEXT(255) NULL,
[Nyelvtudás Német] TEXT(255) NULL,
[Nyelvtudás Norvég] TEXT(255) NULL,
[Nyelvtudás Olasz] TEXT(255) NULL,
[Nyelvtudás Orosz] TEXT(255) NULL,
[Nyelvtudás Portugál] TEXT(255) NULL,
[Nyelvtudás Román] TEXT(255) NULL,
[Nyelvtudás Spanyol] TEXT(255) NULL,
[Nyelvtudás Szerb] TEXT(255) NULL,
[Nyelvtudás Szlovák] TEXT(255) NULL,
[Nyelvtudás Szlovén] TEXT(255) NULL,
[Nyelvtudás Török] TEXT(255) NULL,
[Nyelvtudás Újgörög] TEXT(255) NULL,
[Nyelvtudás Ukrán] TEXT(255) NULL,
[Orvosi vizsgálat idõpontja] DATETIME NULL,
[Orvosi vizsgálat típusa] TEXT(255) NULL,
[Orvosi vizsgálat eredménye] TEXT(255) NULL,
[Orvosi vizsgálat észrevételek] TEXT(255) NULL,
[Orvosi vizsgálat következõ idõpontja] DATETIME NULL,
[Erkölcsi bizonyítvány száma] TEXT(255) NULL,
[Erkölcsi bizonyítvány dátuma] DATETIME NULL,
[Erkölcsi bizonyítvány eredménye] TEXT(255) NULL,
[Erkölcsi bizonyítvány kérelem azonosító] TEXT(255) NULL,
[Erkölcsi bizonyítvány közügyektõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány jármûvezetéstõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány intézkedés alatt áll] TEXT(255) NULL,
[Munkaköri leírások (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Egyéb HR dokumentumok (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Kormányhivatal rövid neve] TEXT(255) NULL,
[Szervezeti egység kódja] TEXT(255) NULL,
[Szervezeti egység neve] TEXT(255) NULL,
[Szervezeti munkakör neve] TEXT(255) NULL,
[Vezetõi megbízás típusa] TEXT(255) NULL,
[Státusz kódja] TEXT(255) NULL,
[Státusz költséghelyének kódja] TEXT(255) NULL,
[Státusz költséghelyének neve ] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] YESNO NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz neve] TEXT(255) NULL,
[Többes betöltés] YESNO NULL,
[Vezetõ neve] TEXT(255) NULL,
[Vezetõ adóazonosító jele] TEXT(255) NULL,
[Vezetõ email címe] TEXT(255) NULL,
[Állandó lakcím] TEXT(255) NULL,
[Tartózkodási lakcím] TEXT(255) NULL,
[Levelezési cím_] TEXT(255) NULL,
[Öregségi nyugdíj-korhatár elérésének idõpontja (dátum)] DATETIME NULL,
[Nyugdíjas] YESNO NULL,
[Nyugdíj típusa] TEXT(255) NULL,
[Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik] TEXT(255) NULL,
[Megváltozott munkaképesség] YESNO NULL,
[Önkéntes tartalékos katona] YESNO NULL,
[Utolsó vagyonnyilatkozat leadásának dátuma] DATETIME NULL,
[Vagyonnyilatkozat nyilvántartási száma] TEXT(255) NULL,
[Következõ vagyonnyilatkozat esedékessége] DATETIME NULL,
[Nemzetbiztonsági ellenõrzés dátuma] TEXT(255) NULL,
[Védett állományba tartozó munkakör] YESNO NULL,
[Vezetõi megbízás típusa1] TEXT(255) NULL,
[Vezetõi beosztás megnevezése] TEXT(255) NULL,
[Vezetõi beosztás (megbízás) kezdete] DATETIME NULL,
[Vezetõi beosztás (megbízás) vége] TEXT(255) NULL,
[Iskolai végzettség foka] TEXT(255) NULL,
[Iskolai végzettség neve] TEXT(255) NULL,
[Alapvizsga kötelezés dátuma] DATETIME NULL,
[Alapvizsga letétel tényleges határideje] TEXT(255) NULL,
[Alapvizsga mentesség] YESNO NULL,
[Alapvizsga mentesség oka] TEXT(255) NULL,
[Szakvizsga kötelezés dátuma] TEXT(255) NULL,
[Szakvizsga letétel tényleges határideje] TEXT(255) NULL,
[Szakvizsga mentesség] YESNO NULL,
[Foglalkozási viszony] TEXT(255) NULL,
[Foglalkozási viszony statisztikai besorolása] TEXT(255) NULL,
[Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban] TEXT(255) NULL,
[Beosztástervezés helyszínek] TEXT(255) NULL,
[Beosztástervezés tevékenységek] TEXT(255) NULL,
[Részleges távmunka szerzõdés kezdete] TEXT(255) NULL,
[Részleges távmunka szerzõdés vége] TEXT(255) NULL,
[Részleges távmunka szerzõdés intervalluma] TEXT(255) NULL,
[Részleges távmunka szerzõdés mértéke] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne 2] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne 3] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás kezdete] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás vége] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás mértéke] TEXT(255) NULL,
[KIRA feladat azonosítója - intézmény prefix-szel ellátva] TEXT(255) NULL,
[KIRA feladat azonosítója] TEXT(255) NULL,
[KIRA feladat megnevezés] TEXT(255) NULL,
[Osztott munkakör] TEXT(255) NULL,
[Funkciócsoport: kód-megnevezés] TEXT(255) NULL,
[Funkció: kód-megnevezés] TEXT(255) NULL,
[Dolgozó költséghelyének kódja] TEXT(255) NULL,
[Dolgozó költséghelyének neve] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Elsõdleges feladatkör] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó napi óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker] DOUBLE NULL,
[Szerzõdés/Kinevezés típusa] TEXT(255) NULL,
[Iktatószám] TEXT(255) NULL,
[Szerzõdés/kinevezés verzió_érvényesség kezdete] DATETIME NULL,
[Szerzõdés/kinevezés verzió_érvényesség vége] DATETIME NULL,
[Határozott idejû _szerzõdés/kinevezés lejár] DATETIME NULL,
[Szerzõdés dokumentum (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Megjegyzés (pl# határozott szerzõdés/kinevezés oka)] TEXT(255) NULL,
[Munkavégzés helye - megnevezés] TEXT(255) NULL,
[Munkavégzés helye - cím] TEXT(255) NULL,
[Jogviszony típusa / jogviszony típus] TEXT(255) NULL,
[Jogviszony sorszáma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[Kölcsönbe adó cég] TEXT(255) NULL,
[Teljesítményértékelés - Értékelõ személy] TEXT(255) NULL,
[Teljesítményértékelés - Érvényesség kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak vége] TEXT(255) NULL,
[Teljesítményértékelés dátuma] TEXT(255) NULL,
[Teljesítményértékelés - Beállási százalék] TEXT(255) NULL,
[Teljesítményértékelés - Pontszám] TEXT(255) NULL,
[Teljesítményértékelés - Megjegyzés] TEXT(255) NULL,
[Dolgozói jellemzõk] TEXT(255) NULL,
[Fizetési osztály (KA)/ Pedagógusi fokozat (KA pedagógus)/besorol] TEXT(255) NULL,
[Besorolási  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos idõ kezdete] TEXT(255) NULL,
[Jogviszony kezdete (belépés dátuma)] DATETIME NULL,
[Jogviszony vége (kilépés dátuma)] DATETIME NULL,
[Utolsó munkában töltött nap] TEXT(255) NULL,
[Kezdeményezés dátuma] TEXT(255) NULL,
[Hatályossá válik] TEXT(255) NULL,
[HR kapcsolat megszûnés módja (Kilépés módja)] TEXT(255) NULL,
[HR kapcsolat megszûnes indoka (Kilépés indoka)] TEXT(255) NULL,
[Indokolás] TEXT(255) NULL,
[Következõ munkahely] TEXT(255) NULL,
[MT: Felmondási idõ kezdete KJT, KTTV: Felmentési idõ kezdete] TEXT(255) NULL,
[Felmondási idõ vége (MT) Felmentési idõ vége (KJT, KTTV)] TEXT(255) NULL,
[Munkavégzés alóli mentesítés kezdete (KJT, KTTV) Felmentési idõ ] TEXT(255) NULL,
[Munkavégzés alóli mentesítés vége (KJT, KTTV) Felmentési idõ vég] TEXT(255) NULL,
[Átmeneti eltérõ foglalkoztatás típusa] TEXT(255) NULL,
[Átmeneti eltérõ foglalkoztatás kezdete] TEXT(255) NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Tartós távollét kezdete] TEXT(255) NULL,
[Tartós távollét vége] TEXT(255) NULL,
[Tartós távollét tervezett vége] TEXT(255) NULL,
[Helyettesített dolgozó neve] TEXT(255) NULL,
[Szerzõdés/Kinevezés - próbaidõ vége] DATETIME NULL,
[Utalási cím] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)] DOUBLE NULL,
[Garantált bérminimumra történõ kiegészítés] TEXT(255) NULL,
[Kerekítés] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérít] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (el] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérítés nélküli)] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérítés nél] TEXT(255) NULL,
[Egyéb pótlék - összeg (eltérítés nélküli)] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérítés nélküli)] DOUBLE NULL,
[Kerekített 100 %-os illetmény (eltérítés nélküli)] DOUBLE NULL,
[Eltérítés %] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérített)] DOUBLE NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérí1] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (e1] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérített)] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérített)] TEXT(255) NULL,
[Egyéb pótlék - összeg (eltérített)] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérített)] DOUBLE NULL,
[Kerekített 100 %-os illetmény (eltérített)] DOUBLE NULL,
[További munkavégzés helye 1 Teljes munkaidõ %-a] TEXT(255) NULL,
[További munkavégzés helye 2 Teljes munkaidõ %-a] TEXT(255) NULL,
[KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ] DOUBLE NULL,
[Szint 1 szervezeti egység név] TEXT(255) NULL,
[Szint 1 szervezeti egység kód] TEXT(255) NULL,
[Szint 2 szervezeti egység név] TEXT(255) NULL,
[Szint 2 szervezeti egység kód] TEXT(255) NULL,
[Szint 3 szervezeti egység név] TEXT(255) NULL,
[Szint 3 szervezeti egység kód] TEXT(255) NULL,
[Szint 4 szervezeti egység név] TEXT(255) NULL,
[Szint 4 szervezeti egység kód] TEXT(255) NULL,
[Szint 5 szervezeti egység név] TEXT(255) NULL,
[Szint 5 szervezeti egység kód] TEXT(255) NULL,
[Szint 6 szervezeti egység név] TEXT(255) NULL,
[Szint 6 szervezeti egység kód] TEXT(255) NULL,
[Szint 7 szervezeti egység név] TEXT(255) NULL,
[Szint 7 szervezeti egység kód] TEXT(255) NULL,
[Szint 8 szervezeti egység név] TEXT(255) NULL,
[Szint 8 szervezeti egység kód] TEXT(255) NULL,
[AD egyedi azonosító] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mellék] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[További otthoni mobil] TEXT(255) NULL
);

CREATE INDEX [Adójel] ON [tSzemélyek] ([Adójel]);

CREATE INDEX [Belépés] ON [tSzemélyek] ([Jogviszony kezdete (belépés dátuma)]);

CREATE INDEX [Dolgozó teljes neve] ON [tSzemélyek] ([Dolgozó teljes neve]);

CREATE INDEX [Kilépés] ON [tSzemélyek] ([Jogviszony vége (kilépés dátuma)]);

CREATE INDEX [Státusz kódja] ON [tSzemélyek] ([Státusz kódja]);

CREATE INDEX [Szervezeti egység kódja] ON [tSzemélyek] ([Szervezeti egység kódja]);

CREATE INDEX [tSzemélyekAdóazonosító jel] ON [tSzemélyek] ([Adóazonosító jel]);

ALTER TABLE [tSzemélyek] ADD CONSTRAINT [PK_tSzemélyek] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tSzervezeti] (
[Azonosító] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment kód] TEXT(255) NULL,
[HR kapcsolat sorszáma] DOUBLE NULL,
[Megnevezés szótárelem kódja] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Rövid név] TEXT(255) NULL,
[Érvényesség kezdete] DATETIME NULL,
[Érvényesség vége] DATETIME NULL,
[Adószám] TEXT(255) NULL,
[KSH szám] TEXT(255) NULL,
[OEP nyilvántartási szám] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Székhely cím] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egységek száma (db)] TEXT(255) NULL,
[Betöltött státuszok száma (db)] DOUBLE NULL,
[Betöltetlen státuszok száma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egység vezetõje] TEXT(255) NULL,
[Szervezeti egység vezetõjének azonosítója] TEXT(255) NULL,
[Kormányhivatal neve] TEXT(255) NULL,
[Költséghely kód] TEXT(255) NULL,
[Költséghely megnevezés] TEXT(255) NULL,
[Szervezeti egység típus] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Engedélyezett vezetõi létszám] TEXT(255) NULL,
[Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Bér F6 besorolási szint megnevezés] TEXT(255) NULL,
[Szervezeti egységének szintje] DOUBLE NULL,
[Munkáltatói jogkört gyakorló] TEXT(255) NULL,
[Szülõ szervezeti egységének kódja] TEXT(255) NULL,
[Szervezeti egységének megnevezése] TEXT(255) NULL,
[Szervezeti egységének vezetõje] TEXT(255) NULL,
[Szervezeti egységének vezetõjének azonosítója] TEXT(255) NULL,
[Szervezeti egységének költséghely kódja] TEXT(255) NULL,
[Szervezeti egységének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti egységének költséghelytõl?] TEXT(255) NULL,
[Szervezeti munkakörének kódja] TEXT(255) NULL,
[Szervezeti munkakörének megnevezése] TEXT(255) NULL,
[Szervezeti munkakörének költséghely kódja] TEXT(255) NULL,
[Szervezeti munkakörének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti munkakörének költséghelyétõl?] TEXT(255) NULL,
[Státuszbetöltéssel rendelkezik a kilépést követõen?] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási kódja] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[A Bér F6 besorolási szint eltér a szervezeti munkakörének Bér F6] TEXT(255) NULL,
[Vezetõi státusz] TEXT(255) NULL,
[Képzési költségkeret] TEXT(255) NULL,
[Helyettes vezetõ-e] TEXT(255) NULL,
[Tervezett betöltési adatok - Jogviszony típus] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám megnevezés] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] TEXT(255) NULL,
[Pályáztatás határideje] TEXT(255) NULL,
[Vezetõi beosztás KA] TEXT(255) NULL,
[Vezetõi beosztás KT] TEXT(255) NULL,
[Pályáztatás alatt áll] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL,
[Státusz zárolás oka] TEXT(255) NULL,
[Státusz zárolás kezdete] DATETIME NULL,
[Státusz zárolás vége] DATETIME NULL,
[Státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)] DOUBLE NULL,
[Átmeneti óraszám] DOUBLE NULL,
[Átmeneti létszám (FTE)] DOUBLE NULL,
[Közzétett hierarchiában megjelenítendõ] TEXT(255) NULL,
[Asszisztens státusz] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] TEXT(255) NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz betöltési óraszáma] DOUBLE NULL,
[Státusz betöltési FTE] DOUBLE NULL,
[Helyettesítés mértéke (%)] DOUBLE NULL,
[Helyettesítési díj (%)] DOUBLE NULL,
[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz betöltési FTE minusz státusz engedélyezett FTE] DOUBLE NULL,
[Státuszának kódja] TEXT(255) NULL,
[Státuszának neve] TEXT(255) NULL,
[Státuszának az engedélyezett óraszáma] DOUBLE NULL,
[Mezõ82] DOUBLE NULL,
[Aktuális betöltés óraszáma] DOUBLE NULL,
[Aktuális betöltés FTE] DOUBLE NULL,
[Státuszának költséghely kódja] TEXT(255) NULL,
[Státuszának költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a státuszának költséghelyétõl?] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[Mezõ90] TEXT(255) NULL,
[Mióta betöltetlen a státusz (dátum)] DATETIME NULL,
[Hány napja betöltetlen (munkanap, alapnaptár alapján)] TEXT(255) NULL,
[Státuszbetöltés típusa] TEXT(255) NULL,
[Inaktív állományba kerülés oka] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét számított kezdete] DATETIME NULL,
[Tartós távollét vége] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Elsõdleges] TEXT(255) NULL,
[Státusz vizualizációjában elõször megjelenítendõ] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének kódja] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének neve] TEXT(255) NULL,
[Szervezeti munkakör eltér a szerzõdéses/kinevezéses munkakörtõl] TEXT(255) NULL,
[Betöltõ közvetlen vezetõje] TEXT(255) NULL,
[Betöltõ közvetlen vezetõjének azonosítója] TEXT(255) NULL,
[Szint1 - kód] TEXT(255) NULL,
[Szint1 - leírás] TEXT(255) NULL,
[Szint2 - kód] TEXT(255) NULL,
[Szint2 - leírás] TEXT(255) NULL,
[Szint3 - kód] TEXT(255) NULL,
[Szint3 - leírás] TEXT(255) NULL,
[Szint4 - kód] TEXT(255) NULL,
[Szint4 - leírás] TEXT(255) NULL,
[Szint5 - kód] TEXT(255) NULL,
[Szint5 - leírás] TEXT(255) NULL,
[Szint6 - kód] TEXT(255) NULL,
[Szint6 - leírás] TEXT(255) NULL,
[Szint7 - kód] TEXT(255) NULL,
[Szint7 - leírás] TEXT(255) NULL,
[Szint8 - kód] TEXT(255) NULL,
[Szint8 - leírás] TEXT(255) NULL,
[Szint9 - kód] TEXT(255) NULL,
[Szint9 - leírás] TEXT(255) NULL,
[Szint10 - kód] TEXT(255) NULL,
[Szint10 - leírás] TEXT(255) NULL,
[Szint11 - kód] TEXT(255) NULL,
[Szint11 - leírás] TEXT(255) NULL,
[Szint12 - kód] TEXT(255) NULL,
[Szint12 - leírás] TEXT(255) NULL,
[Szint13 - kód] TEXT(255) NULL,
[Szint13 - leírás] TEXT(255) NULL,
[Szint14 - kód] TEXT(255) NULL,
[Szint14 - leírás] TEXT(255) NULL,
[Szint15 - kód] TEXT(255) NULL,
[Szint15 - leírás] TEXT(255) NULL,
[Asszisztensek száma] DOUBLE NULL,
[Vezetõk száma] DOUBLE NULL,
[HRM-ben lévõ Divízió besorolási adat] TEXT(255) NULL,
[A Divízió érvényességének kezdete] TEXT(255) NULL,
[A Divízió érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szakfeladat besorolási adat] TEXT(255) NULL,
[A Szakfeladat érvényességének kezdete] TEXT(255) NULL,
[A Szakfeladat érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szolgáltatás besorolási adat] TEXT(255) NULL,
[A Szolgáltatás érvényességének kezdete] TEXT(255) NULL,
[A Szolgáltatás érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Forrás besorolási adat] TEXT(255) NULL,
[A Forrás érvényességének kezdete] DATETIME NULL,
[A Forrás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Egység besorolási adat] TEXT(255) NULL,
[Az Egység érvényességének kezdete] DATETIME NULL,
[Az Egység érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Foglalkozási viszony besorolási adat] TEXT(255) NULL,
[A Foglalkozási viszony érvényességének kezdete] DATETIME NULL,
[A Foglalkozási viszony érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Kifizetõhely besorolási adat] TEXT(255) NULL,
[A Kifizetõhely érvényességének kezdete] DATETIME NULL,
[A Kifizetõhely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ költséghely kód besorolási adat] TEXT(255) NULL,
[HRM-ben lévõ költséghely megnevezés besorolási adat] TEXT(255) NULL,
[A Költséghely érvényességének kezdete] DATETIME NULL,
[A Költséghely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ FEOR besorolási adat] TEXT(255) NULL,
[A FEOR érvényességének kezdete] DATETIME NULL,
[A FEOR érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Bérfizetési csoport besorolási adat] TEXT(255) NULL,
[A Bérfizetési csoport érvényességének kezdete] DATETIME NULL,
[A Bérfizetési csoport érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Beosztás besorolási adat] TEXT(255) NULL,
[A Beosztás érvényességének kezdete] DATETIME NULL,
[A Beosztás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Régió besorolási adat] TEXT(255) NULL,
[A Régió érvényességének kezdete] DATETIME NULL,
[A Régió érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Rendfokozat besorolási adat] TEXT(255) NULL,
[A Rendfokozat érvényességének kezdete] DATETIME NULL,
[A Rendfokozat érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkáltatói besorolási kategória besorolási adat] TEXT(255) NULL,
[A Munkáltatói besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Munkáltatói besorolási kategória érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkakör besorolási adat] TEXT(255) NULL,
[A Munkakör érvényességének kezdete] DATETIME NULL,
[A Munkakör érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Besorolási kategória besorolási adat] TEXT(255) NULL,
[A Besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Besorolási kategória érvényességének vége] DATETIME NULL
);

ALTER TABLE [tSzervezeti] ADD CONSTRAINT [PK_tSzervezeti] PRIMARY KEY ([Azonosító],[Szervezetmenedzsment kód],[Szervezeti egység típus],[Szervezeti egység kategória],[Feladatkör],[Státusz típusa],[Státuszának kódja]);

CREATE TABLE [tTesztMunkakörökKörlevélCímzettek01] (
[Azonosító] LONG NULL,
[Fõosztály] TEXT(255) NULL,
[Adójel] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Megszólítás] TEXT(255) NULL,
[Cím] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Útvonal] TEXT(255) NULL,
[BFKHFõosztKód] TEXT(255) NULL
);

ALTER TABLE [tTesztMunkakörökKörlevélCímzettek01] ADD CONSTRAINT [PK_tTesztMunkakörökKörlevélCímzettek01] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tTMPKövetkezõHaviBeutalók] (
[TAJ szám] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Születési hely] TEXT(255) NULL,
[Állandó lakcím] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Munkakör] TEXT(255) NULL,
[MunkakörKód] TEXT(4) NULL,
[EüOsztály] TEXT(255) NULL,
[hó] LONG NULL,
[NexonID] LONG NULL,
[1_1Kézi anyagmozgatás (5kp-20kp)] DOUBLE NULL,
[1_2Kézi anyagmozgatás (20kp-50kp)] DOUBLE NULL,
[1_3Kézi anyagmozgatás (>50kp)] DOUBLE NULL,
[2_Fokozott baleseti veszély] DOUBLE NULL,
[3_Kényszertesthelyzet (görnyedés, guggolás)] DOUBLE NULL,
[4_Ülés] DOUBLE NULL,
[5_Állás] DOUBLE NULL,
[6_Járás] DOUBLE NULL,
[7_Terhelõ munkahelyi klíma (meleg, hideg, nedves, változó)] DOUBLE NULL,
[8_Zaj] DOUBLE NULL,
[9_Ionizáló sugárzás] DOUBLE NULL,
[10_Nem – ionizáló sugárzás] DOUBLE NULL,
[11_Helyileg ható vibráció] DOUBLE NULL,
[12_Egésztest vibráció] DOUBLE NULL,
[13_Ergonómiai tényezõk] DOUBLE NULL,
[14_Porok megnevezése] DOUBLE NULL,
[15_Vegyi anyagok] DOUBLE NULL,
[16_Járványügyi érdekbõl kiemelt munkakör] DOUBLE NULL,
[17_Fertõzésveszély] DOUBLE NULL,
[18_Fokozott pszichés terhelés] DOUBLE NULL,
[19_Képernyõ elõtt végzett munka] DOUBLE NULL,
[20_Éjszakai mûszakban végzett munka] DOUBLE NULL,
[21_Pszichoszociális tényezõk] DOUBLE NULL,
[22_Egyéni védõeszköz általi terhelés] DOUBLE NULL,
[23_Egyéb] DOUBLE NULL
);

CREATE TABLE [tTmpLog] (
[azLog] LONG NULL,
[Bejegyzés] MEMO NULL,
[BejegyzésTárgya] TEXT(255) NULL,
[bejegyzés idõpontja] DATETIME NULL,
[FolyamatHASH] TEXT(255) NULL,
[logszint] BYTE NULL,
[felhasználó] TEXT(255) NULL,
[számítógép] TEXT(255) NULL,
[adatbázis] TEXT(255) NULL
);

