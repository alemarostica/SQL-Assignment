select distinct directors.director,
	coalesce(min(movies.gross - movies.budget), -1),
	coalesce(max(movies.gross - movies.budget), -1),
	trunc(coalesce(avg(movies.gross), -1), 2)
from directors
	left join movies on directors.director = movies.director
where directors.yearofbirth < (
		extract(
			year
			from current_date
		) - 50
	)
group by directors.director
order by 4 asc
