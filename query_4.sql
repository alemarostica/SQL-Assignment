select directorawards.award,
	directorawards.year,
	directorawards.director
from movies
	right join directorawards on movies.director = directorawards.director
where movies.gross > 1000000
	and movies.year > (
		extract(
			year
			from current_date
		) - 5
	);