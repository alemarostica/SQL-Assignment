--Adesso trova solo il numero massimo ma non riesco a restituire il nomde del film DIOPORCO
select max(m.count)
from (select movieawards.title as name, count(movieawards.award)
		from movieawards
		where award like 'Oscar%' and result = 'won'
		group by title) as m, movieawards