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


INSERT INTO STUDENCI VALUES ('1', 'Jan', 'Kowalski')
INSERT INTO STUDENCI VALUES ('2', 'Konrad', 'Mazowiecki')
INSERT INTO STUDENCI VALUES ('3', 'Marek', 'Nowak')
INSERT INTO STUDENCI VALUES ('4', 'Adam', 'Mroz')
INSERT INTO STUDENCI VALUES ('5', 'Kazimierz', 'Wielki')
INSERT INTO STUDENCI VALUES ('6', 'Anna', 'Jantar')
INSERT INTO STUDENCI VALUES ('7', 'Wiktor', 'Ektor')
INSERT INTO STUDENCI VALUES ('8', 'Ewa', 'Dziwak')
INSERT INTO STUDENCI VALUES ('9', 'Krzysztof', 'Klarys')
INSERT INTO STUDENCI VALUES ('10', 'Czesnik', 'Raptusiewicz')
INSERT INTO STUDENCI VALUES ('11', 'Adam', 'Mickiewicz')


INSERT INTO PRZEDMIOTY VALUES ('1', 'Algebra liniowa z geometria analityczna', 'ocena', '500')
INSERT INTO PRZEDMIOTY VALUES ('2', 'Analiza matematyczna I', 'ocena', '120')
INSERT INTO PRZEDMIOTY VALUES ('3', 'Srodowiska obliczen symbolicznych', 'zaliczenie', '60')
INSERT INTO PRZEDMIOTY VALUES ('4', 'Algorytmy i struktury danych', 'ocena', '60')


select przedmioty.nazwa, przedmioty.typ_zaliczenia, grupy.id
from przedmioty, grupy
where grupy.przedmiot = przedmioty.id; 


select stud.id, stud.imie, stud.nazwisko, zal.ocena, gr.id
from studenci stud 	join zaliczenia zal on (stud.id = zal.id_studenta)
                    join grupy gr on (gr.id = zal.id_grupy)
order by stud.id;





