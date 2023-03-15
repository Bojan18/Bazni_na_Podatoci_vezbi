--Задача 1 (8 поени): Креирај ги табелите според следниве спецификации 
--(се извршува на schema ispitna):
--proizvod(id_proizvod, ime_proizvod, opis)
--naracka(id_naracka, vreme_naracka, status_naracka) 
--(статус на нарачка е текст со произволна големина)
--naracan_proizvod(id_proizvod*(proizvod), id_naracka*(naracka), kolicina

create table proizvod_d(
	id_proizvod integer primary key,
	ime_proizvod varchar(100) not null,
	opis varchar(100)
)

create table naracka_d(
	id_naracka integer primary key,
	vreme_naracka timestamp not null,
	status_naracka varchar(100)
)

insert into naracka_d(id_naracka, vreme_naracka, status_naracka)
	values(1, '2020-1-2', 'no'),
	(2,'2019-12-22', 'cekanje')

create table naracan_proizvod_d(
	id_proizvod integer not null,
	id_naracka integer not null,
	kolicina integer not null,
	constraint pk_naracan_proizvod_d primary key (id_proizvod, id_naracka),
	constraint fk_proizvod foreign key (id_proizvod) references proizvod_d(id_proizvod),
	constraint fk_naracka foreign key (id_naracka) references naracka_d(id_naracka)
)

--Задача 3 (7 поени): Во табелата proizvod,
--дополнително додај колона cena од тип integer која 
--нема да дозволува null вредности.

select * from proizvod_d

alter table proizvod_d
	add column cena_1 integer not null

--Задача 4 (10 поени): Во табелата naracka, 
--сетирај ги статусите на сите нарачки како kompletirana

select * from naracka_d

update naracka_d set status_naracka = 'kompletirana'


--Задача 5 (10 поени): Излистај ги сите луѓе (*) 
--на кои презимето им завршува на „ски“ или „ска“ 
--(кирилица или латиница) и се родени во 1995 година.

select * from lugje
--150899942009
--12 08 999 //1999 godina
--1010990490015
--10 10 990 //1990 godina

select * from lugje where
	substring(embg from 5 for 3) in ('995')
	and (prezime ilike '%ska') or (prezime ilike '%ска') or (prezime ilike '%ски') or (prezime ilike '%ski')

--Задача 6 (10 поени): Од табелата прегледи 
--излистајте ги сите прегледи кои се направени во 
--месец Октомври во тековната година

select * from pregled where 
	extract (month from datum_pregled) = 10
	and extract (year from datum_pregled) = extract(year from now())
	
--Задача 7 (25+10 поени):
--б) (10) Во секоја табела вметни по 3 произволни редици
	

	
create table proizvod_dd(
	id_proizvod integer primary key,
	ime varchar(100) not null,
	opis varchar(100) not null
)
	
select * from proizvod_dd

insert into proizvod_dd
	values(1,'ime1','opis1'),(2,'ime2','opis2'),(3,'ime3','opis3')

create table cena_d(
	vazi_od date primary key,
	vazi_do date not null,
	vrednost integer not null,
	id_proizvod integer not null,
	constraint fk_cena_proizvod foreign key (id_proizvod) references proizvod_dd(id_proizvod)
)
	
select * from cena_d

insert into cena_d
	values('2022-10-2', '2023-10-2', 200, 1),
	('2022-6-6', '2023-6-6', 500, 2),
	('2022-7-12', '2023-7-12', 2000, 3)
	
create table klient_d(
	id_klient integer primary key,
	ime varchar(100) not null
)

select * from klient_d

insert into klient_d
	values(100, 'josh'),
	(200,'simon')

insert into klient_d values(300,'yes')

create table prodazba_d(
	id_klient integer not null,
	id_proizvod integer not null,
	kolicina integer not null,
	datum_prodazba date not null,
	constraint pk_prodazba_d primary key(id_klient, id_proizvod),
	constraint fk_prodazba_klient foreign key (id_klient) references klient_d(id_klient),
	constraint fk_prodazba_proizvod foreign key (id_proizvod) references proizvod_dd(id_proizvod)
)

select * from prodazba_d

insert into prodazba_d
	values(100, 1, 20, '2022-11-20'),
	(200, 2, 10, '2022-7-2'),
	(300, 3, 40, '2022-2-4')

--Задача 8 (15 поени): Од табелата преглед, најди ги сите прегледи извршени во тековниот 
--месец од минатата година, направени помеѓу 9:00 и 15:00 часот, кои не направени во 
--клиника. Внимавајте- тековен месец не значи фиксно ноември

select * from pregled where 
	extract (month from datum_pregled) = extract( month from now())
	and extract (year from datum_pregled) = extract(year from now())-1
	and datum_pregled::time between '09:00' and '15:00'






