DROP TABLE studenci;
DROP TABLE zaliczenia;
DROP TABLE grupy;
DROP TABLE przedmioty;

CREATE TABLE studenci
(
    id_studenta INT PRIMARY KEY,
    imie VARCHAR(32),
    nazwisko VARCHAR(32)
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

CREATE TABLE pracownicy
(
	id_pracownika INT PRIMARY KEY,
    id_grupy INT,
	imie VARCHAR(32),
	nazwisko VARCHAR(32),
	typ_pracownika VARCHAR(32),
	tytul VARCHAR(128)
);

CREATE TABLE semestry
(
	id_semestru INT PRIMARY KEY,
	id_grupy INT,
	id_przedmiotu INT,
	id_studenta INT
);

CREATE TABLE kierunki
(
	id_kierunku INT PRIMARY KEY,
	id_semestru INT,
	id_przedmiotu INT,
	nazwa VARCHAR(100),
	wydział VARCHAR(100)
);