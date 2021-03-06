
-----------------------------------------------------6.11.2018-----------------------------------------------------
--=============================== Zadanie 1 ===============================
--imie, nazwisko, numer gupy ludzi będących na Bazach danych:
--===========================
SELECT
    stud.imie,
    stud.nazwisko,
    gr.numer
FROM
    studenci stud
    INNER JOIN zaliczenia zal ON ( stud.id_studenta = zal.id_studenta )
    INNER JOIN grupy gr ON ( zal.id_grupy = gr.id_grupy )
    INNER JOIN przedmioty prz ON ( gr.id_przedmiotu = prz.id_przedmiotu )
WHERE
    prz.nazwa LIKE 'Bazy danych';

------------------ imie studenta o id 42 na Jan

--=============================== Zadanie 2 ===============================
--wyswietl imie, nazwisko i grupye ludzi, ktorzy studuiuja z Janem Kowalskim (id_studenta = 42):
--===========================
-- wersja z podzapytaniem:
SELECT
    stud.imie,
    stud.nazwisko,
    gr.numer,
    gr.id_grupy
FROM
    studenci stud
    JOIN zaliczenia zal ON ( stud.id_studenta = zal.id_studenta )
    JOIN grupy gr ON ( zal.id_grupy = gr.id_grupy )
WHERE
    gr.id_grupy IN (
        SELECT
            gr.id_grupy
        FROM
            studenci stud
            JOIN zaliczenia zal ON ( stud.id_studenta = zal.id_studenta )
            JOIN grupy gr ON ( zal.id_grupy = gr.id_grupy )
        WHERE
            stud.imie = 'Jan'
            AND stud.nazwisko = 'Kowalski'
    )
    AND stud.id_studenta NOT LIKE 'Jan'
    AND stud.nazwisko NOT LIKE 'Kowalski';
--===========================                  
-- wersja bez podzapytania:
SELECT
    stud.imie,
    stud.nazwisko,
    gr.numer,
    gr2.id_grupy
FROM
    studenci stud
    JOIN zaliczenia zal ON ( stud.id_studenta = zal.id_studenta )
    JOIN grupy gr ON ( zal.id_grupy = gr.id_grupy ), studenci stud2
    JOIN zaliczenia zal2 ON ( stud2.id_studenta = zal2.id_studenta )
    JOIN grupy gr2 ON ( zal2.id_grupy = gr2.id_grupy )
WHERE
    stud2.imie = 'Jan'
    AND stud2.nazwisko = 'Kowalski'
    AND NOT stud.imie = 'Jan'
    AND stud.nazwisko = 'Kowalski';
	
	
	
	
	
-----------------------------------------------------13.11.2018-----------------------------------------------------
--=============================== Zadanie 1 ===============================
--Średnia ocen studentów
--===========================
--każdego osobno
SELECT
    stud.id_studenta, 
    stud.imie, 
    stud.nazwisko, 
    ROUND(AVG(zal.ocena),3) AS "Średnia ocen"
FROM
    studenci stud join zaliczenia zal on (stud.id_studenta = zal.id_studenta)
WHERE
    zal.ocena NOT IN (0,1)
GROUP BY
    stud.id_studenta,
    stud.imie,
    stud.nazwisko
ORDER BY "Średnia ocen";
--===========================
--wszystkich
SELECT 
    ROUND(AVG(zaliczenia.ocena),3) AS "Średnia ocen"
FROM 
    zaliczenia
WHERE 
    zaliczenia.ocena NOT IN (0,1);
--=============================== Zadanie 2 ===============================
--Wyświetl wszystkich studentów z najwyższą średnią:
--===========================
SELECT
    stud.id_studenta,
    stud.imie,
    stud.nazwisko,
    round(AVG(zal.ocena), 3) AS "srednia"
FROM
    studenci stud
    JOIN zaliczenia zal ON ( stud.id_studenta = zal.id_studenta )
WHERE
    zal.ocena NOT IN (0,1)
GROUP BY
    stud.id_studenta,
    stud.imie,
    stud.nazwisko
HAVING
    round(AVG(zal.ocena), 3) = (
        SELECT
            MAX(p.srednia)
        FROM
            (
                SELECT
                    round(AVG(zal.ocena), 3) AS srednia
                FROM
                    studenci
                    JOIN zaliczenia zal ON ( studenci.id_studenta = zal.id_studenta )
                GROUP BY
                    studenci.id_studenta
            ) p
    );
--===========================
--wersja z tworzeniem widoku
DROP VIEW srednia;

CREATE VIEW srednia AS
    SELECT
        imie,
        nazwisko,
        round(AVG(zal.ocena), 3) AS srednia_ocen
    FROM
        studenci stud
        JOIN zaliczenia zal ON stud.id_studenta = zal.id_studenta
    WHERE
        zal.ocena NOT IN (
            0,
            1
        )
    GROUP BY
        imie,
        nazwisko,
        stud.id_studenta;

SELECT
    imie,
    nazwisko
FROM
    srednia
WHERE
    srednia_ocen = (
        SELECT
            MAX(srednia_ocen)
        FROM
            srednia
    );
	
	
	
	
	
-----------------------------------------------------20.11.2018-----------------------------------------------------
--=============================== Zadanie 1 ===============================
-- stwórz widok średnia
DROP VIEW srednia;

CREATE VIEW srednia AS
    ( SELECT
        stud.id_studenta,
        imie,
        nazwisko,
        round(AVG(zal.ocena), 3) AS srednia_ocen
    FROM
        studenci stud
        JOIN zaliczenia zal ON stud.id_studenta = zal.id_studenta
    WHERE
        zal.ocena NOT IN (
            0,
            1
        )
    GROUP BY
        imie,
        nazwisko,
        stud.id_studenta
    );

SELECT
    *
FROM
    srednia;
--===========================
-- stwórz widok zajęcia (id_stud,imie, nazwisko, nazwa_grupy, nazwa_przedmiotu)
INSERT INTO "ZALICZENIA" (ID_ZALICZENIA, ID_STUDENTA, ID_GRUPY) VALUES ('232', '99', '13');
INSERT INTO "ZALICZENIA" (ID_ZALICZENIA, ID_STUDENTA, ID_GRUPY) VALUES ('233', '98', '44');

DROP VIEW zajecia;

CREATE VIEW zajecia AS
    ( SELECT
        stud.id_studenta,
        stud.imie,
        stud.nazwisko,
        gr.numer,
        prz.nazwa
    FROM
        studenci stud
        JOIN zaliczenia zal ON ( stud.id_studenta = zal.id_studenta )
        JOIN grupy gr ON ( zal.id_grupy = gr.id_grupy )
        JOIN przedmioty prz ON ( gr.id_przedmiotu = prz.id_przedmiotu )
    WHERE
        zal.ocena IS NULL
    );

SELECT
    *
FROM
    zajecia;
--===========================
-- stwórz widok z najlepszymi studentami
DROP VIEW najlepsi_studenci;

CREATE VIEW najlepsi_studenci AS
    ( SELECT
        id_studenta,
        imie,
        nazwisko,
        srednia_ocen
    FROM
        srednia
    WHERE
        srednia_ocen = (
            SELECT
                MAX(srednia_ocen)
            FROM
                srednia
        )
    );

SELECT
    *
FROM
    najlepsi_studenci;
	
	
	
	
	
-----------------------------------------------------27.11.2018-----------------------------------------------------
--=============================== Zadanie 1 ===============================
--===========================

--=============================== Zadanie 2 ===============================
--===========================

--=============================== Zadanie 3 ===============================
--===========================
