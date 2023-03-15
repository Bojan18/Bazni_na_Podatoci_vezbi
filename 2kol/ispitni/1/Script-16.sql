-- 2021/2022
-- 1. Задача 1 (10 поени): Да се прикажат сите клиники кои во името содржат „medika“ заедно со 
-- нивните вработени лекари (доколку ги има) и специјалностите на лекарите (доколку ги има).
-- Резултат: (id_klinika, ime_klinika, ulica, broj, embg_lekar, ime_lekar, prezime_lekar, 
-- naziv_specijalnost_lekar)

set search_path = "bolnica";
-- (id_klinika, ime_klinika, ulica, broj, embg_lekar, ime_lekar, prezime_lekar, 
-- naziv_specijalnost_lekar)

select k.id_klinika, k.ime_klinika, k.ulica, k.broj, l.embg, c.ime, c.prezime, s.naziv_specijalnost from klinika as k
join lekar_vraboten_klinika as lvk on k.id_klinika = lvk.id_klinika
join lekar as l on lvk.embg_lekar = l.embg
join chovek as c on c.embg = l.embg
join specijalnost as s on l.id_specijalnost = s.id_specijalnost
where k.ime_klinika ilike '%medika%';

-- Задача 2 (10 поени): Да се прикаже вкупниот број на упати закажани и одржани секој месец и година.
-- Резултат: (mesec, godina, broj_zakazani, broj_odrzani)

select * from upat;
select extract(month from u.termin) as mesec, 
extract(year from u.termin) as godina, 
count(u.id_upat) as broj_zakazani, 
count(u.id_pregled) as broj_odrzani from upat as u
group by 1,2;

-- Задача 3 (15 поени): Да се прикаже кај секој пациент која дијагноза колку пати ја има 
-- дијагностицирано. Да се прикажат и пациентите кај кои нема ниту една дијагноза.
-- Резултат: (embg_pacient, ime_pacient, prezime_pacient, mkb10, opis_dijagnoza, broj_dijagnozi)

select * from pacient; -- embg
select * from pregled;
select * from dijagnoza; -- mkb10, opis
select * from chovek; -- ime, prezime
select * from dijagnosticira;
-- broj dijagonozi nz od deka ???, i guess od dijagnosticira oti ima poveke pregledi???

--select * from pacient as p
--join chovek as c on p.embg = c.embg
--join dijagnoza as d on 

--left join koristam bc Да се прикажат и пациентите кај кои нема ниту една дијагноза. valjda sam u pravo

select p.embg_pacient, c.ime, c.prezime, d.mkb10, d2.opis, count(d.mkb10) from pregled as p
left join pacient as p2 on p.embg_pacient = p2.embg
left join chovek as c on p2.embg = c.embg
left join dijagnosticira as d on p.id_pregled = d.id_pregled
left join dijagnoza as d2 on d.mkb10 = d2.mkb10
group by 1,2,3,4,5


-- Задача 4 (20 поени): Да се прикажат сите упати закажани следниот месец заедно со нивните 
-- детали (доколку ги има) во овој формат:
-- Резултат: (embg_pacient, termin, ime_pacient, prezime_pacient,
-- ime_lekar_upatuva, prezime_lekar_upatuva, ime_lekar_upaten, prezime_lekar_upaten, 
-- naziv_specijalnost_lekar_upaten, ime_klinika, ime_oddel)

select * from upat; --termin, ime_lekar_upatuva, prezime_lekar_upatuva
select * from chovek;
select * from specijalnost;
select * from lekar;
select * from klinika;

select p.embg, u.termin, cp.ime, cp.prezime, clu.ime, clu.prezime,clupaten.ime, clupaten.prezime, s.naziv_specijalnost, k.ime_klinika, o.ime_oddel from upat as u
join pacient as p on u.embg_pacient = p.embg
join chovek as cp on p.embg = cp.embg
join lekar as l on u.embg_lekar_upatuva = l.embg
join chovek as clu on clu.embg = l.embg
join lekar as l2 on u.embg_lekar_upaten = l.embg
join chovek as clupaten on clupaten.embg = l2.embg
join specijalnost as s on l2.id_specijalnost = s.id_specijalnost
join klinika as k on u.id_klinika = k.id_klinika
join oddel as o on u.id_oddel = o.id_oddel
where extract (month from u.termin) = extract(month from now()) + 1


-- Задача 5 (20 поени): За секој лекар да се најде колку прегледи извршил, колку упати биле 
-- креирани за него, колку од тие упати биле реализирани, колку вкупно дијагнози поставил и 
-- колку различни дијагнози биле поставени од него.
-- Резултат: (embg_lekar, ime_lekar, prezime_lekar, broj_pregledi, broj_kreirani_upati, 
-- broj_realizirani_upati, broj_dijagnozi, broj_razlicni_dijagnozi)

select * from lekar;
select * from pregled;
select * from upat;
select * from dijagnoza;

select l.embg, c.ime, c.prezime, 
count(p.id_pregled) as broj_pregledi, 
count(u.id_pregled) as broj_realizirani_upati, 
count(d2.mkb10) as broj_dijagnozi,
count(distinct d2.mkb10) as broj_dijagnozi_ralicni from lekar as l
join chovek as c on l.embg = c.embg
join pregled as p on l.embg = p.embg_lekar
join upat as u on l.embg = u.embg_lekar_upatuva
join dijagnosticira d on p.id_pregled = d.id_pregled
join dijagnoza d2 on d.mkb10 = d2.mkb10
group by 1,2,3


-- Задача 6 (25 поени): На шемата банка: да се прикаже месечниот промет на секоја сметка во 
-- секој месец и година во која има извршено трансакции, по секоја валута на трансакција
-- Резултат: (mesec, godina, valuta, promet)

set search_path = "banka";
select * from transakcija;
select * from smetka;

select extract(month from t.vreme_izvrsuvanje) as mesec, extract(year from t.vreme_izvrsuvanje) as godina, t.valuta from transakcija as t;



