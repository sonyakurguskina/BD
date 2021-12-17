select name from artist where name like 'Bee%';  
-- select * from artist;

select artist.name, count(song.artist_id) as count_song_by_artist 
from song
join artist on artist.id = song.artist_id
group by artist.name
order by count_song_by_artist desc;


select album_id, name from song where album_id >=4

select album.id, song.name as song_name, album.name as album_name
from song
join album on album.id = song.album_id
order by album_id
limit 4
