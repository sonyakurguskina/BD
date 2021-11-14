create materialized view if not exists song_list 
    as 
	select 
	name from song
	where artist_id < 7
	with data;
	
create materialized view if not exists label_participant 
    as 
	select 
	participant from label
	with data;
	
	