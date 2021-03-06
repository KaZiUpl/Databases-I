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


INSERT INTO studenci VALUES(1,'Paulina','Sobczak');
INSERT INTO studenci VALUES(2,'Henryk','Bak');
INSERT INTO studenci VALUES(3,'Kazimierz','Gorski');
INSERT INTO studenci VALUES(4,'Irena','Wojcik');
INSERT INTO studenci VALUES(5,'Marian','Chmielewski');
INSERT INTO studenci VALUES(6,'Malgorzata','Jaworska');
INSERT INTO studenci VALUES(7,'Ewa','Duda');
INSERT INTO studenci VALUES(8,'Jakub','Malinowski');
INSERT INTO studenci VALUES(9,'Jadwiga','Brzezinska');
INSERT INTO studenci VALUES(10,'Roman','Sawicki');
INSERT INTO studenci VALUES(11,'Marcin','Szymczak');
INSERT INTO studenci VALUES(12,'Joanna','Baranowska');
INSERT INTO studenci VALUES(13,'Maciej','Szczepanski');
INSERT INTO studenci VALUES(14,'Czeslaw','Wrobel');
INSERT INTO studenci VALUES(15,'Grazyna','Gorska');
INSERT INTO studenci VALUES(16,'Wanda','Krawczyk');
INSERT INTO studenci VALUES(17,'Renata','Urbanska');
INSERT INTO studenci VALUES(18,'Wieslawa','Tomaszewska');
INSERT INTO studenci VALUES(19,'Bozena','Baranowska');
INSERT INTO studenci VALUES(20,'Ewelina','Malinowska');
INSERT INTO studenci VALUES(21,'Anna','Krajewska');
INSERT INTO studenci VALUES(22,'Mieczyslaw','Zajac');
INSERT INTO studenci VALUES(23,'Wieslaw','Przybylski');
INSERT INTO studenci VALUES(24,'Dorota','Tomaszewska');
INSERT INTO studenci VALUES(25,'Jerzy','Wroblewski');
INSERT INTO studenci VALUES(26,'Magdalena','Adamczyk');
INSERT INTO studenci VALUES(27,'Wladyslaw','Piotrowski');
INSERT INTO studenci VALUES(28,'Marek','Wisniewski');
INSERT INTO studenci VALUES(29,'Stanislawa','Glowacka');
INSERT INTO studenci VALUES(30,'Agata','Kubiak');
INSERT INTO studenci VALUES(31,'Marian','Kowalski');
INSERT INTO studenci VALUES(32,'Piotr','Szymanski');
INSERT INTO studenci VALUES(33,'Stanislaw','Kowalski');
INSERT INTO studenci VALUES(34,'Aleksandra','Szulc');
INSERT INTO studenci VALUES(35,'Tomasz','Kucharski');
INSERT INTO studenci VALUES(36,'Marcin','Mazurek');
INSERT INTO studenci VALUES(37,'Sebastian','Baranowski');
INSERT INTO studenci VALUES(38,'Agata','Wysocka');
INSERT INTO studenci VALUES(39,'Grazyna','Mazur');
INSERT INTO studenci VALUES(40,'Marcin','Gajewski');
INSERT INTO studenci VALUES(41,'Krystyna','Sikorska');
INSERT INTO studenci VALUES(42,'Krzysztof','Kowalski');
INSERT INTO studenci VALUES(43,'Malgorzata','Mazurek');
INSERT INTO studenci VALUES(44,'Adam','Jasinski');
INSERT INTO studenci VALUES(45,'Patrycja','Makowska');
INSERT INTO studenci VALUES(46,'Piotr','Adamczyk');
INSERT INTO studenci VALUES(47,'Waldemar','Wieczorek');
INSERT INTO studenci VALUES(48,'Edward','Szulc');
INSERT INTO studenci VALUES(49,'Janusz','Andrzejewski');
INSERT INTO studenci VALUES(50,'Edyta','Nowakowska');
INSERT INTO studenci VALUES(51,'Joanna','Wozniak');
INSERT INTO studenci VALUES(52,'Mateusz','Michalak');
INSERT INTO studenci VALUES(53,'Marta','Sobczak');
INSERT INTO studenci VALUES(54,'Waldemar','Makowski');
INSERT INTO studenci VALUES(55,'Marzena','Jablonska');
INSERT INTO studenci VALUES(56,'Maciej','Sikora');
INSERT INTO studenci VALUES(57,'Monika','Szewczyk');
INSERT INTO studenci VALUES(58,'Genowefa','Cieslak');
INSERT INTO studenci VALUES(59,'Edyta','Nowicka');
INSERT INTO studenci VALUES(60,'Piotr','Malinowski');
INSERT INTO studenci VALUES(61,'Krzysztof','Glowacki');
INSERT INTO studenci VALUES(62,'Andrzej','Szewczyk');
INSERT INTO studenci VALUES(63,'Mariusz','Grabowski');
INSERT INTO studenci VALUES(64,'Stefania','Krol');
INSERT INTO studenci VALUES(65,'Wieslaw','Szczepanski');
INSERT INTO studenci VALUES(66,'Malgorzata','Wasilewska');
INSERT INTO studenci VALUES(67,'Jozef','Szczepanski');
INSERT INTO studenci VALUES(68,'Mariusz','Kowalczyk');
INSERT INTO studenci VALUES(69,'Janina','Kozlowska');
INSERT INTO studenci VALUES(70,'Roman','Kwiatkowski');
INSERT INTO studenci VALUES(71,'Jadwiga','Kaminska');
INSERT INTO studenci VALUES(72,'Agnieszka','Zajac');
INSERT INTO studenci VALUES(73,'Robert','Wlodarczyk');
INSERT INTO studenci VALUES(74,'Henryk','Kowalski');
INSERT INTO studenci VALUES(75,'Kazimiera','Zalewska');
INSERT INTO studenci VALUES(76,'Sylwia','Kazmierczak');
INSERT INTO studenci VALUES(77,'Dorota','Maciejewska');
INSERT INTO studenci VALUES(78,'Jacek','Laskowski');
INSERT INTO studenci VALUES(79,'Michal','Sobczak');
INSERT INTO studenci VALUES(80,'Genowefa','Lis');
INSERT INTO studenci VALUES(81,'Miroslaw','Czerwinski');
INSERT INTO studenci VALUES(82,'Agata','Gajewska');
INSERT INTO studenci VALUES(83,'Zofia','Bak');
INSERT INTO studenci VALUES(84,'Marek','Adamczyk');
INSERT INTO studenci VALUES(85,'Agata','Pawlak');
INSERT INTO studenci VALUES(86,'Adam','Jankowski');
INSERT INTO studenci VALUES(87,'Mieczyslaw','Adamczyk');
INSERT INTO studenci VALUES(88,'Wanda','Czarnecka');
INSERT INTO studenci VALUES(89,'Andrzej','Ziolkowski');
INSERT INTO studenci VALUES(90,'Jaroslaw','Laskowski');
INSERT INTO studenci VALUES(91,'Iwona','Urbanska');
INSERT INTO studenci VALUES(92,'Aneta','Jakubowska');
INSERT INTO studenci VALUES(93,'Zdzislaw','Krol');
INSERT INTO studenci VALUES(94,'Maria','Wisniewska');
INSERT INTO studenci VALUES(95,'Grzegorz','Borkowski');
INSERT INTO studenci VALUES(96,'Maria','Glowacka');
INSERT INTO studenci VALUES(97,'Jakub','Pietrzak');
INSERT INTO studenci VALUES(98,'Danuta','Piotrowska');
INSERT INTO studenci VALUES(99,'Sebastian','Chmielewski');
INSERT INTO studenci VALUES(100,'Adam','Andrzejewski');
