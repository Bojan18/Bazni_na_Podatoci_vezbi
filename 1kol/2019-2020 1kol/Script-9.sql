create table produkti_b(
	id integer primary key,
	ime varchar(100) not null
)

create table naracka_b(
	id integer primary key,
	vreme timestamp,
	id_produkt integer not null,
	constraint fk_naracka_produkti_b foreign key (id_produkt) references produkti(id)
)

select * from apteki

insert into apteki
	values(100000, 'a', 'po', '02 5555 777', 1),
	(200000, 'a', 'po', '02 5555 777', 1)
	
insert into gradovi values(30000, 'Ohrid'), (5000000, 'Bitola')

--Задача 3 (10 поени): Во табелата lekovi, 
--сетирај го полето za_naracka во true за сите лекови 
--кај кои количината е помала од 15 
--и цената е помала или еднаква од 500, и кај лековите кај 
--кои цената е над 500 и количината е помала или еднаква од 15

select * from lekovi

update lekovi
	set za_naracka = true where 
	(kolicina < 15 and cena <= 500) or
	(cena > 500 and kolicina <= 15)

--Задача 4 (10 поени): Излистај ги имињата и ATC кодовите (name, atc_code) на сите лекови 
--кои во името или во описот го содржат зборот “icin”. 
--Напомена: треба да се излистаат сите icin”. Напомена: треба да се излистаат сите 
--редици каде има појавување на зборот, во името или во описот, на кирилица или латиница,со
--мали или големи букви.

select * from lekovi

select ime, atc from lekovi where
	(ime ilike '%icin%' or ime ilike '%ICIN%' or ime ilike '%ицин%' or ime ilike '%ИЦИН%')
	or (opis ilike '%icin%' or opis ilike '%ICIN%' or opis ilike '%ицин%' or opis ilike '%ИЦИН%')

--Задача 5 (10 поени): Од табелата prodazba_lekovi, излистај ги сите лекови (*) кои се 
--продадени по 20-тиот ден во месецот (било кој месец), пред 11:00 часот.

select * from prodazba_lekovi where 
	extract (day from vreme_prodazba) > 20
	and extract (hour from vreme_prodazba) < 11
	
--Zadaca 6
create table specijalizacija_b(
	id integer primary key,
	naziv varchar(100) not null
)

create table doktor_b(
	faksimil integer primary key,
	ime varchar(50) not null,
	id integer not null,
	constraint fk_doktor_spec_b foreign key (id) references specijalizacija_b(id)
)

--telefonski_broj (id*(Klinika), telefonski_broj)
create table telefonski_broj_b(
	telefonski_broj varchar(30) not null,
	id integer not null,
	constraint pk_telefonski_broj_b primary key (telefonski_broj, id),
)

alter table telefonski_broj_b
	add 
	constraint fk_spec foreign key (id) references specijalizacija_b(id)

create table klinika_b(
	id integer primary key,
	ime varchar(50) not null
)

select * from klinika_b

create table raboti_vo_b(
	id integer not null,
	faksimil integer not null,
	constraint pk_raboti_vo_b primary key (id, faksimil),
	constraint fk_raboti_vo_klinika foreign key (id) references klinika_b(id),
	constraint fk_doktor_raboti_vo foreign key (faksimil) references doktor_b(faksimil)
)

--Задача 7 (25 поени): Од табелата prodazba_lekovi, најди ја вкупната количина на продадени 
--лекови по ден од неделата и месец за секоја аптека, за лековите кај кои првите две букви од 
--ATC кодот се B1. Притоа, треба да се прикажат само записите кога имало вкупна продажба од
--најмалку 100 денари. Колони кои треба да фигурират во излезот: apteka_ime, den, mesec, 
--vkupna_prodazba, broj_na_prodadeni_lekovi.
--Резултатите треба да се подредат по име на аптека во опаѓачки редослед

select * from prodazba_lekovi





