--juni 2020 2021
--zad2
--Да се прикажат сите клиенти чии презимиња почнуваат на „а“ (мала 
--или голема буква) заедно со сите нивни сметки. 
--Треба да се излистаат и клиентите кои немаат сметки (ако има такви).
--Резултат: (ime, prezime, id_grad, ime_grad, embg, adresa_ziveenje, broj_smetka)
set search_path = "banka";

select c.ime, c.prezime, g.id_grad, g.ime_grad, k.embg_klient, k.adresa_ziveenje from klient as k
join chovek as c on k.embg_klient = c.embg
join grad as g on k.id_grad = g.id_grad
left join smetka as s on k.embg_klient = s.embg_klient
where c.prezime ilike 'a%';

--zad3
--Да се прикаже просечната вредност на сите трансакции извршени во 
--претходниот месец (и тековната година) во секоја валута посебно.
--Резултат: (valuta, prosecna_transakcija)
select t.valuta, avg(t.suma) as prosecna_transakcija from transakcija as t
where extract(month from t.vreme_izvrsuvanje) = extract(month from now())-1
and extract(year from t.vreme_izvrsuvanje) = extract(year from now())
group by 1;

--zad4
--Да се излистаат сите градови и бројот на клиенти во секој од нив. 
--Доколку во градот немаме клиенти да се прикаже 0.
--Резултат: (id_grad, ime_grad, broj_klienti)
select * from klient;
select g.id_grad, g.ime_grad, count(k.embg_klient) from grad g
left join klient k on g.id_grad = k.id_grad
group by 1,2;

--zad5
--Да се излистаат сите вработени, чиј шефови се вработени во филијала во Велес.
--Резултат: (embg, ime, prezime)

select c.embg, c.ime, c.prezime from vraboten v
join chovek c on v.embg = c.embg
join chovek cshef on v.embg_shef = cshef.embg
join vraboten vshef on cshef.embg = vshef.embg
join filijala f on vshef.id_filijala = f.id_filijala
join grad g on f.id_filijala = g.id_grad 
where g.ime_grad ilike 'veles';