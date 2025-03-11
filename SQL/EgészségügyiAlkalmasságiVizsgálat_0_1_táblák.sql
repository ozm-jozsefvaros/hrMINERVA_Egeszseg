CREATE TABLE [2024_4_n�viElsz�mol�s] (
[TAJ] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[Alk# tipus] TEXT(255) NULL,
[Alk# d�tuma] DATETIME NULL,
[�rv�nyes] DATETIME NULL
);

CREATE TABLE [�ll�shelyek] (
[Azonos�t�] LONG NULL,
[Szervezet] TEXT(255) NULL,
[1 szint] TEXT(255) NULL,
[2 szint] TEXT(255) NULL,
[3 szint] TEXT(255) NULL,
[4 szint] TEXT(255) NULL,
[5 szint] TEXT(255) NULL,
[6 szint] TEXT(255) NULL,
[7 szint] TEXT(255) NULL,
[8 szint] TEXT(255) NULL,
[�ll�shely t�pusa] TEXT(255) NULL,
[�ll�shely alt�pusa] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[�ll�shely besorol�si oszt�lya] TEXT(255) NULL,
[�ll�shely besorol�si kateg�ri�ja] TEXT(255) NULL,
[Hat�lyoss�g kezdete] DATETIME NULL,
[�ll�shely st�tusza] TEXT(255) NULL,
[Z�rol�s v�rhat� d�tuma] DATETIME NULL,
[�ll�shelyen fenn�ll� jogviszony] TEXT(255) NULL,
[�ll�shelykeretbe tartoz� �ll�shely] TEXT(255) NULL,
[�ll�shelyen fenn�ll� jogviszony ideje] DOUBLE NULL,
[�ll�shely hat�ly�nak jellege] TEXT(255) NULL,
[�ll�shely finansz�roz�si forr�sa] TEXT(255) NULL,
[Munkaid� jellege] TEXT(255) NULL,
[R�szmunkaid�s darabsz�m] DOUBLE NULL,
[Hat�lyoss�g v�ge] TEXT(255) NULL,
[Utols� m�dos�t�s d�tuma] DATETIME NULL,
[Migr�ci�s �llom�ny neve] TEXT(255) NULL,
[�llom�ny sora] TEXT(255) NULL,
[Hat�ly] DATETIME NULL
);

ALTER TABLE [�ll�shelyek] ADD CONSTRAINT [PK_�ll�shelyek] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [Beilleszt�si hiba] (
[azMunkak�r] TEXT(255) NULL,
[azKock�zat] TEXT(255) NULL,
[TeljesMunkaid�ben] LONG NULL
);

CREATE TABLE [J�r�si_�llom�ny] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Mez�4] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[J�r�si Hivatal] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�9] TEXT(255) NULL,
[Mez�10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;] TEXT(255) NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Heti munka�r�k sz�ma] DOUBLE NULL,
[Mez�14] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Mez�18] CURRENCY NULL,
[Mez�19] CURRENCY NULL,
[Mez�20] TEXT(255) NULL,
[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs] TEXT(255) NULL,
[Mez�26] TEXT(255) NULL,
[Mez�27] TEXT(255) NULL,
[Mez�28] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Ad�azonos�t�] ON [J�r�si_�llom�ny] ([Ad�azonos�t�]);

CREATE INDEX [Hat�lyaID] ON [J�r�si_�llom�ny] ([Hat�lyaID]);

CREATE TABLE [Kil�p�k] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva] TEXT(255) NULL,
[Jogviszony kezd� d�tuma] DATETIME NULL,
[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja] DATETIME NULL,
[Illetm�ny (Ft/h�)] CURRENCY NULL,
[V�gkiel�g�t�sre jogos�t� h�napok sz�ma] DOUBLE NULL,
[Felment�si id� h�napok sz�ma] TEXT(255) NULL
);

CREATE INDEX [Alapl�tsz�m] ON [Kil�p�k] ([Alapl�tsz�m]);

CREATE INDEX [Sorsz�m] ON [Kil�p�k] ([Sorsz�m]);

CREATE TABLE [Korm�nyhivatali_�llom�ny] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Mez�4] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�9] TEXT(255) NULL,
[Mez�10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;] TEXT(255) NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Heti munka�r�k sz�ma] DOUBLE NULL,
[Mez�14] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Mez�18] CURRENCY NULL,
[Mez�19] CURRENCY NULL,
[Mez�20] TEXT(255) NULL,
[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs] TEXT(255) NULL,
[Mez�26] TEXT(255) NULL,
[Mez�27] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Korm�nyhivatali_�llom�ny] ([Hat�lyaID]);

CREATE TABLE [K�zpontos�tottak] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Mez�4] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] TEXT(255) NULL,
[Mez�10] TEXT(255) NULL,
[Mez�11] DATETIME NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Mez�13] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Mez�17] CURRENCY NULL,
[Mez�18] TEXT(255) NULL,
[Tart�s t�voll�v� nincs helyettese (TT)/ tart�s t�voll�v�nek van ] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Ad�azonos�t�] ON [K�zpontos�tottak] ([Ad�azonos�t�]);

CREATE INDEX [Hat�lyaID] ON [K�zpontos�tottak] ([Hat�lyaID]);

CREATE TABLE [ktMunkak�rKock�zat] (
[azMunkak�r] LONG NOT NULL,
[azKock�zat] LONG NOT NULL,
[TeljesMunkaid�ben] LONG NULL
);

ALTER TABLE [ktMunkak�rKock�zat] ADD CONSTRAINT [PK_ktMunkak�rKock�zat] PRIMARY KEY ([azMunkak�r],[azKock�zat]);

CREATE TABLE [t2024IVn�vbenVizsg�ltak] (
[Ad�jel] DOUBLE NULL,
[orvosi vizsg�lathoz k�t�tt-e] TEXT(255) NULL
);

CREATE TABLE [tBej�v��zenetek] (
[az�zenet] LONG NULL,
[CommonMessageId] TEXT(255) NOT NULL,
[SenderEmailAddress] TEXT(255) NULL,
[DeliveredDate] DATETIME NULL
);

CREATE INDEX [CommonMessageId] ON [tBej�v��zenetek] ([CommonMessageId]);

ALTER TABLE [tBej�v��zenetek] ADD CONSTRAINT [PK_tBej�v��zenetek] PRIMARY KEY ([az�zenet]);

CREATE TABLE [tBesorol�s�talak�t�Elt�r�Besorol�shoz] (
[Azonos�t�] LONG NULL,
[Besorol�si  fokozat (KT)] TEXT(255) NULL,
[�ll�shely besorol�si kateg�ri�ja] TEXT(255) NULL,
[rang] LONG NULL,
[jel] TEXT(255) NULL
);

ALTER TABLE [tBesorol�s�talak�t�Elt�r�Besorol�shoz] ADD CONSTRAINT [PK_tBesorol�s�talak�t�Elt�r�Besorol�shoz] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tBeutal�T�pus] (
[azBeutal�T�pus] LONG NULL,
[Beutal�T�pus] TEXT(255) NULL
);

ALTER TABLE [tBeutal�T�pus] ADD CONSTRAINT [PK_tBeutal�T�pus] PRIMARY KEY ([azBeutal�T�pus]);

CREATE TABLE [tEg�szs�g�gyiVisszajelz�sek] (
[azEg�szs�g�gyiVisszajelz�s] LONG NULL,
[az�zenet] LONG NULL,
[azonos�t�] TEXT(255) NULL,
[�rt�k] TEXT(4) NULL
);

CREATE INDEX [tBej�v��zenetektEg�szs�g�gyiVisszajelz�sek] ON [tEg�szs�g�gyiVisszajelz�sek] ([az�zenet]);

CREATE INDEX [tEg�szs�g�gyiVisszajelz�sekaz�zenet] ON [tEg�szs�g�gyiVisszajelz�sek] ([az�zenet]);

ALTER TABLE [tEg�szs�g�gyiVisszajelz�sek] ADD CONSTRAINT [PK_tEg�szs�g�gyiVisszajelz�sek] PRIMARY KEY ([azEg�szs�g�gyiVisszajelz�s]);

CREATE TABLE [tEgyesMunkak�r�kF�oszt�lyai] (
[Azonos�t�] LONG NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL
);

ALTER TABLE [tEgyesMunkak�r�kF�oszt�lyai] ADD CONSTRAINT [PK_tEgyesMunkak�r�kF�oszt�lyai] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tElk�sz�ltBeutal�k] (
[azBeutal�] LONG NULL,
[NexonID] LONG NULL,
[Id�pont] DATETIME NULL,
[azBeutal�T�pus] LONG NULL,
[Munkak�rK�D] TEXT(3) NULL
);

CREATE INDEX [azBeutal�T�pus] ON [tElk�sz�ltBeutal�k] ([azBeutal�T�pus]);

CREATE INDEX [Munkak�rK�D] ON [tElk�sz�ltBeutal�k] ([Munkak�rK�D]);

CREATE INDEX [NexonID] ON [tElk�sz�ltBeutal�k] ([NexonID]);

CREATE INDEX [tBeutal�T�pustElk�sz�ltBeutal�k] ON [tElk�sz�ltBeutal�k] ([azBeutal�T�pus]);

CREATE INDEX [tMunkak�r�ktElk�sz�ltBeutal�k] ON [tElk�sz�ltBeutal�k] ([Munkak�rK�D]);

ALTER TABLE [tElk�sz�ltBeutal�k] ADD CONSTRAINT [PK_tElk�sz�ltBeutal�k] PRIMARY KEY ([azBeutal�]);

CREATE TABLE [tElk�ld�ttBeutal�k] (
[azElk�ld�ttBeutal�] LONG NULL,
[NexonID] LONG NULL,
[D�tum] DATETIME NULL,
[DeliveredDate] DATETIME NULL,
[ClientMessageId] TEXT(255) NULL
);

CREATE INDEX [ClientMessageId] ON [tElk�ld�ttBeutal�k] ([ClientMessageId]);

CREATE INDEX [NexonID] ON [tElk�ld�ttBeutal�k] ([NexonID]);

ALTER TABLE [tElk�ld�ttBeutal�k] ADD CONSTRAINT [PK_tElk�ld�ttBeutal�k] PRIMARY KEY ([azElk�ld�ttBeutal�]);

CREATE TABLE [tE��r] (
[azE��r] LONG NULL,
[E��r] CURRENCY NULL,
[Hat�ly] DATETIME NULL,
[azE�Oszt�ly] LONG NULL
);

CREATE INDEX [tE�Oszt�lyoktE��r] ON [tE��r] ([azE�Oszt�ly]);

ALTER TABLE [tE��r] ADD CONSTRAINT [PK_tE��r] PRIMARY KEY ([azE��r]);

CREATE TABLE [tE�Oszt�lyok] (
[azE�Oszt�ly] LONG NULL,
[E�Oszt�ly] TEXT(255) NULL
);

ALTER TABLE [tE�Oszt�lyok] ADD CONSTRAINT [PK_tE�Oszt�lyok] PRIMARY KEY ([azE�Oszt�ly]);

CREATE TABLE [tKieg�sz�t�EmailC�mek] (
[azKiegEmail] LONG NULL,
[Email] TEXT(255) NULL,
[F�oszt�lyK�d] TEXT(255) NULL
);

ALTER TABLE [tKieg�sz�t�EmailC�mek] ADD CONSTRAINT [PK_tKieg�sz�t�EmailC�mek] PRIMARY KEY ([azKiegEmail]);

CREATE TABLE [tKil�p�kUni�] (
[Ad�jel] DOUBLE NULL,
[azKil�p�k] LONG NULL,
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva] TEXT(255) NULL,
[Jogviszony kezd� d�tuma] DATETIME NULL,
[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja] DATETIME NULL,
[Illetm�ny (Ft/h�)] CURRENCY NULL,
[V�gkiel�g�t�sre jogos�t� h�napok sz�ma] DOUBLE NULL,
[Felment�si id� h�napok sz�ma] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[BFKH] TEXT(255) NULL,
[Kil�p�s] DATETIME NULL,
[�v] DATETIME NULL
);

CREATE TABLE [tKock�zatok] (
[azKock�zat] LONG NULL,
[Kock�zatiK�d] TEXT(4) NULL,
[Kock�zat] TEXT(255) NULL
);

CREATE INDEX [Kock�zatiK�d] ON [tKock�zatok] ([Kock�zatiK�d]);

ALTER TABLE [tKock�zatok] ADD CONSTRAINT [PK_tKock�zatok] PRIMARY KEY ([azKock�zat]);

CREATE TABLE [tMunkak�rElk�ld�ttLevelek] (
[azLev�l] LONG NULL,
[ClientMessageId] TEXT(255) NULL,
[deliveredDate] DATETIME NULL,
[Ad�jel] DOUBLE NULL,
[BFKHK�d] TEXT(255) NULL,
[username] TEXT(255) NULL
);

CREATE INDEX [tMunkak�rElk�ld�ttLevelekAd�jel] ON [tMunkak�rElk�ld�ttLevelek] ([Ad�jel]);

ALTER TABLE [tMunkak�rElk�ld�ttLevelek] ADD CONSTRAINT [PK_tMunkak�rElk�ld�ttLevelek] PRIMARY KEY ([azLev�l]);

CREATE TABLE [tMunkak�rK�rlev�lMell�klet�tvonalak] (
[azMell�klet] LONG NULL,
[F�oszt�lyNeve] TEXT(255) NULL,
[�tvonal] TEXT(255) NULL,
[K�sz�lt] DATETIME NULL
);

ALTER TABLE [tMunkak�rK�rlev�lMell�klet�tvonalak] ADD CONSTRAINT [PK_tMunkak�rK�rlev�lMell�klet�tvonalak] PRIMARY KEY ([azMell�klet]);

CREATE TABLE [tMunkak�r�k] (
[azMunkak�r] LONG NULL,
[Munkak�rK�d] TEXT(4) NULL,
[Munkak�r] TEXT(255) NULL,
[azE�Oszt�ly] LONG NULL
);

CREATE INDEX [k�rk�d] ON [tMunkak�r�k] ([Munkak�rK�d]);

CREATE INDEX [tE�Oszt�lyoktMunkak�r�k] ON [tMunkak�r�k] ([azE�Oszt�ly]);

ALTER TABLE [tMunkak�r�k] ADD CONSTRAINT [PK_tMunkak�r�k] PRIMARY KEY ([azMunkak�r]);

CREATE TABLE [tMunkak�r�kMell�kletbeKer�ltek] (
[Az] LONG NULL,
[azMell�klet] LONG NULL,
[Id�pont] DATETIME NULL,
[ID] TEXT(255) NULL
);

CREATE INDEX [tMunkak�rK�rlev�lMell�klet�tvtMunkak�r�kMell�kletbeKer�ltek] ON [tMunkak�r�kMell�kletbeKer�ltek] ([azMell�klet]);

ALTER TABLE [tMunkak�r�kMell�kletbeKer�ltek] ADD CONSTRAINT [PK_tMunkak�r�kMell�kletbeKer�ltek] PRIMARY KEY ([Az]);

CREATE TABLE [tNexonAzonos�t�k] (
[Azonos�t�] LONG NULL,
[Szem�ly azonos�t�] DOUBLE NOT NULL,
[HR kapcsolat azonos�t�] DOUBLE NOT NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[Egyedi azonos�t�] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Jogviszony t�pus] TEXT(255) NULL,
[Kezdete] TEXT(255) NULL,
[V�ge] TEXT(255) NULL,
[Szervezeti egys�g] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Munkak�r] TEXT(255) NULL,
[St�tusz] TEXT(255) NULL,
[T�rt�netiSorsz�m] LONG NULL
);

CREATE INDEX [Ad�azonos�t� jel] ON [tNexonAzonos�t�k] ([Ad�azonos�t� jel]);

CREATE INDEX [HR kapcsolat azonos�t�] ON [tNexonAzonos�t�k] ([HR kapcsolat azonos�t�]);

CREATE INDEX [Szem�ly azonos�t�] ON [tNexonAzonos�t�k] ([Szem�ly azonos�t�]);

CREATE INDEX [Szem�lyKapcsolat] ON [tNexonAzonos�t�k] ([Szem�ly azonos�t�],[HR kapcsolat azonos�t�]);

CREATE INDEX [tNexonAzonos�t�kazonos�t�] ON [tNexonAzonos�t�k] ([Azonos�t�]);

ALTER TABLE [tNexonAzonos�t�k] ADD CONSTRAINT [PK_tNexonAzonos�t�k] PRIMARY KEY ([HR kapcsolat azonos�t�]);

CREATE TABLE [tOrvosiAlkalmass�giD�jt�telek] (
[azOrvosiD�jt�tel] LONG NULL,
[Alkalmass�giOszt�ly] TEXT(255) NULL,
[Alk# tipus] TEXT(255) NULL,
[D�jt�tel] CURRENCY NULL
);

ALTER TABLE [tOrvosiAlkalmass�giD�jt�telek] ADD CONSTRAINT [PK_tOrvosiAlkalmass�giD�jt�telek] PRIMARY KEY ([azOrvosiD�jt�tel]);

CREATE TABLE [tSzem�lyek] (
[Azonos�t�] LONG NULL,
[Ad�jel] DOUBLE NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Dolgoz� sz�let�si neve] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Egyedi azonos�t�] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[�gyf�lkapu k�d] TEXT(255) NULL,
[Els�dleges �llampolg�rs�g] TEXT(255) NULL,
[Szem�lyi igazolv�ny sz�ma] TEXT(255) NULL,
[Szem�lyi igazolv�ny �rv�nyess�g kezdete] DATETIME NULL,
[Szem�lyi igazolv�ny �rv�nyess�g v�ge] DATETIME NULL,
[Nyelvtud�s Angol] TEXT(255) NULL,
[Nyelvtud�s Arab] TEXT(255) NULL,
[Nyelvtud�s Bolg�r] TEXT(255) NULL,
[Nyelvtud�s Cig�ny] TEXT(255) NULL,
[Nyelvtud�s Cig�ny (lov�ri)] TEXT(255) NULL,
[Nyelvtud�s Cseh] TEXT(255) NULL,
[Nyelvtud�s Eszperant�] TEXT(255) NULL,
[Nyelvtud�s Finn] TEXT(255) NULL,
[Nyelvtud�s Francia] TEXT(255) NULL,
[Nyelvtud�s H�ber] TEXT(255) NULL,
[Nyelvtud�s Holland] TEXT(255) NULL,
[Nyelvtud�s Horv�t] TEXT(255) NULL,
[Nyelvtud�s Jap�n] TEXT(255) NULL,
[Nyelvtud�s Jelnyelv] TEXT(255) NULL,
[Nyelvtud�s K�nai] TEXT(255) NULL,
[Nyelvtud�s Koreai] TEXT(255) NULL,
[Nyelvtud�s Latin] TEXT(255) NULL,
[Nyelvtud�s Lengyel] TEXT(255) NULL,
[Nyelvtud�s N�met] TEXT(255) NULL,
[Nyelvtud�s Norv�g] TEXT(255) NULL,
[Nyelvtud�s Olasz] TEXT(255) NULL,
[Nyelvtud�s Orosz] TEXT(255) NULL,
[Nyelvtud�s Portug�l] TEXT(255) NULL,
[Nyelvtud�s Rom�n] TEXT(255) NULL,
[Nyelvtud�s Spanyol] TEXT(255) NULL,
[Nyelvtud�s Szerb] TEXT(255) NULL,
[Nyelvtud�s Szlov�k] TEXT(255) NULL,
[Nyelvtud�s Szlov�n] TEXT(255) NULL,
[Nyelvtud�s T�r�k] TEXT(255) NULL,
[Nyelvtud�s �jg�r�g] TEXT(255) NULL,
[Nyelvtud�s Ukr�n] TEXT(255) NULL,
[Orvosi vizsg�lat id�pontja] DATETIME NULL,
[Orvosi vizsg�lat t�pusa] TEXT(255) NULL,
[Orvosi vizsg�lat eredm�nye] TEXT(255) NULL,
[Orvosi vizsg�lat �szrev�telek] TEXT(255) NULL,
[Orvosi vizsg�lat k�vetkez� id�pontja] DATETIME NULL,
[Erk�lcsi bizony�tv�ny sz�ma] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny d�tuma] DATETIME NULL,
[Erk�lcsi bizony�tv�ny eredm�nye] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�relem azonos�t�] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�z�gyekt�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny j�rm�vezet�st�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny int�zked�s alatt �ll] TEXT(255) NULL,
[Munkak�ri le�r�sok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Egy�b HR dokumentumok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Korm�nyhivatal r�vid neve] TEXT(255) NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL,
[Szervezeti egys�g neve] TEXT(255) NULL,
[Szervezeti munkak�r neve] TEXT(255) NULL,
[Vezet�i megb�z�s t�pusa] TEXT(255) NULL,
[St�tusz k�dja] TEXT(255) NULL,
[St�tusz k�lts�ghely�nek k�dja] TEXT(255) NULL,
[St�tusz k�lts�ghely�nek neve ] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] YESNO NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz neve] TEXT(255) NULL,
[T�bbes bet�lt�s] YESNO NULL,
[Vezet� neve] TEXT(255) NULL,
[Vezet� ad�azonos�t� jele] TEXT(255) NULL,
[Vezet� email c�me] TEXT(255) NULL,
[�lland� lakc�m] TEXT(255) NULL,
[Tart�zkod�si lakc�m] TEXT(255) NULL,
[Levelez�si c�m_] TEXT(255) NULL,
[�regs�gi nyugd�j-korhat�r el�r�s�nek id�pontja (d�tum)] DATETIME NULL,
[Nyugd�jas] YESNO NULL,
[Nyugd�j t�pusa] TEXT(255) NULL,
[Nyugd�jas kor� tov�bbfoglalkoztat�si enged�llyel rendelkezik] TEXT(255) NULL,
[Megv�ltozott munkak�pess�g] YESNO NULL,
[�nk�ntes tartal�kos katona] YESNO NULL,
[Utols� vagyonnyilatkozat lead�s�nak d�tuma] DATETIME NULL,
[Vagyonnyilatkozat nyilv�ntart�si sz�ma] TEXT(255) NULL,
[K�vetkez� vagyonnyilatkozat esed�kess�ge] DATETIME NULL,
[Nemzetbiztons�gi ellen�rz�s d�tuma] TEXT(255) NULL,
[V�dett �llom�nyba tartoz� munkak�r] YESNO NULL,
[Vezet�i megb�z�s t�pusa1] TEXT(255) NULL,
[Vezet�i beoszt�s megnevez�se] TEXT(255) NULL,
[Vezet�i beoszt�s (megb�z�s) kezdete] DATETIME NULL,
[Vezet�i beoszt�s (megb�z�s) v�ge] TEXT(255) NULL,
[Iskolai v�gzetts�g foka] TEXT(255) NULL,
[Iskolai v�gzetts�g neve] TEXT(255) NULL,
[Alapvizsga k�telez�s d�tuma] DATETIME NULL,
[Alapvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Alapvizsga mentess�g] YESNO NULL,
[Alapvizsga mentess�g oka] TEXT(255) NULL,
[Szakvizsga k�telez�s d�tuma] TEXT(255) NULL,
[Szakvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Szakvizsga mentess�g] YESNO NULL,
[Foglalkoz�si viszony] TEXT(255) NULL,
[Foglalkoz�si viszony statisztikai besorol�sa] TEXT(255) NULL,
[Dolgoz� szerz�d�ses/kinevez�ses munkak�re / kinevez�si okm�nyban] TEXT(255) NULL,
[Beoszt�stervez�s helysz�nek] TEXT(255) NULL,
[Beoszt�stervez�s tev�kenys�gek] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s kezdete] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s v�ge] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s intervalluma] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s m�rt�ke] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne 2] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne 3] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s kezdete] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s v�ge] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s m�rt�ke] TEXT(255) NULL,
[KIRA feladat azonos�t�ja - int�zm�ny prefix-szel ell�tva] TEXT(255) NULL,
[KIRA feladat azonos�t�ja] TEXT(255) NULL,
[KIRA feladat megnevez�s] TEXT(255) NULL,
[Osztott munkak�r] TEXT(255) NULL,
[Funkci�csoport: k�d-megnevez�s] TEXT(255) NULL,
[Funkci�: k�d-megnevez�s] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek k�dja] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek neve] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Els�dleges feladatk�r] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� napi �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� havi �raker] DOUBLE NULL,
[Szerz�d�s/Kinevez�s t�pusa] TEXT(255) NULL,
[Iktat�sz�m] TEXT(255) NULL,
[Szerz�d�s/kinevez�s verzi�_�rv�nyess�g kezdete] DATETIME NULL,
[Szerz�d�s/kinevez�s verzi�_�rv�nyess�g v�ge] DATETIME NULL,
[Hat�rozott idej� _szerz�d�s/kinevez�s lej�r] DATETIME NULL,
[Szerz�d�s dokumentum (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Megjegyz�s (pl# hat�rozott szerz�d�s/kinevez�s oka)] TEXT(255) NULL,
[Munkav�gz�s helye - megnevez�s] TEXT(255) NULL,
[Munkav�gz�s helye - c�m] TEXT(255) NULL,
[Jogviszony t�pusa / jogviszony t�pus] TEXT(255) NULL,
[Jogviszony sorsz�ma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[K�lcs�nbe ad� c�g] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kel� szem�ly] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rv�nyess�g kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak v�ge] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s d�tuma] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Be�ll�si sz�zal�k] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Pontsz�m] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Megjegyz�s] TEXT(255) NULL,
[Dolgoz�i jellemz�k] TEXT(255) NULL,
[Fizet�si oszt�ly (KA)/ Pedag�gusi fokozat (KA pedag�gus)/besorol] TEXT(255) NULL,
[Besorol�si  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos id� kezdete] TEXT(255) NULL,
[Jogviszony kezdete (bel�p�s d�tuma)] DATETIME NULL,
[Jogviszony v�ge (kil�p�s d�tuma)] DATETIME NULL,
[Utols� munk�ban t�lt�tt nap] TEXT(255) NULL,
[Kezdem�nyez�s d�tuma] TEXT(255) NULL,
[Hat�lyoss� v�lik] TEXT(255) NULL,
[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)] TEXT(255) NULL,
[HR kapcsolat megsz�nes indoka (Kil�p�s indoka)] TEXT(255) NULL,
[Indokol�s] TEXT(255) NULL,
[K�vetkez� munkahely] TEXT(255) NULL,
[MT: Felmond�si id� kezdete KJT, KTTV: Felment�si id� kezdete] TEXT(255) NULL,
[Felmond�si id� v�ge (MT) Felment�si id� v�ge (KJT, KTTV)] TEXT(255) NULL,
[Munkav�gz�s al�li mentes�t�s kezdete (KJT, KTTV) Felment�si id� ] TEXT(255) NULL,
[Munkav�gz�s al�li mentes�t�s v�ge (KJT, KTTV) Felment�si id� v�g] TEXT(255) NULL,
[�tmeneti elt�r� foglalkoztat�s t�pusa] TEXT(255) NULL,
[�tmeneti elt�r� foglalkoztat�s kezdete] TEXT(255) NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] TEXT(255) NULL,
[Tart�s t�voll�t v�ge] TEXT(255) NULL,
[Tart�s t�voll�t tervezett v�ge] TEXT(255) NULL,
[Helyettes�tett dolgoz� neve] TEXT(255) NULL,
[Szerz�d�s/Kinevez�s - pr�baid� v�ge] DATETIME NULL,
[Utal�si c�m] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Garant�lt b�rminimumra t�rt�n� kieg�sz�t�s] TEXT(255) NULL,
[Kerek�t�s] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S % (elt�r�t] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S �sszeg (el] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY % (elt�r�t�s n�lk�li)] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY �sszeg (elt�r�t�s n�l] TEXT(255) NULL,
[Egy�b p�tl�k - �sszeg (elt�r�t�s n�lk�li)] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Elt�r�t�s %] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�tett)] DOUBLE NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S % (elt�r�1] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S �sszeg (e1] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY % (elt�r�tett)] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY �sszeg (elt�r�tett)] TEXT(255) NULL,
[Egy�b p�tl�k - �sszeg (elt�r�tett)] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�tett)] DOUBLE NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�tett)] DOUBLE NULL,
[Tov�bbi munkav�gz�s helye 1 Teljes munkaid� %-a] TEXT(255) NULL,
[Tov�bbi munkav�gz�s helye 2 Teljes munkaid� %-a] TEXT(255) NULL,
[KT: Kerek�tett 100 %-os illetm�ny (elt�r�tett) + Helyettes�t�si ] DOUBLE NULL,
[Szint 1 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 1 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 2 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 2 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 3 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 3 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 4 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 4 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 5 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 5 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 6 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 6 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 7 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 7 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 8 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 8 szervezeti egys�g k�d] TEXT(255) NULL,
[AD egyedi azonos�t�] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mell�k] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[Tov�bbi otthoni mobil] TEXT(255) NULL
);

CREATE INDEX [Ad�jel] ON [tSzem�lyek] ([Ad�jel]);

CREATE INDEX [Bel�p�s] ON [tSzem�lyek] ([Jogviszony kezdete (bel�p�s d�tuma)]);

CREATE INDEX [Dolgoz� teljes neve] ON [tSzem�lyek] ([Dolgoz� teljes neve]);

CREATE INDEX [Kil�p�s] ON [tSzem�lyek] ([Jogviszony v�ge (kil�p�s d�tuma)]);

CREATE INDEX [St�tusz k�dja] ON [tSzem�lyek] ([St�tusz k�dja]);

CREATE INDEX [Szervezeti egys�g k�dja] ON [tSzem�lyek] ([Szervezeti egys�g k�dja]);

CREATE INDEX [tSzem�lyekAd�azonos�t� jel] ON [tSzem�lyek] ([Ad�azonos�t� jel]);

ALTER TABLE [tSzem�lyek] ADD CONSTRAINT [PK_tSzem�lyek] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tSzervezeti] (
[Azonos�t�] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment k�d] TEXT(255) NULL,
[HR kapcsolat sorsz�ma] DOUBLE NULL,
[Megnevez�s sz�t�relem k�dja] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[R�vid n�v] TEXT(255) NULL,
[�rv�nyess�g kezdete] DATETIME NULL,
[�rv�nyess�g v�ge] DATETIME NULL,
[Ad�sz�m] TEXT(255) NULL,
[KSH sz�m] TEXT(255) NULL,
[OEP nyilv�ntart�si sz�m] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Sz�khely c�m] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egys�gek sz�ma (db)] TEXT(255) NULL,
[Bet�lt�tt st�tuszok sz�ma (db)] DOUBLE NULL,
[Bet�ltetlen st�tuszok sz�ma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egys�g vezet�je] TEXT(255) NULL,
[Szervezeti egys�g vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Korm�nyhivatal neve] TEXT(255) NULL,
[K�lts�ghely k�d] TEXT(255) NULL,
[K�lts�ghely megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g t�pus] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Enged�lyezett vezet�i l�tsz�m] TEXT(255) NULL,
[B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[B�r F6 besorol�si szint megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g�nek szintje] DOUBLE NULL,
[Munk�ltat�i jogk�rt gyakorl�] TEXT(255) NULL,
[Sz�l� szervezeti egys�g�nek k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek megnevez�se] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�je] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti egys�g�nek k�lts�ghelyt�l?] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek megnevez�se] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti munkak�r�nek k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tuszbet�lt�ssel rendelkezik a kil�p�st k�vet�en?] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[A B�r F6 besorol�si szint elt�r a szervezeti munkak�r�nek B�r F6] TEXT(255) NULL,
[Vezet�i st�tusz] TEXT(255) NULL,
[K�pz�si k�lts�gkeret] TEXT(255) NULL,
[Helyettes vezet�-e] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Jogviszony t�pus] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m megnevez�s] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] TEXT(255) NULL,
[P�ly�ztat�s hat�rideje] TEXT(255) NULL,
[Vezet�i beoszt�s KA] TEXT(255) NULL,
[Vezet�i beoszt�s KT] TEXT(255) NULL,
[P�ly�ztat�s alatt �ll] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL,
[St�tusz z�rol�s oka] TEXT(255) NULL,
[St�tusz z�rol�s kezdete] DATETIME NULL,
[St�tusz z�rol�s v�ge] DATETIME NULL,
[St�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz enged�lyezett FTE (�zleti param�ter szerint sz�molva)] DOUBLE NULL,
[�tmeneti �rasz�m] DOUBLE NULL,
[�tmeneti l�tsz�m (FTE)] DOUBLE NULL,
[K�zz�tett hierarchi�ban megjelen�tend�] TEXT(255) NULL,
[Asszisztens st�tusz] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] TEXT(255) NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz bet�lt�si �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE] DOUBLE NULL,
[Helyettes�t�s m�rt�ke (%)] DOUBLE NULL,
[Helyettes�t�si d�j (%)] DOUBLE NULL,
[St�tusz bet�lt�si �rasz�ma minusz st�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE minusz st�tusz enged�lyezett FTE] DOUBLE NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[St�tusz�nak neve] TEXT(255) NULL,
[St�tusz�nak az enged�lyezett �rasz�ma] DOUBLE NULL,
[Mez�82] DOUBLE NULL,
[Aktu�lis bet�lt�s �rasz�ma] DOUBLE NULL,
[Aktu�lis bet�lt�s FTE] DOUBLE NULL,
[St�tusz�nak k�lts�ghely k�dja] TEXT(255) NULL,
[St�tusz�nak k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a st�tusz�nak k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[Mez�90] TEXT(255) NULL,
[Mi�ta bet�ltetlen a st�tusz (d�tum)] DATETIME NULL,
[H�ny napja bet�ltetlen (munkanap, alapnapt�r alapj�n)] TEXT(255) NULL,
[St�tuszbet�lt�s t�pusa] TEXT(255) NULL,
[Inakt�v �llom�nyba ker�l�s oka] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t sz�m�tott kezdete] DATETIME NULL,
[Tart�s t�voll�t v�ge] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Els�dleges] TEXT(255) NULL,
[St�tusz vizualiz�ci�j�ban el�sz�r megjelen�tend�] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek k�dja] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek neve] TEXT(255) NULL,
[Szervezeti munkak�r elt�r a szerz�d�ses/kinevez�ses munkak�rt�l] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�je] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szint1 - k�d] TEXT(255) NULL,
[Szint1 - le�r�s] TEXT(255) NULL,
[Szint2 - k�d] TEXT(255) NULL,
[Szint2 - le�r�s] TEXT(255) NULL,
[Szint3 - k�d] TEXT(255) NULL,
[Szint3 - le�r�s] TEXT(255) NULL,
[Szint4 - k�d] TEXT(255) NULL,
[Szint4 - le�r�s] TEXT(255) NULL,
[Szint5 - k�d] TEXT(255) NULL,
[Szint5 - le�r�s] TEXT(255) NULL,
[Szint6 - k�d] TEXT(255) NULL,
[Szint6 - le�r�s] TEXT(255) NULL,
[Szint7 - k�d] TEXT(255) NULL,
[Szint7 - le�r�s] TEXT(255) NULL,
[Szint8 - k�d] TEXT(255) NULL,
[Szint8 - le�r�s] TEXT(255) NULL,
[Szint9 - k�d] TEXT(255) NULL,
[Szint9 - le�r�s] TEXT(255) NULL,
[Szint10 - k�d] TEXT(255) NULL,
[Szint10 - le�r�s] TEXT(255) NULL,
[Szint11 - k�d] TEXT(255) NULL,
[Szint11 - le�r�s] TEXT(255) NULL,
[Szint12 - k�d] TEXT(255) NULL,
[Szint12 - le�r�s] TEXT(255) NULL,
[Szint13 - k�d] TEXT(255) NULL,
[Szint13 - le�r�s] TEXT(255) NULL,
[Szint14 - k�d] TEXT(255) NULL,
[Szint14 - le�r�s] TEXT(255) NULL,
[Szint15 - k�d] TEXT(255) NULL,
[Szint15 - le�r�s] TEXT(255) NULL,
[Asszisztensek sz�ma] DOUBLE NULL,
[Vezet�k sz�ma] DOUBLE NULL,
[HRM-ben l�v� Div�zi� besorol�si adat] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szakfeladat besorol�si adat] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szolg�ltat�s besorol�si adat] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Forr�s besorol�si adat] TEXT(255) NULL,
[A Forr�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Forr�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Egys�g besorol�si adat] TEXT(255) NULL,
[Az Egys�g �rv�nyess�g�nek kezdete] DATETIME NULL,
[Az Egys�g �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Foglalkoz�si viszony besorol�si adat] TEXT(255) NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Kifizet�hely besorol�si adat] TEXT(255) NULL,
[A Kifizet�hely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Kifizet�hely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� k�lts�ghely k�d besorol�si adat] TEXT(255) NULL,
[HRM-ben l�v� k�lts�ghely megnevez�s besorol�si adat] TEXT(255) NULL,
[A K�lts�ghely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A K�lts�ghely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� FEOR besorol�si adat] TEXT(255) NULL,
[A FEOR �rv�nyess�g�nek kezdete] DATETIME NULL,
[A FEOR �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� B�rfizet�si csoport besorol�si adat] TEXT(255) NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek kezdete] DATETIME NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Beoszt�s besorol�si adat] TEXT(255) NULL,
[A Beoszt�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Beoszt�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� R�gi� besorol�si adat] TEXT(255) NULL,
[A R�gi� �rv�nyess�g�nek kezdete] DATETIME NULL,
[A R�gi� �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Rendfokozat besorol�si adat] TEXT(255) NULL,
[A Rendfokozat �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Rendfokozat �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munk�ltat�i besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munkak�r besorol�si adat] TEXT(255) NULL,
[A Munkak�r �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munkak�r �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL
);

ALTER TABLE [tSzervezeti] ADD CONSTRAINT [PK_tSzervezeti] PRIMARY KEY ([Azonos�t�],[Szervezetmenedzsment k�d],[Szervezeti egys�g t�pus],[Szervezeti egys�g kateg�ria],[Feladatk�r],[St�tusz t�pusa],[St�tusz�nak k�dja]);

CREATE TABLE [tTesztMunkak�r�kK�rlev�lC�mzettek01] (
[Azonos�t�] LONG NULL,
[F�oszt�ly] TEXT(255) NULL,
[Ad�jel] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Megsz�l�t�s] TEXT(255) NULL,
[C�m] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[�tvonal] TEXT(255) NULL,
[BFKHF�osztK�d] TEXT(255) NULL
);

ALTER TABLE [tTesztMunkak�r�kK�rlev�lC�mzettek01] ADD CONSTRAINT [PK_tTesztMunkak�r�kK�rlev�lC�mzettek01] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tTMPK�vetkez�HaviBeutal�k] (
[TAJ sz�m] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Sz�let�si hely] TEXT(255) NULL,
[�lland� lakc�m] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Munkak�r] TEXT(255) NULL,
[Munkak�rK�d] TEXT(4) NULL,
[E�Oszt�ly] TEXT(255) NULL,
[h�] LONG NULL,
[NexonID] LONG NULL,
[1_1K�zi anyagmozgat�s (5kp-20kp)] DOUBLE NULL,
[1_2K�zi anyagmozgat�s (20kp-50kp)] DOUBLE NULL,
[1_3K�zi anyagmozgat�s (>50kp)] DOUBLE NULL,
[2_Fokozott baleseti vesz�ly] DOUBLE NULL,
[3_K�nyszertesthelyzet (g�rnyed�s, guggol�s)] DOUBLE NULL,
[4_�l�s] DOUBLE NULL,
[5_�ll�s] DOUBLE NULL,
[6_J�r�s] DOUBLE NULL,
[7_Terhel� munkahelyi kl�ma (meleg, hideg, nedves, v�ltoz�)] DOUBLE NULL,
[8_Zaj] DOUBLE NULL,
[9_Ioniz�l� sug�rz�s] DOUBLE NULL,
[10_Nem � ioniz�l� sug�rz�s] DOUBLE NULL,
[11_Helyileg hat� vibr�ci�] DOUBLE NULL,
[12_Eg�sztest vibr�ci�] DOUBLE NULL,
[13_Ergon�miai t�nyez�k] DOUBLE NULL,
[14_Porok megnevez�se] DOUBLE NULL,
[15_Vegyi anyagok] DOUBLE NULL,
[16_J�rv�ny�gyi �rdekb�l kiemelt munkak�r] DOUBLE NULL,
[17_Fert�z�svesz�ly] DOUBLE NULL,
[18_Fokozott pszich�s terhel�s] DOUBLE NULL,
[19_K�perny� el�tt v�gzett munka] DOUBLE NULL,
[20_�jszakai m�szakban v�gzett munka] DOUBLE NULL,
[21_Pszichoszoci�lis t�nyez�k] DOUBLE NULL,
[22_Egy�ni v�d�eszk�z �ltali terhel�s] DOUBLE NULL,
[23_Egy�b] DOUBLE NULL
);

CREATE TABLE [tTmpLog] (
[azLog] LONG NULL,
[Bejegyz�s] MEMO NULL,
[Bejegyz�sT�rgya] TEXT(255) NULL,
[bejegyz�s id�pontja] DATETIME NULL,
[FolyamatHASH] TEXT(255) NULL,
[logszint] BYTE NULL,
[felhaszn�l�] TEXT(255) NULL,
[sz�m�t�g�p] TEXT(255) NULL,
[adatb�zis] TEXT(255) NULL
);

