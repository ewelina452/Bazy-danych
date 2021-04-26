use firma1;
--1a.
UPDATE ksiegowosc.pracownicy set telefon = '(+48) ' + telefon;
select*from ksiegowosc.pracownicy;
--1b.
UPDATE ksiegowosc.pracownicy set telefon = SUBSTRING(telefon,1,9) + '-' + SUBSTRING(telefon,10,3) + '-' + SUBSTRING(telefon,13,3);

--1c.

SELECT UPPER(id_pracownika) AS id_pracownika, UPPER(imi�) AS imi�, UPPER(nazwisko) AS nazwisko,UPPER(adres) AS adres,telefon  
FROM ksiegowosc.pracownicy WHERE len(nazwisko) = (SELECT max(len(nazwisko)) FROM ksiegowosc.pracownicy);

--1d.
SELECT pracownicy.ID_pracownika,pracownicy.imi�, pracownicy.nazwisko, HASHBYTES('MD5',(CAST(pensja.kwota AS NVARCHAR(15)))) AS zakodowane_pensje FROM ksiegowosc.pensja, ksiegowosc.pracownicy,ksiegowosc.wynagrodzenie
WHERE ksiegowosc.wynagrodzenie.ID_pensji=ksiegowosc.pensja.ID_pensji AND ksiegowosc.wynagrodzenie.ID_pracownika=ksiegowosc.pracownicy.ID_pracownika;


--1f.
SELECT imi�,nazwisko, premia.kwota, pensja.kwota FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.pracownicy  ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.premia  ON ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii
LEFT JOIN ksiegowosc.pensja  ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji;


--1g.


SELECT CONCAT('Pracownik ',pracownicy.imi�,' ', pracownicy.nazwisko, ' w dniu ',godziny.data,' otrzyma� pensj� ca�kowit� na kwot�: ',pensja.kwota +premia.kwota+(godziny.liczba_godzin-160)*20,' z�, ',
'gdzie wynagrodzenie zasadnicze wynios�o: ', pensja.kwota,' z�,',' premia: ',premia.kwota,' z�,',' nadgodziny: ',(godziny.liczba_godzin-160)*20, ' z�.') AS RAPORT
FROM ksiegowosc.pracownicy,ksiegowosc.godziny,ksiegowosc.pensja,ksiegowosc.premia,ksiegowosc.wynagrodzenie 
WHERE ksiegowosc.pracownicy.ID_pracownika=ksiegowosc.wynagrodzenie.ID_pracownika AND ksiegowosc.wynagrodzenie.ID_pensji=ksiegowosc.pensja.ID_pensji
AND ksiegowosc.premia.ID_premii=ksiegowosc.wynagrodzenie.ID_premii AND ksiegowosc.godziny.ID_godziny=ksiegowosc.wynagrodzenie.ID_godziny;

