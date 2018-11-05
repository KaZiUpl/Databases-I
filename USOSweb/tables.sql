DROP TABLE studenci;
DROP TABLE zaliczenia;
DROP TABLE grupy;
DROP TABLE przedmioty;
DROP TABLE pracownicy;
DROP TABLE semestry;
DROP TABLE kierunki;

CREATE TABLE studenci
(
    id_studenta INT PRIMARY KEY,
    imie VARCHAR(32),
    nazwisko VARCHAR(32),
    id_semestru INT
);

CREATE TABLE grupy
(
    id_grupy INT PRIMARY KEY,
    numer VARCHAR(2),
    id_przedmiotu INT,
    id_pracownika INT
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
    wymiar_godzin INT,
    id_kierunku INT
);

CREATE TABLE pracownicy
(
	id_pracownika INT PRIMARY KEY,
	imie VARCHAR(32),
	nazwisko VARCHAR(32),
	typ_pracownika VARCHAR(32),
	tytul VARCHAR(128)
);

CREATE TABLE semestry
(
	id_semestru INT PRIMARY KEY,
	id_kierunku INT
);

CREATE TABLE kierunki
(
	id_kierunku INT PRIMARY KEY,
	nazwa VARCHAR(100),
	wydział VARCHAR(100)
);
