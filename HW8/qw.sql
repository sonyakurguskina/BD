create table airport(
id serial primary key,
name varchar(100)
);

create table company(
id serial primary key,
name varchar(100) not null
);


create table airplane(
id serial primary key,
model varchar(255) not null,
company_id int,
constraint airplane_fk foreign key (company_id) references company(id)	
);


create table crew(
id serial primary key,
first_pilot varchar(100) not null,
second_pilot varchar(100) not null,
stewardess varchar(100) not null
); 


create table flight(
id serial primary key,
date date not null,
departure_time time not null,
arrival_time time not null,
from_airport_id int not null,
to_airport_id int not null,
duration time not null,
airplane_id int,
crew_id int,
constraint flight_fk foreign key (airplane_id) references airplane(id),
constraint flight_fk1 foreign key (from_airport_id) references airport(id),
constraint flight_fk2 foreign key (to_airport_id) references airport(id),
constraint flight_fk3 foreign key (crew_id) references crew(id)
);



create table passenger(
id int,
name varchar(100) not null,
lastname varchar(100) not null,
phone_number varchar(100) not null,
flight_id int,
constraint passenger_fk foreign key (flight_id) references flight(id)
);




insert into airport
values(1,'Moscow Domodedovo Airport'),
(2,'Sheremetyevo International Airport'),
(3,'Vnukovo International Airport'),
(4,'Kazan International Airport'),
(5,'Pulkovo Airport'),
(6,'Sochi International Airport'),
(7,'New-York Airport'),
(8,'Burgas Airport'),
(9,'Riga Airport'),
(10,'Thessaloniki Airport'),
(11,'Antalya Airport'),
(12,'Warsaw Airport'),
(13,'Varna Airport');


insert into company
values(1,'S7 Airlines'),
(2,'Aeroflot');

insert into airplane
values(1,'Boeing 737-800',1),
(2,'Boeing 737-800',2),
(3,'Airbus A320',1),
(4,'Boeing 777-300ER',2),
(5,'Sukhoi SuperJet 100',2),
(6,'Airbus A320',2),
(7,'Airbus A321',2);

insert into crew
values(1,'Rob Relds','Stew Went','Kate Spring'),
(2,'Matt Laens','Richard Medisson','Amanda Bradshow'),
(3,'Stieve York','Geil Grods','Sharlott Stenly');

insert into flight
values(1,'2021-11-15','15:05','16:40',1,5,'01:35',1,1),
(2,'2021-11-15','14:15','19:20',6,5,'05:05',1,2),
(3,'2021-11-15','10:20','11:55',5,1,'01:35',3,3),
(4,'2021-11-15','14:55','17:20',2,7,'10:25',4,1),
(5,'2021-11-16','9:45','12:25',2,8,'03:40',5,2),
(6,'2021-11-16','14:30','15:25',2,9,'01:55',6,3),
(7,'2021-11-17','15:45','18:35',2,10,'03:50',2,1),
(8,'2021-11-17','12:45','16:35',2,11,'03:50',7,2),
(9,'2021-11-18','11:55','12:15',2,12,'02:20',6,3),
(10,'2021-11-18','10:15','14:00',2,13,'03:45',6,1);

insert into passenger
values(1,'Maria','Ivanova','89486874254',1),
(1,'Maria','Ivanova','89486874254',4),
(1,'Maria','Ivanova','89486874254',7),
(2,'Kate','Smith','87459621587',1),
(2,'Kate','Smith','87459621587',2),
(2,'Kate','Smith','87459621587',3),
(2,'Kate','Smith','87459621587',10),
(3,'Margo','Johnson','86549852014',5),
(3,'Margo','Johnson','86549852014',6),
(3,'Margo','Johnson','86549852014',8),
(4,'Alice','Anderson','87536214859',9),
(4,'Alice','Anderson','87536214859',10),
(5,'Sally','Robinson','77785466777',2),
(6,'Poll','Anderson','87556854789',6);



-- 3
select * from flight
where duration=(select max(duration) from flight);

-- 4
select b.name, a.date, count(b.name) from flight a
join airport b on a.to_airport_id=b.id 
where date = '2021-11-15'
group by b.name, a.date;

-- 5
select 'min' as type_value, lastname, name
from passenger
where id = (
select b.id
	--, b.name, sum(a.duration) 
	from flight a
join passenger b on a.id=b.flight_id
group by b.id, b.name
	order by sum(a.duration) limit 1
) 

union

select 'max' as type_value, lastname, name
from passenger
where id = (
select b.id
	--, b.name, sum(a.duration) 
	from flight a
join passenger b on a.id=b.flight_id
group by b.id, b.name
	order by sum(a.duration) desc limit 1
) 
;

























