CREATE TABLE `director` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `movie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `STARS` int(11) DEFAULT NULL,
  `directorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MOVIE_directorId` (`directorId`),
  CONSTRAINT `FK_MOVIE_directorId` FOREIGN KEY (`directorId`) REFERENCES `director` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `actor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `OSCARS` int(11) DEFAULT NULL,
  `movieId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ACTOR_movieId` (`movieId`),
  CONSTRAINT `FK_ACTOR_movieId` FOREIGN KEY (`movieId`) REFERENCES `movie` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

insert into `director`(`ID`,`FIRSTNAME`,`LASTNAME`) values (1,'Alice','Wonderland');
insert into `director`(`ID`,`FIRSTNAME`,`LASTNAME`) values (2,'Bob','Marley');

insert into `movie`(`ID`,`NAME`,`STARS`,`directorId`) values (1,'Star Wars',5,1);
insert into `movie`(`ID`,`NAME`,`STARS`,`directorId`) values (2,'Star Trek',5,1);
insert into `movie`(`ID`,`NAME`,`STARS`,`directorId`) values (3,'Avatar',5,2);
insert into `movie`(`ID`,`NAME`,`STARS`,`directorId`) values (4,'Man on Fire',5,2);

insert into `actor`(`ID`,`FIRSTNAME`,`LASTNAME`,`OSCARS`,`movieId`) values (1,'Harrison','Ford',2,1);
insert into `actor`(`ID`,`FIRSTNAME`,`LASTNAME`,`OSCARS`,`movieId`) values (2,'Mark','Hamill',0,1);
insert into `actor`(`ID`,`FIRSTNAME`,`LASTNAME`,`OSCARS`,`movieId`) values (3,'Actor 1','Actor 1 Last',1,2);
insert into `actor`(`ID`,`FIRSTNAME`,`LASTNAME`,`OSCARS`,`movieId`) values (4,'Actor 2','Actor 2 Last',2,2);
insert into `actor`(`ID`,`FIRSTNAME`,`LASTNAME`,`OSCARS`,`movieId`) values (5,'Actor 3','Actor 3 Last',3,3);
insert into `actor`(`ID`,`FIRSTNAME`,`LASTNAME`,`OSCARS`,`movieId`) values (6,'Actor 4','Actor 3 Last',4,3);
insert into `actor`(`ID`,`FIRSTNAME`,`LASTNAME`,`OSCARS`,`movieId`) values (7,'Actor 5','Actor 4 Last',5,4);
insert into `actor`(`ID`,`FIRSTNAME`,`LASTNAME`,`OSCARS`,`movieId`) values (8,'Actor 6','Actor 5 Last',6,4);
