--2018-2019

--z1
set search_path = "banka";

select g.ime_grad, k.embg_klient, c.ime, c.prezime, k.adresa_ziveenje, tb.telefonski_broj from klient k
join chovek as c on k.embg_klient = c.embg
left join telefonski_broj as tb on k.embg_klient = tb.embg_klient
join grad as g on k.id_grad = g.id_grad
where g.ime_grad ilike 'Skopje' or g.ime_grad ilike 'Ohrid'

--z2
select * from transakcija;
select extract(year from t.vreme_izvrsuvanje), sum(t.suma) from transakcija as t
where t.valuta = 'USD' or t.valuta = 'EUR'
group by 1;

--z3
select s.broj_smetka, count(s.broj_smetka) as suma from transakcija as t
left join smetka as s on t.broj_smetka_uplata = s.broj_smetka
where s.valuta = 'MKD'
group by 1;

--z4
select v.embg, c.ime, c.prezime, f.id_filijala, f.adresa_filijala,
gf.ime_grad, cshef.embg, cshef.ime, cshef.prezime from vraboten as v
join chovek as c on v.embg = c.embg
join filijala as f on v.id_filijala = f.id_filijala
join grad as gf on f.id_grad = gf.id_grad
join chovek as cshef on v.embg_shef = cshef.embg


--z5
select * from vraboten;
select cshef.embg, cshef.ime, cshef.prezime, count(id_dogovor) from vraboten as v
join chovek as cshef on v.embg_shef = cshef.embg
group by 1,2,3








