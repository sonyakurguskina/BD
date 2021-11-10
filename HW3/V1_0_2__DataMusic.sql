insert into label
values(1,'Epic Records','{"Michael Jackson","The Hollies","The Yardbirds","The Dave Clark Five"}'),
(2,'Harvest','{"Pink Floyd","Deep Purple","The Move","Electric Light Orchestra"}'),
(3,'ATCO','{"AC/DC","The Coasters","Mr. Acker Bilk","Bent Fabric"}'),
(4,'RSO','{"Bee Gees","Cream","Derek and the Dominos"," Eric Clapton"}'),
(5,'Warner Records','{"Fleetwood Mac","Gorillaz","Red Hot Chili Peppers","Sara"}'),
(6,'Apple Records','{"The Beatles","Badfinger","Billy Preston","Mary Hopkin"}'),
(7,'XL Recordings','{"Adele","M.I.A.","Thom Yorke","Vampire Weekend"}'),
(8,'Elektra Records','{"Metallica","The Doors","The Stooges","Love"}');
--select * from label


insert into artist 
values
(1,'Michael Jackson'),
(2,'Pink Floyd'),
(3,'AC/DC'),
(4,'Bee Gees'),
(5,'Fleetwood Mac'),
(6,'Adele'),
(7,'The Beatles'),
(8,'Metallica');
--select * from artist;


insert into genre
values
(1,'pop music'),
(2,'progressive rock'),
(3,'hard rock'),
(4,'disco'),
(5,'rock');
--select * from genre;


insert into album
values
(1,'Thriller'),
(2,'The Dark Side of the Moon'),
(3,'Back in Black'),
(4,'Saturday Night Fever'),
(5,'Rumours'),
(6,'21'),
(7,'Abbey Road'),
(8,'Metallica'),
(9,'Dangerous');
--select * from album;


insert into producer
values
(1,'Michael','Jackson','USA',1),
(2,'Pink','Floyd','Great Britain',2),
(3,'Robert John','Mutt Lange','Great Britain',3),
(4,'Bill','Wakes','Great Britain',4),
(5,'Fleetwood','Mac','USA',5),
(6,'George Henry','Martin','Great Britain',6),
(7,'Adele Laurie','Blue Adkins','Great Britain',7),
(8,'Robert','Jens Rock','Canada',8);
--select * from producer



insert into song
values
(1,'The Girl Is Mine',1,1,1),
(2,'Thriller',1,1,1),
(3,'Beat It',1,1,1),
(4,'Billie Jean',1,1,1),
(5,'Speak to Me',2,2,2),
(6,'Breathe',2,2,2),
(7,'Any Colour You Like',2,2,2),
(8,'Eclipse',2,2,2),
(9,'Hells Bells',3,3,3),
(10,'Givin’ the Dog a Bone',3,3,3),
(11,'Shake a Leg',3,3,3),
(12,'You Shook Me All Night Long',3,3,3),
(13,'Stayin Alive',4,4,4),
(14,'How Deep Is Your Love',4,4,4),
(15,'The Chain',5,5,5),
(16,'Dreams',5,5,5),
(17,'Go Your Own Way',5,5,5),
(18,'Gold Dust Woman',5,5,5),
(19,'Jam',1,1,9),
(20,'She Drives Me Wild',1,1,9),
(21,'Keep the Faith',1,1,9),
(22,'Rolling in the Deep',6,7,6),
(23,'Here Comes the Sun',7,6,7),
(24,'Oh! Darling',7,6,7),
(25,'My Friend of Misery',8,8,8),
(26,'Of Wolf & Man',8,8,8),
(27,'The Unforgiven',8,8,8),
(28,'Enter Sandman',8,8,8);
--select * from song
