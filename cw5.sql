
--1.Utworzenie bazy 
CREATE DATABASE firma1;
USE firma1;

--2. Utworzenie schematu

CREATE SCHEMA ksiegowosc;

--3. Dodanie tabel wraz z typami.

CREATE TABLE ksiegowosc.pracownicy(ID_pracownika INTEGER PRIMARY KEY NOT NULL, imiê VARCHAR(20) NOT NULL, nazwisko VARCHAR(20) NOT NULL,adres VARCHAR(50) NOT NULL,telefon VARCHAR(20) NOT NULL);  
CREATE TABLE ksiegowosc.godziny (ID_godziny INTEGER PRIMARY KEY NOT NULL, data DATE, liczba_godzin INTEGER NOT NULL, ID_pracownika INTEGER NOT NULL); 
CREATE TABLE ksiegowosc.pensja (ID_pensji INTEGER PRIMARY KEY NOT NULL, stanowisko VARCHAR(20), kwota INTEGER NOT NULL);
CREATE TABLE ksiegowosc.premia (ID_premii INTEGER PRIMARY KEY NOT NULL, rodzaj VARCHAR(20), kwota INTEGER);
CREATE TABLE ksiegowosc.wynagrodzenie(ID_wynagrodzenia INTEGER PRIMARY KEY NOT NULL,data DATE, ID_pracownika INTEGER NOT NULL, ID_godziny INTEGER NOT NULL,ID_pensji INTEGER NOT NULL, ID_premii INTEGER );



-- powi¹zania miêdzy tabelami
ALTER TABLE ksiegowosc.godziny ADD FOREIGN KEY (ID_pracownika) REFERENCES ksiegowosc.pracownicy (ID_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (ID_pracownika) REFERENCES ksiegowosc.pracownicy (ID_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (ID_godziny) REFERENCES ksiegowosc.godziny (ID_godziny);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (ID_pensji) REFERENCES ksiegowosc.pensja(ID_pensji);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (ID_premii) REFERENCES ksiegowosc.premia(ID_premii);

--komentarze tabel
EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Tabela zawiera dane pracowników',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='pracownicy'
GO

EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Informacja o przepracowanych godzinach',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='godziny'
GO
EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Informacja o pensji na danym stanowisku',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='pensja'
GO
EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Informacja o rodzajach premii',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='premia'
GO
EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Informacja o wynagrodzeniu',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='wynagrodzenie'
GO

--4. Wype³nienie tabel rekordami

INSERT INTO ksiegowosc.pracownicy VALUES (1,'Anna','Nowak', 'Kraków', 567989654);
INSERT INTO ksiegowosc.pracownicy VALUES (2,'Krzysztof','Kowalski', 'Warszawa' , 534213567);
INSERT INTO ksiegowosc.pracownicy VALUES(3,'Natalia','Sokó³','Gdañsk',789543234);
INSERT INTO ksiegowosc.pracownicy VALUES(4,'Agnieszka', 'Sowa','Zakopane',789654235);
INSERT INTO ksiegowosc.pracownicy VALUES(5,'Rafa³','Adamczyk','Wieliczka',567890432);
INSERT INTO ksiegowosc.pracownicy VALUES(6,'Piotr','Kula','Bochnia',765348765);
INSERT INTO ksiegowosc.pracownicy VALUES(7,'Magdalena','Krawczyk','Gdynia',765234678);
INSERT INTO ksiegowosc.pracownicy VALUES(8,'Weronika','Zieliñska','Andrychów',654234154);
INSERT INTO ksiegowosc.pracownicy VALUES(9,'Beata','Drabek','Lublin',768983236);
INSERT INTO ksiegowosc.pracownicy VALUES(10,'Józef','Kowalczyk','Opole',765287598);


INSERT INTO ksiegowosc.godziny VALUES(1,'2021-02-01',161,2);
INSERT INTO ksiegowosc.godziny VAlUES(2,'2021-03-03',162,1);
INSERT INTO ksiegowosc.godziny VALUES(3,'2021-05-02',170,5);
INSERT INTO ksiegowosc.godziny VALUES(4,'2021-08-02',160,7);
INSERT INTO ksiegowosc.godziny VALUES(5,'2021-12-04',169,3);
INSERT INTO ksiegowosc.godziny VALUES(6,'2021-02-20',169,6);
INSERT INTO ksiegowosc.godziny VALUES(7,'2021-02-25',168,10);
INSERT INTO ksiegowosc.godziny VALUES(8,'2021-02-28',160,9);
INSERT INTO ksiegowosc.godziny VALUES(9,'2021-03-02',164,4);
INSERT INTO ksiegowosc.godziny VALUES(10,'2021-03-05',160,8);


INSERT INTO ksiegowosc.pensja VALUES (1,'prezes', 10000);
INSERT INTO ksiegowosc.pensja VALUES (2,'dyrektor', 7000);
INSERT INTO ksiegowosc.pensja VALUES (3,'zastêpca dyrektora', 6000);
INSERT INTO ksiegowosc.pensja VALUES (4,'menad¿er',6000);
INSERT INTO ksiegowosc.pensja VALUES (5,'menad¿er',6000);
INSERT INTO ksiegowosc.pensja VALUES (6,'m³odszy ksiêgowy',5000);
INSERT INTO ksiegowosc.pensja VALUES (7, 'sekretarka',2800);
INSERT INTO ksiegowosc.pensja VALUES (8,'kierownik zespo³u',8000);
INSERT INTO ksiegowosc.pensja VALUES (9,'informatyk',7500);
INSERT INTO ksiegowosc.pensja VALUES (10,'informatyk',7000);


INSERT INTO ksiegowosc.premia VALUES(1,'œwi¹teczna',500);
INSERT INTO ksiegowosc.premia VALUES(2,'nadgodziny',700);
INSERT INTO ksiegowosc.premia VALUES(3,'jubileusz',2000);
INSERT INTO ksiegowosc.premia VALUES(4,'projektowa',1000);
INSERT INTO ksiegowosc.premia VALUES(5,'roczna',1000);
INSERT INTO ksiegowosc.premia VALUES(6,'bezwypadkowa',500);
INSERT INTO ksiegowosc.premia VALUES(7,'okolicznoœciowa',500);
INSERT INTO ksiegowosc.premia VALUES(8,'urodzinowa',600);
INSERT INTO ksiegowosc.premia VALUES(9,'kwartalna',300);
INSERT INTO ksiegowosc.premia VALUES(10,'wyniki_sprzeda¿y',500);

INSERT INTO ksiegowosc.wynagrodzenie VALUES (1,'2021-02-02',2,4,10,NULL);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (2,'2021-02-04',3,5,1,4);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (3,'2021-02-07',5,2,9,1);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (4,'2021-02-10',7,6,7,7);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (5,'2021-02-15',4,1,6,9);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (6,'2021-02-17',1,3,2,3);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (7,'2021-02-19',6,7,3,10);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (8,'2021-02-23',9,9,4,5);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (9,'2021-02-25',8,10,8,8);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (10,'2021-02-27',10,8,5,6);

--5a.

SELECT ID_pracownika, nazwisko FROM ksiegowosc.pracownicy;

--5b.
SELECT ID_pracownika, kwota FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja WHERE ksiegowosc.wynagrodzenie.ID_pensji = ksiegowosc.pensja.ID_pensji AND ksiegowosc.pensja.kwota > 1000;

--5c.
SELECT ID_pracownika FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja WHERE ksiegowosc.wynagrodzenie.ID_pensji = ksiegowosc.pensja.ID_pensji AND ksiegowosc.wynagrodzenie.ID_premii IS NULL AND kwota >2000;

--5d.
SELECT imiê, nazwisko FROM ksiegowosc.pracownicy WHERE imiê  LIKE 'j%';

--5e.
SELECT imiê, nazwisko FROM ksiegowosc.pracownicy WHERE nazwisko  LIKE '%n%' AND nazwisko LIKE '%a';

--5f.

SELECT imiê, nazwisko, liczba_godzin-160 AS nadgodziny FROM ksiegowosc.pracownicy, ksiegowosc.godziny
WHERE ksiegowosc.pracownicy.ID_pracownika =ksiegowosc.godziny.ID_pracownika;

--5g.

SELECT imiê, nazwisko,kwota FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja 
WHERE ksiegowosc.pensja.ID_pensji=ksiegowosc.wynagrodzenie.ID_pensji AND ksiegowosc.pracownicy.ID_pracownika=ksiegowosc.wynagrodzenie.ID_pracownika AND kwota >1500 AND kwota <3000;

--5h.
SELECT imiê, nazwisko, liczba_godzin-160 AS nadgodziny, id_premii FROM ksiegowosc.pracownicy, ksiegowosc.godziny, ksiegowosc.wynagrodzenie 
WHERE ksiegowosc.pracownicy.ID_pracownika =ksiegowosc.godziny.ID_pracownika AND ksiegowosc.wynagrodzenie.ID_pracownika=ksiegowosc.pracownicy.ID_pracownika  AND liczba_godzin-160 >0 AND ID_premii IS NULL;

--5i.
SELECT imiê, nazwisko, ksiegowosc.pracownicy.ID_pracownika, kwota FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja 
WHERE ksiegowosc.pracownicy.ID_pracownika=ksiegowosc.wynagrodzenie.ID_pracownika AND ksiegowosc.pensja.ID_pensji=ksiegowosc.wynagrodzenie.ID_pensji ORDER BY kwota DESC;

--5j.
SELECT imiê, nazwisko, ksiegowosc.pracownicy.ID_pracownika, ksiegowosc.pensja.kwota, ksiegowosc.premia.kwota FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie,  ksiegowosc.premia,ksiegowosc.pensja 
WHERE ksiegowosc.pracownicy.ID_pracownika=ksiegowosc.wynagrodzenie.ID_pracownika AND ksiegowosc.wynagrodzenie.ID_pensji=ksiegowosc.pensja.ID_pensji   AND ksiegowosc.premia.ID_premii=ksiegowosc.wynagrodzenie.ID_premii 
ORDER BY ksiegowosc.pensja.kwota DESC, ksiegowosc.premia.kwota DESC;

--5k.
SELECT stanowisko, COUNT(stanowisko) AS liczba_stanowisk FROM ksiegowosc.pensja GROUP BY stanowisko;

--5l.
SELECT AVG(kwota) AS Œrednia, MIN(kwota) AS MIN , MAX(kwota) AS MAX FROM ksiegowosc.pensja WHERE stanowisko= 'informatyk';

--5m.
SELECT SUM(ksiegowosc.pensja.kwota) AS razem FROM  ksiegowosc.pensja;

--5n.
SELECT stanowisko, COUNT(stanowisko) AS liczba_stanowisk, kwota, SUM(kwota) AS suma 
FROM ksiegowosc.pensja GROUP BY stanowisko,kwota;


--5o.


select ksiegowosc.pensja.stanowisko, count(ksiegowosc.pensja.kwota) as suma
from ksiegowosc.wynagrodzenie , ksiegowosc.pensja WHERE ksiegowosc.wynagrodzenie.ID_pensji=ksiegowosc.pensja.ID_pensji
group by ksiegowosc.pensja.stanowisko;


--5p.

SELECT imiê,nazwisko,kwota FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja 
WHERE ksiegowosc.pracownicy.ID_pracownika=ksiegowosc.wynagrodzenie.ID_pracownika AND ksiegowosc.wynagrodzenie.ID_pensji= ksiegowosc.pensja.ID_pensji
DELETE FROM ksiegowosc.pensja WHERE kwota <1200;

SELECT*FROM ksiegowosc.pensja;











