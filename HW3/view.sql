create view most_popular_artist as
select b."name" ARTIST,a."name" SONG_NAME
from song a
join artist b on a.artist_id = b.id
where artist_id > 3 and artist_id < 5
order by ARTIST desc
with local check option;


create view favorite_album AS
select * from song
where album_id = 5
with local check option;
