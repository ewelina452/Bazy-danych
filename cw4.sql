--1. Utworzenie bazy danych o nazwie firma

--CREATE DATABASE firma;
USE firma;
 

--2. Utworzenie schematu

--IF NOT EXISTS (select * from sys.schemas s with (nolock) where s.name = 'rozliczenia')

--BEGIN

--EXEC ('CREATE SCHEMA rozliczenia')

--END

--GO
CREATE SCHEMA rozliczenia;

--3. Dodanie tabel
CREATE TABLE rozliczenia.pracownicy(ID_pracownika INTEGER PRIMARY KEY NOT NULL, imiê VARCHAR(20) NOT NULL, nazwisko VARCHAR(20) NOT NULL,adres VARCHAR(50) NOT NULL,telefon VARCHAR(20) NOT NULL);  
CREATE TABLE rozliczenia.godziny (ID_godziny INTEGER PRIMARY KEY, data DATE, liczba_godzin INTEGER NOT NULL, ID_pracownika INTEGER NOT NULL); 
CREATE TABLE rozliczenia.pensje (ID_pensji INTEGER PRIMARY KEY, stanowisko VARCHAR(20), kwota INTEGER NOT NULL, ID_premii INTEGER);
CREATE TABLE rozliczenia.premie (ID_premii INTEGER PRIMARY KEY, rodzaj VARCHAR(20), kwota MONEY);


ALTER TABLE rozliczenia.godziny ADD FOREIGN KEY (ID_pracownika) REFERENCES rozliczenia.pracownicy (ID_pracownika);
ALTER TABLE rozliczenia.pensje ADD FOREIGN KEY (ID_premii) REFERENCES rozliczenia.premie (ID_premii); 

--4. Wype³nienie tabeli rekordami
INSERT INTO rozliczenia.pracownicy VALUES (1,'Anna','Nowak', 'Kraków', 567989654);
INSERT INTO rozliczenia.pracownicy VALUES (2,'Krzysztof','Kowalski', 'Warszawa' , 534213567);
INSERT INTO rozliczenia.pracownicy VALUES(3,'Natalia','Sokó³','Gdañsk',789543234);
INSERT INTO rozliczenia.pracownicy VALUES(4,'Agnieszka', 'Sowa','Zakopane',789654235);
INSERT INTO rozliczenia.pracownicy VALUES(5,'Rafa³','Adamczyk','Wieliczka',567890432);
INSERT INTO rozliczenia.pracownicy VALUES(6,'Piotr','Kula','Bochnia',765348765);
INSERT INTO rozliczenia.pracownicy VALUES(7,'Magdalena','Krawczyk','Gdynia',765234678);
INSERT INTO rozliczenia.pracownicy VALUES(8,'Weronika','Zieliñska','Andrychów',654234154);
INSERT INTO rozliczenia.pracownicy VALUES(9,'Beata','Drabek','Lublin',768983236);
INSERT INTO rozliczenia.pracownicy VALUES(10,'Józef','Kowalczyk','Opole',765287598);


INSERT INTO rozliczenia.godziny VALUES(1,'2021-02-01',6,2);
INSERT INTO rozliczenia.godziny VAlUES(2,'2021-02-03',5,1);
INSERT INTO rozliczenia.godziny VALUES(3,'2021-02-07',4,5);
INSERT INTO rozliczenia.godziny VALUES(4,'2021-02-10',7,7);
INSERT INTO rozliczenia.godziny VALUES(5,'2021-02-15',9,3);
INSERT INTO rozliczenia.godziny VALUES(6,'2021-02-20',9,6);
INSERT INTO rozliczenia.godziny VALUES(7,'2021-02-25',8,10);
INSERT INTO rozliczenia.godziny VALUES(8,'2021-03-28',6,9);
INSERT INTO rozliczenia.godziny VALUES(9,'2021-03-02',4,4);
INSERT INTO rozliczenia.godziny VALUES(10,'2021-03-05',8,8);


--INSERT INTO rozliczenia.pensje VALUES (1,'prezes', 10000,1);
--INSERT INTO rozliczenia.pensje VALUES (2,'dyrektor', 7000,2);
--INSERT INTO rozliczenia.pensje VALUES (3,'zastêpca dyrektora', 6000,3);
--INSERT INTO rozliczenia.pensje VALUES (4,'menad¿er',6000,4);
--INSERT INTO rozliczenia.pensje VALUES (6,'m³odszy ksiêgowy',5000,6);
--INSERT INTO rozliczenia.pensje VALUES (7, 'sekretarka',3000,7);
--INSERT INTO rozliczenia.pensje VALUES (8,'kierownik zespo³u',8000,8);
--INSERT INTO rozliczenia.pensje VALUES (9,'informatyk1',7500,9);
--INSERT INTO rozliczenia.pensje VALUES (10,'informatyk2',7500,10);


INSERT INTO rozliczenia.premie VALUES(1,'œwi¹teczna',500);
INSERT INTO rozliczenia.premie VALUES(2,'nadgodziny',700);
INSERT INTO rozliczenia.premie VALUES(3,'jubileusz',2000);
INSERT INTO rozliczenia.premie VALUES(4,'projektowa',1000);
INSERT INTO rozliczenia.premie VALUES(5,'roczna',1000);
INSERT INTO rozliczenia.premie VALUES(6,'bezwypadkowa',500);
INSERT INTO rozliczenia.premie VALUES(7,'okolicznoœciowa',500);
INSERT INTO rozliczenia.premie VALUES(8,'urodzinowa',600);
INSERT INTO rozliczenia.premie VALUES(9,'kwartalna',300);
INSERT INTO rozliczenia.premie VALUES(10,'wyniki_sprzeda¿y',500);



--5. Wyœwietlenie
SELECT  * FROM rozliczenia.pracownicy;
SELECT  * FROM rozliczenia.godziny;
SELECT  * FROM rozliczenia.pensje;
SELECT  * FROM rozliczenia.premie;


SELECT imiê, nazwisko, adres FROM rozliczenia.pracownicy;

--6. Funkcja DATEPART

SELECT DATEPART(WEEKDAY,DATA) AS 'Dzieñ tygodnia', DATEPART(MONTH,DATA) AS 'Miesi¹c' FROM rozliczenia.godziny;

--7. Zmiana atrybutu

--ALTER TABLE rozliczenia.pensje CHANGE COLUMN kwota kwota_brutto MONEY;

EXEC sp_rename 'rozliczenia.pensje.kwota','kwota_brutto','COLUMN';
ALTER TABLE rozliczenia.pensje ADD kwota_netto MONEY;

UPDATE rozliczenia.pensje SET kwota_netto = kwota_brutto - (0.19*kwota_brutto);

SELECT * FROM rozliczenia.pensje;

