with cte AS(
 select name,
  (case
   when artist_id =1
    then 'Michael Jackson'
   else 'others'
 	end) artist_name
from song)

select name,artist_name
from cte


with cte1 AS(
 update song set name = 'favorite song' 
  where album_id = 5
	returning *
)

select * from cte1;