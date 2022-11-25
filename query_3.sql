select movies.title, movies.gross - movies.budget as gross, movies.budget,
case when
movies.budget = (select min(movies.budget) from movies) then 'least expensive'
else 'most profitable'
end as feature
from movies
where (select max(movies.gross - movies.budget) from movies) = movies.gross - movies.budget
or (select min(movies.budget) from movies) = movies.budget