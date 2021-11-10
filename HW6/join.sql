-- inner join соединение названия песни с именем продюсера
select song.name, producer.name, producer.lastname
from song
join producer on producer.id = song.producer_id;

-- left join соединение названия песни с названием альбома
select song.name, album.name
from song 
left join album on album.id = song.album_id; 

-- right join соединение названия песни с именем исполнителя, айди которого больше 3.
-- данные отсортированы по айди продюсера
select song.name, artist.name
from song 
right join artist on song.artist_id = artist.id
where artist.id > 3
order by song.producer_id;

-- full join объединение по названию песни, альбому и исполнителю
select song.name, album.name, artist.name
from song
full join album on album.id = song.album_id
full join artist on artist.id = song.artist_id;

-- cross соединение всех песен со всеми исполнителями перекрестно
select * 
from song
cross join artist;

-- natural вывод всех данных по одинакову айди(=5) из таблиц song и artist
select *
from song 
natural join artist
where song.id = 5;

-- self объединение по названию песни и айди исполнителя
select a.name, b.artist_id 
from song a
join song b on b.id = a.artist_id;

-- anti выведены все названия альбомов, не встрчающихся в таблице song в единичном экземпляре
select * 
from
song
where not exists(select 1
				from album
				where album.id = song.album_id);
				
-- semi выведены все артисты, встречающиеся в таблице song в единичном экземпляре 
select * 
from artist
where exists(select 1 
			 from song
			where song.artist_id = id);
