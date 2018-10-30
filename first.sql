CREATE TABLE studenci
(
    id INT PRIMARY KEY,
    imie VARCHAR,
    nazwisko VARCHAR
);

CREATE TABLE grupy
(
    id INT PRIMARY KEY,
    numer INT,
    przedmiot VARCHAR(255)
);

CREATE TABLE zaliczenia
(
    id INT PRIMARY KEY,
    id_studenta INT,
    id_grupy INT,
    ocena INT
);

CREATE TABLE przedmioty
(
    id INT PRIMARY KEY,
    nazwa VARCHAR(255),
    typ_zaliczenia VARCHAR(50),
    wymiar_godzin INT
);


INSERT INTO "G5_KACPERKAZ"."STUDENCI" (ID, IMIE, NAZWISKO) VALUES ('1', 'Jan', 'Kowalski')
INSERT INTO "G5_KACPERKAZ"."STUDENCI" (ID, IMIE, NAZWISKO) VALUES ('2', 'Konrad', 'Mazowiecki')
INSERT INTO "G5_KACPERKAZ"."STUDENCI" (ID, IMIE, NAZWISKO) VALUES ('3', 'Marek', 'Nowak')
INSERT INTO "G5_KACPERKAZ"."STUDENCI" (ID, IMIE, NAZWISKO) VALUES ('4', 'Adam', 'Mroz')
INSERT INTO "G5_KACPERKAZ"."STUDENCI" (ID, IMIE, NAZWISKO) VALUES ('5', 'Kazimierz', 'Wielki')
INSERT INTO "G5_KACPERKAZ"."STUDENCI" (ID, IMIE, NAZWISKO) VALUES ('6', 'Anna', 'Jantar')
INSERT INTO "G5_KACPERKAZ"."STUDENCI" (ID, IMIE, NAZWISKO) VALUES ('7', 'Wiktor', 'Ektor')
INSERT INTO "G5_KACPERKAZ"."STUDENCI" (ID, IMIE, NAZWISKO) VALUES ('8', 'Ewa', 'Dziwak')
INSERT INTO "G5_KACPERKAZ"."STUDENCI" (ID, IMIE, NAZWISKO) VALUES ('9', 'Krzysztof', 'Klarys')
INSERT INTO "G5_KACPERKAZ"."STUDENCI" (ID, IMIE, NAZWISKO) VALUES ('10', 'Czesnik', 'Raptusiewicz')
INSERT INTO "G5_KACPERKAZ"."STUDENCI" (ID, IMIE, NAZWISKO) VALUES ('11', 'Adam', 'Mickiewicz')


INSERT INTO "G5_KACPERKAZ"."PRZEDMIOTY" (ID, NAZWA, TYP_ZALICZENIA, WYMIAR_GODZIN) VALUES ('1', 'Algebra liniowa z geometria analityczna', 'ocena', '500')
INSERT INTO "G5_KACPERKAZ"."PRZEDMIOTY" (ID, NAZWA, TYP_ZALICZENIA, WYMIAR_GODZIN) VALUES ('2', 'Analiza matematyczna I', 'ocena', '120')
INSERT INTO "G5_KACPERKAZ"."PRZEDMIOTY" (ID, NAZWA, TYP_ZALICZENIA, WYMIAR_GODZIN) VALUES ('3', 'Srodowiska obliczen symbolicznych', 'zaliczenie', '60')
INSERT INTO "G5_KACPERKAZ"."PRZEDMIOTY" (ID, NAZWA, TYP_ZALICZENIA, WYMIAR_GODZIN) VALUES ('4', 'Algorytmy i struktury danych', 'ocena', '60')


select przedmioty.nazwa, przedmioty.typ_zaliczenia, grupy.id
from przedmioty, grupy
where grupy.przedmiot = przedmioty.id; 


select stud.id, stud.imie, stud.nazwisko, zal.ocena, gr.id
from studenci stud 	join zaliczenia zal on (stud.id = zal.id_studenta)
                    join grupy gr on (gr.id = zal.id_grupy)
order by stud.id;





