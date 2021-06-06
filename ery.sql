create database ery;
use ery
create table GeoEon ( id_eon int primary key, nazwa_eon varchar(20));
create table GeoEra (id_era int primary key, id_eon int, nazwa_era varchar(20));
create table GeoOkres (id_okres int primary key, id_era int, nazwa_okres varchar(20));
create table GeoEpoka (id_epoka int primary key, id_okres int,nazwa_epoka varchar(20));
create table GeoPietro (id_pietro int primary key, id_epoka int,nazwa_pietro varchar(20));	

alter table GeoEra add foreign key (id_eon) references GeoEon (id_eon);
alter table GeoOkres add foreign key (id_era) references GeoEra (id_era);
alter table GeoEpoka add foreign key (id_okres) references GeoOkres (id_okres);
alter table GeoPietro add foreign key (id_epoka) references GeoEpoka (id_epoka);

create index Eon_id on GeoEon(id_eon);
create index Era_id on GeoEra(id_era, id_eon);
create index Okres_id on GeoOkres(id_okres, id_era);
create index Epoka_id on GeoEpoka(id_epoka, id_okres);
create index Pietro_id on GeoPietro(id_pietro, id_epoka);
--create index Milion on Milion(liczba);
create index Tabela_id on GeoTabela(id_pietro, id_epoka, id_era, id_okres,id_eon);

insert into GeoEon values (1,'Fanerozoik');

insert into GeoEra values(1,1,'Kenozoik');
insert into GeoEra values(2,1,'Mezozoik');
insert into GeoEra values(3,1,'Paleozoik');

insert into GeoOkres values (1,1,'czwartorzęd');
insert into GeoOkres values (2,1,'trzeciorzęd-neogen');
insert into GeoOkres values (3,1,'trzeciorze-paleogen');
insert into GeoOkres values (4,2,'kreda');
insert into GeoOkres values (5,2,'jura');
insert into GeoOkres values (6,2,'trias');
insert into GeoOkres values (7,3,'Perm');
insert into GeoOkres values (8,3,'karbon');
insert into GeoOkres values (9,3,'dewon');


insert into GeoEpoka values (1,1,'holocen');
insert into GeoEpoka values (2,1,'plejstocen');
insert into GeoEpoka values (3,2,'pliocen');
insert into GeoEpoka values (4,2,'miocen');
insert into GeoEpoka values (5,3,'oligocen');
insert into GeoEpoka values (6,3,'eocen');
insert into GeoEpoka values (7,3,'paleocen');
insert into GeoEpoka values (8,4,'górna');
insert into GeoEpoka values (9,4,'dolna');
insert into GeoEpoka values (10,5,'górna');
insert into GeoEpoka values (11,5,'środkowa');
insert into GeoEpoka values (12,5,'dolna');
insert into GeoEpoka values (13,6,'górna');
insert into GeoEpoka values (14,6,'środkowa');
insert into GeoEpoka values (15,6,'dolna');
insert into GeoEpoka values (16,7,'górny');
insert into GeoEpoka values (17,7,'dolny');
insert into GeoEpoka values (18,8,'górny');
insert into GeoEpoka values (19,8,'dolny');
insert into GeoEpoka values (20,9,'górny');
insert into GeoEpoka values (21,9,'środkowy');
insert into GeoEpoka values (22,9,'dolny');


insert into GeoPietro values (1,1,'megalaj');
insert into GeoPietro values(2,1,'northgrip');
insert into GeoPietro values(3,1,'grenland');

insert into GeoPietro values(4,2,'późny[b]');
insert into GeoPietro values(5,2,'chiban');
insert into GeoPietro values(6,2,'kalabr');
insert into GeoPietro values(7,2,'gelas');

insert into GeoPietro values(8,3,'piacent');
insert into GeoPietro values(9,3,'zankl');

insert into GeoPietro values(10,4,'messyn');
insert into GeoPietro values(11,4,'torton');
insert into GeoPietro values(12,4,'serrawal');
insert into GeoPietro values(13,4,'lang');
insert into GeoPietro values(14,4,'burdygał');
insert into GeoPietro values(15,4,'akwitan');

insert into GeoPietro values(16,5,'szat');
insert into GeoPietro values(17,5,'rupel');

insert into GeoPietro values(18,6,'priabon');
insert into GeoPietro values(19,6,'barton');
insert into GeoPietro values(20,6,'lutet');
insert into GeoPietro values(21,6,'iprez');

insert into GeoPietro values(22,7,'tanet');
insert into GeoPietro values(23,7,'zeland');
insert into GeoPietro values(24,7,'dan');

insert into GeoPietro values(25,8,'mastrycht');
insert into GeoPietro values(26,8,'kampan');
insert into GeoPietro values(27,8,'santon');
insert into GeoPietro values(28,8,'koniak');
insert into GeoPietro values(29,8,'turon');
insert into GeoPietro values(30,8,'cenoman');

insert into GeoPietro values(31,9,'alb');
insert into GeoPietro values(32,9,'apt');
insert into GeoPietro values(33,9,'barrem');
insert into GeoPietro values(34,9,'hoteryw');
insert into GeoPietro values(35,9,'walanżyn');
insert into GeoPietro values(36,9,'berrias');

insert into GeoPietro values(37,10,'tyton');
insert into GeoPietro values(38,10,'kimeryd');
insert into GeoPietro values(39,10,'oksford');

insert into GeoPietro values(40,11,'kelowej');
insert into GeoPietro values(41,11,'baton');
insert into GeoPietro values(42,11,'bajos');
insert into GeoPietro values(43,11,'aalen');

insert into GeoPietro values(44,12,'toark');
insert into GeoPietro values(45,12,'pliensbach');
insert into GeoPietro values(46,12,'synemur');
insert into GeoPietro values(47,12,'hettang');

insert into GeoPietro values(48,13,'retyk');
insert into GeoPietro values(49,13,'noryk');
insert into GeoPietro values(50,13,'karnik');

insert into GeoPietro values(51,14,'ladyn');
insert into GeoPietro values(52,14,'anizyk');

insert into GeoPietro values(53,15,'olenek');
insert into GeoPietro values(54,15,'ind');

insert into GeoPietro values(55,16,'czangsing');
insert into GeoPietro values(56,16,'wucziaping');
insert into GeoPietro values(57,16,'kapitan');
insert into GeoPietro values(58,16,'word');

insert into GeoPietro values(59,17,'road');
insert into GeoPietro values(60,17,'kungur');
insert into GeoPietro values(61,17,'artinsk');
insert into GeoPietro values(62,17,'sakmar');
insert into GeoPietro values(63,17,'assel');

insert into GeoPietro values(64,18,'gżel');
insert into GeoPietro values(65,18,'kasimow');
insert into GeoPietro values(66,18,'moskow');
insert into GeoPietro values(67,18,'baszkir');

insert into GeoPietro values(68,19,'serpuchow');
insert into GeoPietro values(69,19,'wizen');
insert into GeoPietro values(70,19,'turnej');

insert into GeoPietro values(71,20,'famen');
insert into GeoPietro values(72,20,'fran');

insert into GeoPietro values(73,21,'żywet');
insert into GeoPietro values(74,21,'eifel');

insert into GeoPietro values(75,22,'ems');
insert into GeoPietro values(76,22,'prag');
insert into GeoPietro values(77,22,'lochkow');

insert into GeoPietro values(78,,'przydol');
insert into GeoPietro values(79,,'ludford');
insert into GeoPietro values(80,,'gorst');
insert into GeoPietro values(81,,'homer');
insert into GeoPietro values(82,,'szejnwud');
insert into GeoPietro values(83,,'telicz');
insert into GeoPietro values(84,,'aeron');
insert into GeoPietro values(85,,'ruddan');
insert into GeoPietro values(86,,'hirnant');
insert into GeoPietro values(87,,'kat');
insert into GeoPietro values(88,,'sandb');
insert into GeoPietro values(89,,'darriwil');
insert into GeoPietro values(90,,'daping');
insert into GeoPietro values(91,,'flo');
insert into GeoPietro values(92,,'tremadok');
insert into GeoPietro values(93,,'piętro');
insert into GeoPietro values(94,,'dziangszan');
insert into GeoPietro values(95,,'paib');
insert into GeoPietro values(96,,'gużang');
insert into GeoPietro values(97,,'drum');
insert into GeoPietro values(98,,'wuliuan');
insert into GeoPietro values(99,,'piętro');
insert into GeoPietro values(100,,'piętro');
insert into GeoPietro values(101,,'piętro');
insert into GeoPietro values(102,,'fortun');
insert into GeoPietro values(103,,'ediakar');
insert into GeoPietro values(104,,'kriogen');
insert into GeoPietro values(105,,'ton');
insert into GeoPietro values(106,,'sten');
insert into GeoPietro values(107,,'ektas');
insert into GeoPietro values(108,,'kalim');
insert into GeoPietro values(109,,'stater');
insert into GeoPietro values(110,,'orosir');
insert into GeoPietro values(111,,'riak');
insert into GeoPietro values(112,,'sider');
insert into GeoPietro values(113,,'neoarchaik');
insert into GeoPietro values(114,,'mezoarchaik');
insert into GeoPietro values(115,,'paleoarchaik');
insert into GeoPietro values(116,,'eoarchaik');
insert into GeoPietro values(117,,'hadeik');

Create table Dziesiec (cyfra int, bit int);
insert into Dziesiec values (0,1);
insert into Dziesiec values (1,1);
insert into Dziesiec values (2,1);
insert into Dziesiec values (3,1);
insert into Dziesiec values (4,1);
insert into Dziesiec values (5,1);
insert into Dziesiec values (6,1);
insert into Dziesiec values (7,1);
insert into Dziesiec values (8,1);
insert into Dziesiec values (9,1);

CREATE TABLE Milion(liczba int,cyfra int, bit int);
INSERT INTO Milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra
+ 10000*a5.cyfra + 10000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec
a6 ;

CREATE TABLE GeoTabela AS (SELECT * FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL
JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon );

-- ms SQL
select GeoPietro.id_pietro,GeoPietro.nazwa_pietro,
GeoEpoka.id_epoka,GeoEpoka.nazwa_epoka,
GeoOkres.id_okres,GeoOkres.nazwa_okres,
GeoEra.id_era,GeoEra.nazwa_era,
GeoEon.id_eon,GeoEon.nazwa_eon
into GeoTabela from GeoEon inner join GeoEra on GeoEon.id_eon=GeoEra.id_eon
inner join GeoOkres on GeoEra.id_era=GeoOkres.id_era
inner join GeoEpoka on GeoOkres.id_okres=GeoEpoka.id_okres
inner join GeoPietro on GeoEpoka.id_epoka=GeoPietro.id_epoka;

select*from GeoEon;
select*from GeoEra;
select*from GeoOkres;
select*from GeoEpoka;
select*from GeoPietro;
select*from GeoTabela;

--dwie wersje kodu, ponieważ te z pdf nie odpalały w  MySQL
--1
  SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON (mod(Milion.liczba,68)=(GeoTabela.id_pietro));

 select COUNT(*) from Milion INNER JOIN GeoTabela on Milion.liczba%68 = GeoTabela.id_pietro;
--2
 SELECT COUNT(*) FROM Milion INNER JOIN GeoPietro ON (mod(Milion.liczba,68)=GeoPietro.id_pietro) 
NATURAL JOIN GeoEpoka NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon;

select COUNT(*) from Milion inner join GeoPietro on
(Milion.liczba%68=GeoPietro.id_pietro)
inner join GeoEpoka on GeoPietro.id_epoka =GeoEpoka.id_epoka
inner join GeoOkres on GeoEpoka.id_okres = GeoOkres.id_okres
inner join GeoEra on GeoEra.id_era = GeoOkres.id_era
inner join GeoEon on GeoEon.id_eon = GeoEra.id_eon;

--3
 SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,68)=
(SELECT id_pietro FROM GeoTabela WHERE mod(Milion.liczba,68)=(id_pietro));

select COUNT(*) from Milion where Milion.liczba%68 = 
(select id_pietro from GeoTabela where Milion.liczba%68=id_pietro);
--4
 SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,68)=
(SELECT GeoPietro.id_pietro FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL JOIN GeoOkres 
 NATURAL JOIN GeoEra NATURAL JOIN GeoEon);

 select COUNT(*) from Milion where Milion.liczba%68 in
(select id_pietro from GeoPietro 
inner join GeoEpoka on GeoPietro.id_epoka = GeoEpoka.id_epoka 
inner join GeoOkres on GeoEpoka.id_okres = GeoOkres.id_okres
inner join GeoEra on GeoEra.id_era = GeoOkres.id_era
inner join GeoEon on GeoEon.id_eon = GeoEra.id_eon);













