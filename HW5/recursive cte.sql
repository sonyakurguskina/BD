create table graph(
	from_vertex varchar(5) not null,
	to_vertex varchar(5) not null, 
	path int not null
);

insert into graph
values('s','u',3),
('s','x',5),
('u','v',6),
('u','x',2),
('x','u',1),
('x','y',6),
('x','v',4),
('y','s',3),
('y','v',7),
('v','y',2);

select * from graph
drop table graph

-- все пути из вершины s в y 
with recursive path_cte (to_vertex2, steps, distance, way)
   as 
   (select distinct from_vertex, 0, 0, 's'
   from graph
   where from_vertex='s'
   union all
   select arrival.to_vertex,
	      departure.steps + 1,
	      departure.distance + arrival.path,
	      departure.way || ',' || arrival.to_vertex
	      from graph as arrival
		    join path_cte as departure on departure.to_vertex2 = arrival.from_vertex)
select * from path_cte where to_vertex2 = 'y';		

-- кратчайший путь из s в y и его стоимость
with recursive path_cte(to_vertex2,steps,distance,way)
   as
   (select distinct from_vertex,0,0,'s'
   from graph
   where from_vertex='s'
   union all
   select arrival.to_vertex,
      departure.steps + 1,
      departure.distance + arrival.path,
      departure.way || ',' || arrival.to_vertex
   from graph as arrival
        join path_cte as departure
              on departure.to_vertex2 = arrival.from_vertex),
	short(distance)
	  as(select min(distance)
		from path_cte
		where to_vertex2='y')
select * from path_cte j
     join short s
	 on j.distance = s.distance;
   
 
