DROP TABLE studenci;
DROP TABLE zaliczenia;
DROP TABLE grupy;
DROP TABLE przedmioty;

CREATE TABLE studenci
(
    id_studenta INT PRIMARY KEY,
    imie VARCHAR,
    nazwisko VARCHAR
);

CREATE TABLE grupy
(
    id_grupy INT PRIMARY KEY,
    numer INT,
    przedmiot VARCHAR(255)
);

CREATE TABLE zaliczenia
(
    id_zaliczenia INT PRIMARY KEY,
    id_studenta INT,
    id_grupy INT,
    ocena INT
);

CREATE TABLE przedmioty
(
    id_przedmiotu INT PRIMARY KEY,
    nazwa VARCHAR(255),
    typ_zaliczenia VARCHAR(50),
    wymiar_godzin INT
);
