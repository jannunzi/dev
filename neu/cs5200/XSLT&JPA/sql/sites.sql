CREATE TABLE `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `tower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `sides` int(11) DEFAULT NULL,
  `siteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tower_site` (`siteId`),
  CONSTRAINT `tower_site` FOREIGN KEY (`siteId`) REFERENCES `site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `towerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_tower` (`towerId`),
  CONSTRAINT `equipment_tower` FOREIGN KEY (`towerId`) REFERENCES `tower` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

insert into `site`(`id`,`name`,`latitude`,`longitude`) values (1,'Site 1',12.23,23.34);
insert into `site`(`id`,`name`,`latitude`,`longitude`) values (2,'Site 2',21.32,43.54);

insert into `tower`(`id`,`name`,`height`,`sides`,`siteId`) values (1,'Tower A',123.45,3,1);
insert into `tower`(`id`,`name`,`height`,`sides`,`siteId`) values (2,'Tower B',234.56,4,1);
insert into `tower`(`id`,`name`,`height`,`sides`,`siteId`) values (3,'Tower C',321.43,3,2);
insert into `tower`(`id`,`name`,`height`,`sides`,`siteId`) values (4,'Tower D',213.43,4,2);

insert into `equipment`(`id`,`name`,`brand`,`description`,`price`,`towerId`) values (1,'Equipment 1','Brand 1','Description 1',1234.56,1);
insert into `equipment`(`id`,`name`,`brand`,`description`,`price`,`towerId`) values (2,'Equipment 2','Brand 2','Description 2',2345.67,1);
insert into `equipment`(`id`,`name`,`brand`,`description`,`price`,`towerId`) values (3,'Equipment 3','Brand 3','Description 3',4321.54,2);
insert into `equipment`(`id`,`name`,`brand`,`description`,`price`,`towerId`) values (4,'Equipment 4','Brand 4','Description 4',5432.54,2);
insert into `equipment`(`id`,`name`,`brand`,`description`,`price`,`towerId`) values (5,'Equipment 5','Brand 5','Description 5',3212.23,3);
insert into `equipment`(`id`,`name`,`brand`,`description`,`price`,`towerId`) values (6,'Equipment 6','Brand 6','Description 6',2367.43,3);
insert into `equipment`(`id`,`name`,`brand`,`description`,`price`,`towerId`) values (7,'Equipment 7','Brand 7','Description 7',3456.65,4);
insert into `equipment`(`id`,`name`,`brand`,`description`,`price`,`towerId`) values (10,'Equipment 8','Brand 8','Description 8',5421.67,4);
