--Juni 2021-2022

--zadaca 2
set search_path = "bolnica";

select k.id_klinika, k.ime_klinika, k.ulica, k.broj,
o.id_oddel, o.ime_oddel, tb.telefonski_broj from klinika as k
left join oddel as o on k.id_klinika = o.id_klinika
left join telefonski_broj as tb on k.id_klinika = tb.id_klinika;

--zadaca 3
select extract(year from u.termin), count(u.id_pregled) as broj_odrzani
from upat as u
where extract(month from u.termin) = 11
group by 1;

--zadaca 4
select l.embg, l.broj_faksimil, c.ime, c.prezime, s.id_specijalnost, s.naziv_specijalnost from lekar as l
left join specijalnost as s on l.id_specijalnost = s.id_specijalnost
join chovek as c on l.embg = c.embg
where s.id_specijalnost = 2 or s.id_specijalnost isnull;

--zadaca 5
select * from chovek as c; -- 0108001

select d.mkb10, d.opis, p.datum_pregled, substring(cp2.embg, 6, 2) as godina_raganje,
l.embg, cl.ime, cl.prezime, s.id_specijalnost, s.naziv_specijalnost from dijagnoza as d
join dijagnosticira as d2 on d2.mkb10 = d.mkb10
join pregled as p on d2.id_pregled = p.id_pregled
join pacient as p2 on p.embg_pacient = p2.embg
join chovek as cp2 on p2.embg = cp2.embg
join lekar as l on p.embg_lekar = l.embg
join chovek as cl on l.embg = cl.embg
left join specijalnost as s on l.id_specijalnost = s.id_specijalnost








