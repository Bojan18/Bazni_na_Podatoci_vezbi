--Задача 1 (10 поени): Креирај ги табелите според следниве спецификации:
--Табела: produkti
--Колони:
--id- целобројна, примарен клуч
--ime- текстуална, без нул вредности
--Табела: naracka
--Колони:
--id, целобројна, примарен клуч
--vreme: време и датум
--id_produkt: надворешен клуч кон табелата produkti, без нул вредности

create table produkti_a(
	id integer primary key,
	ime varchar(100) not null
)

select * from naracka_1

create table naracka_a(
	id integer primary key,
	vreme timestamp not null,
	id_produkt integer,
	constraint fk_naracka_a_produkti_a foreign key (id_produkt) references produkti_a(id)
)

--Задача 2 (10 поени): Вметни ги дадените редици во табелата apteki:
--id: 10
--ime: nova apteka
--adresa: partizanski odredi bb
--telefon: 02 5555 777
--grad_id: 1

--id: 11
--ime: apteka1
--adresa: ilindenska 53
--telefon: 070 555 777
--grad_id: 5

--И следниве редици во табелата gradovi:
--grad_id: 3
--ime: Ohrid
--grad_id: 5
--ime: Bitola

select * from apteki

insert into apteki (id_apteki, ime_apteki, adresa_apteki, telefonski_br_apteki, id_grad, sashko, sashko2)
	values(10100, 'nova apteka', 'partizanski odredi bb', '02 5555 777', 1 ,1 ,1),
	(20200, 'nova aptekaaaa', 'ilindenska 53', '070 555 777', 5 ,1 ,1)
	
	
select * from apteki.gradovi
	
insert into apteki.gradovi (id_grad, ime_grad)
	values(3, 'Ohrid'),(5, 'Skopje')
--ne rabote oti neam permission	
	
	
--Задача 3 (10 поени): Во табелата lekovi, сетирај го 
--полето za_naracka во true за сите лекови 
--кај кои количината е помала од 15 и цената е помала или еднаква од 500, 
--и кај лековите кај 
--кои цената е над 500 и количината е помала или еднаква од 15
	
select * from lekovi;
	
select * from lekovi
	update lekovi set za_naracka=false where (kolicina < 15 and cena <= 500)
	and (cena > 500 and kolicina <= 15)
	
select * from lekovi
	where za_naracka = false
	
	
--Задача 4 (10 поени): Излистај ги имињата и ATC кодовите (name, atc_code)
--на сите лекови 
--кои во името или во описот го содржат зборот “icin”. 
--Напомена: треба да се излистаат сите icin”. 
--Напомена: треба да се излистаат сите 
--редици каде има појавување на зборот, во името или во описот,
--на кирилица или латиница, со
--мали или големи букви
	
select ime,atc from lekovi where
	(ime ilike '%icin%' or opis ilike '%ицин%') or
	(ime ilike '%ICIN%' or opis ilike '%ИЦИН%')

	
--Задача 5 (10 поени): Од табелата prodazba_lekovi,
--излистај ги сите лекови (*) кои се 
--продадени по 20-тиот ден во месецот (било кој месец), пред 11:00 часот.
	
select * from prodazba_lekovi where
	extract (day from vreme_prodazba) > 20 and
	extract (hour from vreme_prodazba) < 11
	
	
--Zadaca 6
create table Specijalizacija_a(
	id integer primary key,
	naziv varchar(100) not null
)

create table Klinika_a(
	id integer primary key,
	ime varchar(100) not null
)

select * from Klinika_a

create table Telefonski_broj_a(
	id integer,
	telefonski_broj varchar(100),
	constraint pk_broj_klinika primary key (id, telefonski_broj),
	constraint fk_broj_klinika foreign key (id) references Klinika_a(id)
)

create table Doktor_a(
	faksimil integer primary key,
	ime varchar(100) not null
)
	
create table raboti_vo_a(
	id integer not null,
	faksimil integer not null,
	constraint pk_doktor_raboti_vo_klinika_a primary key (id,faksimil),
	constraint fk_doktor foreign key (faksimil) references Doktor_a(faksimil),
	constraint fk_klinika foreign key (id) references Klinika_a(id)
)
	
	
	