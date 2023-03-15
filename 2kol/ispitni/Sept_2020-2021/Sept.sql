--Задача 2 (10 поени): Да се прикажат сите градови чии имиња завршуваат на „а“ заедно со 
--клиентите кои се од тој град. Треба да се излистаат и градовите во кои немаме клиенти. 
--Резултат: (id_grad, ime_grad, embg, ime, prezime, adresa_ziveenje)
set search_path = 'banka';
select g.id_grad, g.ime_grad, 
c.embg, c.ime, c.prezime, k.adresa_ziveenje from grad as g
left join klient as k on g.id_grad = k.id_grad
left join chovek as c on k.embg_klient = c.embg
where substring(g.ime_grad, char_length(g.ime_grad), 1) = 'a'

--Задача 3 (10 поени): Да се прикаже вкупната сума на сите трансакции извршени во 
--последните 180 дена, во секоја валута посебно.
--Резултат: (valuta, vkupno)

select t.valuta, sum(t.suma) as vkupno from transakcija as t
where t.vreme_izvrsuvanje between now() - interval '180 days' and now()
group by 1;

--Задача 4 (10 поени): Да се излистаат сите клиенти и бројот 
--на отворени сметки за секој од 
--нив. Доколку клиентот нема отворена сметка, да се прикаже 0.
--Резултат: (embg, ime, prezime, adresa_ziveenje, broj_smetki)
select * from smetka;
select c.embg, c.ime, c.prezime, k.adresa_ziveenje,
count(s.broj_smetka) as broj_smetki from klient as k
left join smetka as s on k.embg_klient = s.embg_klient
join chovek as c on k.embg_klient = c.embg
group by 1,2,3,4

--Задача 5 (20 поени): Да се излистаат сите шефови, 
--на вработени кои работат во филијала во Битола.
--Резултат: (embg, ime, prezime)
select * from vraboten;
select * from grad;
--select count(distinct v.embg_shef) from vraboten as v;
select c.embg, c.ime, c.prezime from vraboten as v
join chovek as c on v.embg = c.embg
join filijala as f on v.id_filijala = f.id_filijala
join grad as g on f.id_grad = g.id_grad
where v.embg_shef = c.embg and f.id_grad = 1;

select c.embg, c.ime, c.prezime from vraboten as v
join chovek as c on v.embg_shef = c.embg
join filijala as f on v.id_filijala = f.id_filijala
join grad as g on f.id_grad = g.id_grad
where f.id_grad = 1;

--neznam koe od ovie dve e tocno :)

--Задача 6 (20 поени): Да се пресмета промена на салдото на
--секоја сметка посебно, во секој месец во кој имало барем една трансакција. 
--Промена на салдото е вкупна сума на приливи минус вкупна сума на одливи
--Резултат: (broj_smetka, godina, mesec, promena)

select sum(suma) from transakcija as t

select s.broj_smetka, 
extract(year from t.vreme_izvrsuvanje) as godina,
extract(month from t.vreme_izvrsuvanje) as mesec,
from smetka as s
join transakcija as t on s.broj_smetka = t.broj_smetka_uplata


