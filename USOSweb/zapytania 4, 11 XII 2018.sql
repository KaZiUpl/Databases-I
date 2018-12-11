-----------------------------------------------------4.12.2018-----------------------------------------------------
--=============================== Zadanie 1 ===============================
--zrób trigger, który sprawdzi wprowadzana ocene i zatrzyma UPDATE jesli ocena jest nieprawidlowa
CREATE OR REPLACE TRIGGER sprawdzanie_oceny BEFORE
    UPDATE OF ocena ON zaliczenia
    FOR EACH ROW
BEGIN
    IF ( :new.ocena >= 0 AND :new.ocena <= 5 ) THEN
        dbms_output.put_line('stara ocena: ' || :old.ocena);
        dbms_output.put_line('nowa ocena: ' || :new.ocena);
    END IF;

    IF ( :new.ocena < 0 OR :new.ocena > 5 ) THEN
        dbms_output.put_line('Zla ocena');
        raise_application_error(-20000, 'Zla ocena (oczekiwana wartosc powinna znajdowac sie w przedziale 0-5)');
    END IF;
END;
--===========================

--=============================== Zadanie 1 ===============================
-- stworz tabele HISTORIA_ZMIAN_OCENY z kolumnami: user_name(jaki uzytkownik systemu to wpisal), id_zal, stara_ocena, nowa_ocena
CREATE OR REPLACE TRIGGER historia_oceny BEFORE
    UPDATE OF ocena ON zaliczenia
    FOR EACH ROW
DECLARE
    user_id   varchar(80);
BEGIN
    IF ( :new.ocena >= 0 AND :new.ocena <= 5 ) THEN
        user_id := user;
        INSERT INTO historia_zmian_ocen VALUES (
            user_id,
            :old.id_zaliczenia,
            :old.ocena,
            :new.ocena
        );
    END IF;

    IF ( :new.ocena < 0 OR :new.ocena > 5 ) THEN
        dbms_output.put_line('Zla ocena');
        raise_application_error(-20000, 'Zla ocena (oczekiwana wartosc powinna znajdowac sie w przedziale 0-5)');
    END IF;
END;
-----------------------------------------------------11.12.2018-----------------------------------------------------
--=============================== Zadanie 1 ===============================
--stwórz tabelę sprzedawcy, w której umieścisz drzewo sprzedawców oraz tabelę sprzedaż, w kórej umieścisz rekordy o sprzedaży
-- z datami z dwóch różnych miesięcy
DROP TABLE sprzedawcy;

DROP TABLE sprzedaz;

CREATE TABLE sprzedawcy (
    id_sprzedawcy   INT PRIMARY KEY,
    id_szefa        INT,
    imie            VARCHAR(50),
    nazwisko        VARCHAR(80)
);
CREATE TABLE sprzedaz (
    id_sprzedazy    INT PRIMARY KEY,
    co              VARCHAR(60),
    id_sprzedawcy   INT,
    za_ile          DOUBLE PRECISION,
    data            DATE
);

INSERT INTO SPRZEDAWCY VALUES ('1', NULL ,'Jan', 'Kowalski');
INSERT INTO SPRZEDAWCY VALUES ('2', '1', 'Aleksander', 'Kwadirow');
INSERT INTO SPRZEDAWCY VALUES ('3', '1', 'Kazimierz', 'Jagiellonczyk');
INSERT INTO SPRZEDAWCY VALUES ('4', '2', 'Marek', 'Spacerek');
INSERT INTO SPRZEDAWCY VALUES ('5', '2', 'Joanna', 'Maciuszek');
INSERT INTO SPRZEDAWCY VALUES ('6', '3', 'Pawel', 'Perol');
INSERT INTO SPRZEDAWCY VALUES ('7', '3', 'Kacper', 'Kral');
INSERT INTO SPRZEDAWCY VALUES ('8', '4', 'Karolina', 'Nowygraj');
INSERT INTO SPRZEDAWCY VALUES ('9', '5', 'Ewa', 'Kac');
INSERT INTO SPRZEDAWCY VALUES ('10', '5', 'Bartosz', 'Kuziemski');


INSERT INTO SPRZEDAZ VALUES ('1', 'Proszek do prania', '1', '20', TO_DATE('2018-11-01 09:00:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('2', 'Nożyczki', '1', '3', TO_DATE('2018-11-02 09:00:36', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('3', 'Monitor', '2', '600', TO_DATE('2018-11-03 09:00:43', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('4', 'Klepsydra', '3', '30', TO_DATE('2018-11-04 09:00:50', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('5', 'Zegar', '4', '35', TO_DATE('2018-11-05 09:00:56', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('6', 'Klawiatura', '5', '130', TO_DATE('2018-11-06 09:01:01', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('7', 'Biurko', '5', '400', TO_DATE('2018-11-07 09:01:07', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('8', 'Woda mineralna', '6', '1', TO_DATE('2018-11-08 09:01:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('9', 'Farba czerwona', '6', '40', TO_DATE('2018-11-09 09:01:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('10', 'Chusteczki', '7', '3', TO_DATE('2018-11-10 09:01:21', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('11', 'Telewizor', '7', '1700', TO_DATE('2018-12-01 09:01:26', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('12', 'Zeszyt w kratkę', '8', '2', TO_DATE('2018-12-02 09:01:30', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('13', 'Diamenty', '9', '5000', TO_DATE('2018-12-03 09:01:34', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('14', 'Rubiny', '10', '4000', TO_DATE('2018-12-04 09:01:38', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SPRZEDAZ VALUES ('15', 'Szafiry', '10', '3000', TO_DATE('2018-12-05 09:01:41', 'YYYY-MM-DD HH24:MI:SS'));
--=============================== Zadanie 2 ===============================
-- znajdz zespol Jana Kowalskiego 
WITH zespol_kowalskiego (
    id_sprzedawcy,
    id_szefa,
    imie,
    nazwisko
) AS (
    SELECT
        id_sprzedawcy,
        id_szefa,
        imie,
        nazwisko
    FROM
        sprzedawcy
    WHERE
        id_sprzedawcy = 1
    UNION ALL
    SELECT
        sprz.id_sprzedawcy,
        sprz.id_szefa,
        sprz.imie,
        sprz.nazwisko
    FROM
        zespol_kowalskiego zespol
        JOIN sprzedawcy sprz ON zespol.id_sprzedawcy = sprz.id_szefa
)
SELECT
    id_sprzedawcy,
    id_szefa,
    imie,
    nazwisko
FROM
    zespol_kowalskiego;
--=============================== Zadanie 3 ===============================
-- sprzedaz laczna zespolu Kowalskiego
WITH zespol_kowalskiego (
    id_sprzedawcy,
    id_szefa,
    imie,
    nazwisko
) AS (
    SELECT
        id_sprzedawcy,
        id_szefa,
        imie,
        nazwisko
    FROM
        sprzedawcy
    WHERE
        id_sprzedawcy = 1
    UNION ALL
    SELECT
        sprz.id_sprzedawcy,
        sprz.id_szefa,
        sprz.imie,
        sprz.nazwisko
    FROM
        zespol_kowalskiego zespol
        JOIN sprzedawcy sprz ON zespol.id_sprzedawcy = sprz.id_szefa
)
SELECT
    SUM(za_ile) AS sprzedaz_laczna
FROM
    zespol_kowalskiego
    JOIN sprzedaz ON zespol_kowalskiego.id_sprzedawcy = sprzedaz.id_sprzedawcy;                                                                  
