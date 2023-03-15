-- 2020-2021

-- Задача 1 (10 поени): Да се излистаат сите клиенти на банката кои имаат валиден ЕМБГ (13 
-- цифри) со нивните телефонски броеви (доколку се внесени броеви).
-- Резултат: (embg, ime, prezime, adresa_ziveenje, telefonski_broj)

set search_path = "banka";

select k.embg_klient, c.ime, c.prezime, k.adresa_ziveenje, tb.telefonski_broj from klient as k
join chovek as c on k.embg_klient = c.embg
left join telefonski_broj as tb on k.embg_klient = tb.embg_klient
where char_length(k.embg_klient) = 13;

-- Задача 2 (10 поени): Да се прикаже вкупната сума на денарски трансакции извршени во 
-- банката во секој месец посебно (без година).
-- Резултат: (mesec, suma)

select extract(month from t.vreme_izvrsuvanje) as month, sum(suma) as suma from transakcija as t
where t.valuta = 'MKD'
group by 1;

-- Задача 3 (15 поени): Да се прикаже вкупниот број на шалтерски работници (работно место 
-- Shalter) во секоја филијала посебно. Доколку нема шалтерски работници во дадена филијала, 
-- да се прикаже 0.
-- Резултат: (id_filijala, adresa_filijala, ime_grad, br_shalterski_rabotnici)
select * from vraboten;

select f.id_filijala, f.adresa_filijala, g.ime_grad, 
sum(case when v.rabotno_mesto = 'Shalter' then 1 else 0 end) from vraboten as v
left join filijala as f on f.id_filijala = v.id_filijala
left join grad as g on f.id_grad = g.id_grad
group by 1,2,3;

-- Задача 4 (20 поени): Да се прикажат сите извршени трансакции во тековниот месец, заедно 
-- со име и презиме на уплаќач и име и презиме на исплатениот клиент.
-- Резултат: (embg_uplakjach, ime_uplakjach, prezime_uplakjach, embg_isplaten, ime_isplaten, 
-- prezime_isplaten, valuta, suma, vreme_transakcija)
select * from smetka;

select c.embg, c.ime, c.prezime, c_isplata.embg, c_isplata.ime, c_isplata.prezime, t.valuta, t.suma, t.vreme_izvrsuvanje
from transakcija as t
join smetka as s on t.broj_smetka_uplata = s.broj_smetka 
join klient as k on s.embg_klient = k.embg_klient
join chovek as c on k.embg_klient = c.embg
join smetka as s_isplata on t.broj_smetka_isplata = s.broj_smetka
join klient as k_isplata on s_isplata.embg_klient = k_isplata.embg_klient
join chovek as c_isplata on k_isplata.embg_klient = c_isplata.embg
where extract(month from t.vreme_izvrsuvanje) = extract(month from now())

-- Задача 5 (20 поени): За секој град да се прикаже колку филијали има во градот и колку 
-- клиенти има банката во тој град. Доколку нема клиенти да се прикаже 0. Доколку нема 
-- филијали, да се прикаже 0.
-- Резултат: (id_grad, ime_grad, broj_filijali, broj_klienti)
select * from filijala;
select * from klient;

select g.id_grad, g.ime_grad, count(f.id_filijala) as broj_filijali , count(k.id_grad) as broj_klienti from filijala as f
left join grad as g on g.id_grad = f.id_grad
left join klient as k on k.id_grad = g.id_grad
group by 1,2


