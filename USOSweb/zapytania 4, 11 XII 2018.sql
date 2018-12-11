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
CREATE TABLE sprzedawcy (
    id_sprzedawcy   INT,
    id_szefa        INT,
    imie            VARCHAR(50),
    nazwisko        VARCHAR(80)
);
CREATE TABLE sprzedaz (
    id_sprzedazy   INT,
    za_ile         INT,
    co             VARCHAR(60),
    data           DATE
);
