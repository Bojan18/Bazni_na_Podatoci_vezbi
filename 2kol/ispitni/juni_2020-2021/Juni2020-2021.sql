--Задача 2 (10 поени): Да се прикажат сите градови чии имиња завршуваат на „а“ заедно со 
--клиентите кои се од тој град. Треба да се излистаат и градовите во кои немаме клиенти. 
--Резултат: (id_grad, ime_grad, embg, ime, prezime, adresa_ziveenje)

set search_path = "banka";
select * from grad;

select g.id_grad, g.ime_grad, c.embg, c.ime, c.prezime, k.adresa_ziveenje from grad as g
left join klient as k on g.id_grad = k.id_grad
left join chovek as c on k.embg_klient = c.embg
where substring(ime_grad, character_length(ime_grad) ,1) = 'a'

--Задача 3 (10 поени): Да се прикаже просечната вредност на 
--сите трансакции извршени во 
--претходниот месец (и тековната година) во секоја валута посебно.
--Резултат: (valuta, prosecna_transakcija)
select * from transakcija;
select t.valuta, avg(t.suma)  from transakcija as t
where extract(month from t.vreme_izvrsuvanje) = extract(month from now()) -- -1
and extract (year from t.vreme_izvrsuvanje) = extract(year from now())
group by 1;

--Задача 4 (10 поени): Да се излистаат сите градови 
--и бројот на клиенти во секој од нив. 
--Доколку во градот немаме клиенти да се прикаже 0.
--Резултат: (id_grad, ime_grad, broj_klienti)
select g.id_grad, g.ime_grad, count(k.embg_klient) from grad as g
left join klient as k on g.id_grad = k.id_grad
group by 1,2;

--Задача 5 (20 поени): Да се излистаат сите вработени, 
--чиј шефови се вработени во филијала 
--во Велес.
--Резултат: (embg, ime, prezime)
select * from vraboten;
select c.embg, c.ime, c.prezime, g.ime_grad from vraboten as v
join filijala as f on v.id_filijala = f.id_filijala
join grad as g on f.id_grad = g.id_grad
join chovek as c on v.embg = c.embg
--join chovek as cshef on v.embg_shef = cshef.embg
--dont know sea so :()





