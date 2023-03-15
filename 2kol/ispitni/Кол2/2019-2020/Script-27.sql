--2019-2020

--1. (10) За секој град да се најде колку аптеки има. 
--Доколку во градот нема аптеки, да се 
--прикаже нула. Резултатна табела: 
--(id_grad, grad_ime, broj_apteki)id_grad, grad_ime, broj_apteki)
set search_path = "apteki";

select g.id_grad, g.ime_grad, count(a.id_apteka) from apteki as a
right join gradovi as g on a.id_grad = g.id_grad
group by 1,2;

--2. (15) Да се излистаат сите сметки со кои има продадено лек чиј 
--АТЦ код започнува со А02. 
--Резултатна табела: (id_smetka)
select * from lekovi;
select s.id_smetka from smetki as s
join prodazba as p on s.id_smetka = p.id_smetka
join lekovi as l on p.id_lek = l.id_lek
where l.atc ilike 'A02%'

--3. (20) Да се најдат сите пациенти кои купиле најмалку 
--10 лекови од аптека лоцирана во 
--Скопје или Штип. Притоа да не се користи поврзување со табелата „градови“, а да се 
--употреби вгнезден прашалник (nested query).
--Резултатна табела: (id_pacient, ime_pacient)

select p.id_pacient, p.ime from pacienti as p
join recepti as r on p.id_pacient = r.id_pacient
join prodazba as p2 on r.id_recept = p2.id_recept

















