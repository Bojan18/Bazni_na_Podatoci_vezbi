create table produkti_1(
	id int primary key,
	ime varchar(20) not null
)

create table naracka_1(
	id int primary key,
	vreme timestamp not null,
	id_produkt integer not null,
	constraint fk_naracka_produkt foreign key (id_produkt) references produkti_1 (id) 
)

select * from apteki

insert into apteki(id_apteki,ime_apteki,adresa_apteki,telefonski_br_apteki,id_grad)
values(1000,'nova apteka','ilindenska bb','02 3333 222',6)

insert into apteki(id_apteki,ime_apteki,adresa_apteki,telefonski_br_apteki,id_grad)
values(2000,'stara apteka','ilindenska aa','02 7777 323',9)

insert into gradovi(grad_id,ime)
values(33,'Ohrid')

insert into gradovi(grad_id,ime)
values(55,'Bitola')

select * from lekovi

select id,kolicina, cena, za_naracka from lekovi
update lekovi set za_naracka=true where (kolicina < 15 and cena <= 5)
--select kolicina, cena, za_naracka from lekovi

select * from lekovi

insert into lekovi(id, ime, atc, generik, opis, kolicina, cena, za_naracka)
values(10100,'lekce', 'lekicin', 'oricin', 'opis', 5, 500, true)

select ime, atc from lekovi
	where (ime ilike '%icin%' or ime ilike '%ицин%') or (atc ilike '%icin%' or atc ilike '%ицин%');
	

select * from prodazba_lekovi

insert into prodazba_lekovi(id, ime, atc, apteka_ime, cena, vreme_prodazba)
values(11111,'lekce', 'lekicin', 'aptekaIme', 500, '2019-11-22 11:00:00.000')

select id, vreme_prodazba from prodazba_lekovi
	where extract (day from vreme_prodazba) > 20 and extract (hour from vreme_prodazba) <= 11


