DROP DATABASE if exists qatar2022;
CREATE DATABASE qatar2022;
USE qatar2022;

ALTER DATABASE qatar2022 
CHARACTER SET = utf8mb4 
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE cuerpoTecnico (
idtecnico INT PRIMARY KEY auto_increment
,idseleccion INT NOT null
,nombre VARCHAR(45) NOT NULL
,apellido VARCHAR(45) NOT NULL 
);

CREATE TABLE seleccion (
idseleccion INT PRIMARY key
,nombreseleccion VARCHAR(45) NOT NULL
,pais VARCHAR(45) NOT NULL
,grupo VARCHAR(1) NOT NULL
);

CREATE TABLE jugador (
idjugador INT PRIMARY KEY AUTO_INCREMENT
,idseleccion INT NOT NULL
,numeroJugador INT NOT NULL	
,idrol INT NOT NULL
,nombre VARCHAR(45) NOT NULL
,apellido VARCHAR(45) NOT NULL
,fechanacimiento DATE NOT NULL
);

CREATE TABLE rol (
idrol INT PRIMARY KEY
,rol VARCHAR(45) NOT NULL
);

CREATE TABLE partido (
idpartido INT PRIMARY KEY AUTO_INCREMENT 
,idseleccion1 INT DEFAULT NULL 
,idseleccion2 INT DEFAULT NULL 
,idestadio INT NOT NULL
,idfase INT NOT NULL
,fecha DATE NOT NULL
,goles1 INT NOT NULL
,goles2 INT NOT NULL
,ganador VARCHAR(45) NOT NULL
,textraprimero TIME(6) DEFAULT '00:00'
,textrasegundo TIME(6) DEFAULT '00:00'
,penales BOOLEAN DEFAULT 0
,penales1 INT DEFAULT NULL
,penales2 INT DEFAULT NULL
,prorrogatotal TIME (4) DEFAULT '00:00'
);

CREATE TABLE estadio (
idestadio INT PRIMARY key
,nombre VARCHAR(45) NOT NULL
,ciudad VARCHAR(45) NOT NULL
,capacidad INT NOT NULL
);

CREATE TABLE fase (
idfase INT PRIMARY KEY 
,fase VARCHAR(45) NOT NULL
);

CREATE TABLE arbitro (
idarbitro INT PRIMARY KEY auto_increment
,idrol INT NOT null
,nombre VARCHAR(45) NOT NULL
,apellido VARCHAR(45) NOT NULL
,nacionalidad VARCHAR(45) NOT NULL
);

CREATE TABLE rolarbitro (
idrolarbitro INT PRIMARY KEY auto_increment
,rol VARCHAR(45) NOT NULL
);

CREATE TABLE arbitraje (
idpartido INT NOT NULL
,idarbitro INT NOT NULL
);

CREATE TABLE evento (
idevento INT PRIMARY KEY AUTO_INCREMENT 
,suceso VARCHAR(45) NOT NULL
);

CREATE TABLE cronologia (
idcronologia INT PRIMARY KEY auto_increment 
,idpartido INT NOT NULL
,idevento INT NOT NULL 
,idjugador1 INT DEFAULT NULL  
,idjugador2 INT DEFAULT NULL 
,minuto VARCHAR(10) NOT NULL
,detalle VARCHAR(255) DEFAULT null
);


INSERT INTO rol (idrol,rol) VALUES
(1,'Arquero')
,(2,'Defensa')
,(3, 'Medio campista')
,(4, 'Delantero')
;

INSERT INTO seleccion (idseleccion,nombreseleccion,pais,grupo)
VALUES
(1,'QAT','Qatar','A')
,(2,'ARG','Argentina','C')
,(3,'AUS','Australia','D')
,(4,'BEL','Belgica','F')
,(5,'BRA','Brasil','G')
,(6,'CMR','Camerun','G')
,(7,'CAN','Canada','F')
,(8,'CRC','Costa Rica','E')
,(9,'CRO','Croacia','F')
,(10,'DEN','Dinamarca','D')
,(11,'ECU','Ecuador','A')
,(12,'ENG','Inglaterra','B')
,(13,'FRA','Francia','D')
,(14,'GER','Alemania','E')
,(15,'GHA','Ghana','H')
,(16,'IRN','Iran','B')
,(17,'JPN','Japon','E')
,(18,'KOR','Corea','H')
,(19,'MEX','México','C')
,(20,'MAR','Marruecos','F')
,(21,'NED','Paises Bajos','A')
,(22,'POL','Polonia','C')
,(23,'POR','Portugal','H')
,(24,'KSA','Arabia Saudita','C')
,(25,'SEN','Senegal','A')
,(26,'SRB','Serbia','G')
,(27,'ESP','España','E')
,(28,'SUI','Suiza','G')
,(29,'TUN','Tunez','D')
,(30,'USA','Estados Unidos','B')
,(31,'URU','Uruguay','H')
,(32,'WAL','Gales','B')
;

INSERT INTO estadio (idestadio,nombre,ciudad,capacidad) VALUES
(1,'Al Bait', 'Al Khor', 60000)
,(2,'Al Yanub','Al Wkrah',40000)
,(3,'Ahmad bin Ali', 'Al Rayyan',40000)
,(4,'Al Zumama','Doha', 40000)
,(5,'Estadio de la Ciudad de la Educación','Al Rayyan',40000)
,(6,'Estadio Internacional Jalifa', 'Al Rayyan', 50000)
,(7,'Estadio de Lusail', 'Lusail', 80000)
,(8,'Estadio 974','Doha',40000);

INSERT INTO fase (idfase,fase) VALUES
(1,'Grupos')
,(2,'Octavos de final')
,(3,'Cuartos de final')
,(4,'Semifinal')
,(5,'Partido por el tercer lugar')
,(6,'Final')
;

INSERT INTO evento (suceso) VALUES
('Penales')
,('Tarjeta Amarilla')
,('Tarjeta Roja')
,('Cambio')
,('Gol')
;

-- Tecnicos

INSERT INTO cuerpoTecnico (idseleccion,nombre,apellido) VALUES
(1,'Félix','Sanchéz Bas')
,(2,'Lionel','Scaloni')
,(3,'Graham','Arnold')
,(4,'Roberto','Martínez')
,(5,'Adenor Leonardo','Bacchi')
,(6,'Rigobert','Song')
,(7,'John','Herdman')
,(8,'Luis Fernando','Suárez')
,(9,'Zlatko','Dalic')
,(10,'Kasper','Hjulmand')
,(11,'Gustavo','Alfaro')
,(12,'Gareth','Southgate')
,(13,'Didier','Deschamps')
,(14,'Hans-Dieter','Flick')
,(15,'Otto','Addo')
,(16,'Carlos','Queiroz')
,(17,'Hajime','Moriyasu')
,(18,'Paulo','Bento')
,(19,'Gerardo','Martino')
,(20,'Walid','Regragui')
,(21,'Louis','Van Gaal')
,(22,'Czeslaw','Michniewicz')
,(23,'Fernando','Santos')
,(24,'Hervé','Renard')
,(25,'Aliou','Cissé')
,(26,'Dragan','Stojkovic')
,(27,'Luis','Enrique')
,(28,'Murat','Yakin')
,(29,'Jalel','Kadri')
,(30,'Greg','Berhalter')
,(31,'Diego','Alonso')
,(32,'Robert','Page');

insert INTO rolarbitro (rol) VALUES
('Principal')
,('Asistente')
,('VAR');


INSERT INTO arbitro (nombre, apellido, nacionalidad,idrol) VALUES
-- Principales
('Antonio','Lahoz','España',1)
,('Andrés','Matías','Uruguay',1)
,('Mohammed Abdulla','Mohammed','Emiratos Árabes',1)
,('Salima','Mukansanga ','Ruanda',1)
,('Maguette','Ndiaye','Senegal',1)
,('Michael','Oliver','Inglaterra',1)
,('Daniel','Orsato','Italia',1)
,('Kevin','Ortega','Peru',1)
,('Cesar','Ramos','Mexico',1)
,('Fernando','Rapallini ','Argentina',1)
,('Wilton','Sampaio','Brasil',1)
,('Daniel','Siebert','Alemania',1)
,('Janny','Sikazwe','Zambia',1)
,('Anthony','Taylor','Inglaterra',1)
,('Facundo','Tello','Argentina',1)
,('Clement','Turpin','Francia',1)
,('Jesus','Valenzuela','Venezuela',1)
,('Slavko','Vincic','Eslovenia',1)
,('Yoshimi','Yamashita','Japon',1)
,('Abdulrahman','Al Jassim','Qatar',1)
,('Ivan','Barton','El Salvador',1)
,('Chris ','Beath ','Australia',1)
,('Raphael','Claus','Brasil',1)
,('Matthew','Conger ','Nueva Zelanda',1)
,('Ismail','Elfath ','Estados Unidos',1)
,('Mario','Escobar','Guatemala',1)
,('Alireza','Faghani ','Iran',1)
,('Stephanie','Frappart ','Francia',1)
,('Bakary','Gassama ','Gambia',1)
,('Mustapha','Ghorbal ','Argelia',1)
,('Victor','Gomes','Sudafrica',1)
,('Istvan','Kovacs ','Rumania',1)
,('Ning','Ma','China',1)
,('Danny','Makkelie ','Holanda',1)
,('Szymon','Marciniak ','Polonia',1)
,('Said','Martinez','Honduras',1)
-- Asistentes
,('Abdelhak','Etchiali ','Argelia',2)
,('Raymundo Helpys','Feliz ','RDC',2)
,('Rodrigo','Figueiredo ','Brasil',2)
,('Rafael','Foltyn ','Alemania',2)
,('Alessandro','Giallatini ','Italia',2)
,('Mokrane','Gourari ','Argelia',2)
,('Cyril','Gringore ','Francia',2)
,('Miguel','Hernández ','Mexico',2)
,('Tomaz','Krancnik ','Eslovenia',2)
,('Andraz','Kovacic ','Eslovenia',2)
,('Tomasz','Listkiewicz ','Polonia',2)
,('Walter','Lopez','Honduras',2)
,('Tevita','Makasini ','Tonga',2)
,('Mohammadreza','Mansouri ','Iran',2)
,('Arsenio','Marengule ','Mozambique',2)
,('Vasile','Marinescu','Rumania',2)
,('Juan Carlos','Mora','Costa Rica',2)
,('Dvid','Moran','El Salvador',2)
,('Tulio','Moreno ','Chile',2)
,('Alberto','Morin','Mexico',2)
,('Kathryn','Nesbitt ','Estados Unidos',2)
,('Elvis','Nounpe','Camerun',2)
,('Michael','Oure','Peru',2)
,('Corey','Parker','Estados Unidos',2)
,('Souru','Phatsoane ','Lesoto',2)
,('Bruno','Pires','Brasil',2)
,('Mark','Rule ','Nueva Zelanda',2)
,('El Hadji','Zamba','Senegal',2)
,('Jan','Seidel','Alemania',2)
,('Anton','Schchetinin','Australia',2)
,('Xiang','Shi','China',2)
,('Danilo','Simon','',2)
,('Zakhele','Siwela','Sudafrica',2)
,('Pawel','Sokolnicki','Polonia',2)
,('Martín','Soppi','Uruguay',2)
,('Hessel','Steegstra ','Paises Bajos',2)
,('Jorge','Urrego','Venezuela',2)
-- VAR
,('Fernando','Guerrero','Mexico',3)
,('Alejandro','Hernandez','España',3)
,('Massimiliano','Irrati','Venezuela',3)
,('Redouane','Jiyed','Marruecos',3)
,('Tomasz','Kwiatkowski ','Polonia',3)
,('Juan','Munuera','España',3)
,('Benoit','Millot','Francia',3)
,('Juan','Soto','Venezuela',3)
,('Paolo','Valeri','Italia',3)
,('Mauro','Argentina','Argentina',3)
,('Armando','Villarreal ','Estados Unidos',3)
,('Adil','Zourak','Marruecos',3)
,('Abdulla','Al Marri','Qatar',3)
,('Julio','Bascunan','Chile',3)
,('Muhammad','Bin Jahari','Singapur',3)
,('Jerome','Brisard ','Francia',3)
,('Bastian','Dankert','Alemania',3)
,('Ricardo de Burgos','Bengoetxea ','España',3)
,('Drew','Fischer ','Canada',3)
,('Marco','Fritz','Alemania',3)
,('Nicolás','Gallo','Colombia',3)
,('Leodan','Gonzalez','Uruguay',3)
;

-- España
insert into jugador(nombre, apellido, fechanacimiento, idrol,idseleccion,numeroJugador)
values
('Robert', 'Sánchez', '1997-11-18', 1, 27, 1)
,('David','Raya', '1995-09-15', 1, 27, 13)
,('Unai', 'Simón', '1997-06-11', 1, 27, 23)
,('César', 'Azpilicueta', '1989-08-28', 2, 27,2)
,('Eric', 'Garcia', '2001-01-09', 2, 27, 3)
,('Pau', 'Torres', '1997-01-16', 2, 27, 4)
,('Alejandro', 'Balde', '2003-10-18', 2, 27, 14)
,('Hugo', 'Guillamon', '2000-01-31', 2, 27, 15)
,('Jordi', 'Alba', '1989-03-21', 2, 27, 18)
,('Dani', 'Carvajal', '1992-01-11', 2, 27, 20)
,('Aymeric', 'Laporte', '1994-05-27', 2, 27, 24)
,('Sergio', 'Busquets', '1988-07-16', 3, 27, 5)
,('Marcos', 'Llorente', '1995-01-30', 3, 27, 6)
,('Koke', 'Merodio', '1992-08-01', 3, 27, 8)
,('Pablo', 'Gavi', '2004-08-05', 3, 27, 9)
,('Rodri', 'Hernández', '1996-06-22', 3, 27, 16)
,('Carlos', 'Soler', '1997-01-02', 3, 27, 19)
,('Pedri', 'Gonzalez', '2002-11-25', 3, 27, 26)
,('Alvaro', 'Morata', '1992-10-23', 4, 27, 7)
,('Marco', 'Asensio', '1996-01-21', 4, 27, 10)
,('Ferran', 'Torres', '2000-02-29', 4, 27, 11)
,('Nico', 'Williams', '2002-07-12', 4, 27, 12)
,('Yeremy', 'Pino', '2002-10-20', 4, 27, 17)
,('Dani', 'Olmo', '1998-05-07', 4, 27, 21)
,('Pablo', 'Sarabia', '1992-05-11', 4, 27, 22)
,('Ansu', 'Fati', '2002-10-31', 4, 27, 25);

-- Japon
insert into jugador (nombre, apellido, fechanacimiento, idrol,idseleccion,numeroJugador)
values
('Eiji', 'Kawashima', '1983-03-20', 1,17, 1)
,('Shuichi','Gonda', '1989-03-03', 1,17, 12)
,('Daniel', 'Schmidt', '1992-02-03', 1,17, 23)
,('Miki', 'Yamane', '1993-12-22', 2,17, 2)
,('Shogo', 'Taniguchi', '1991-07-15', 2,17, 3)
,('Kou', 'Itakura', '1997-01-27', 2,17, 4)
,('Yuto', 'Nagatomo', '1986-09-12', 2,17, 5)
,('Takehiro', 'Tomiyasu', '1998-11-05' , 2,17, 16)
,('Hiroki', 'Sakai', '1990-04-12', 2,17, 19)
,('Maya', 'Yoshida', '1988-08-24', 2,17, 22)
,('Hiroki', 'Ito', '1999-05-12', 2,17, 26)
,('Wataru', 'Endo', '1993-02-09', 3,17, 6)
,('Gaku', 'Shibasaki', '1992-05-28', 3,17, 7)
,('Ritsu', 'Doan', '1998-06-16', 3,17, 8)
,('Kaoru', 'Mitoma', '1997-05-20', 3,17, 9)
,('Takumi', 'Minamino', '1995-01-16', 3,17, 10)
,('Takefusa', 'Kubo', '2001-06-04', 3,17, 11)
,('Hidemasa', 'Morita', '1995-05-10', 3,17, 13)
,('Junya', 'Ito', '1993-03-09', 3,17, 14)
,('Daichi', 'Kamada', '1996-08-05', 3,17, 15)
,('Ao', 'Tanaka', '1998-09-10', 3,17, 17)
,('Yuki', 'Soma', '1997-02-25', 3,17, 24)
,('Takuma', 'Asano', '1994-11-10', 4,17, 18)
,('Shuto', 'Machino', '1999-09-30', 4,17, 20)
,('Ayase', 'Ueda', '1998-08-28', 4,17, 21)
,('Daizen', 'Maeda', '1997-10-20', 4,17, 25);

-- Costa rica
insert into jugador (nombre, apellido, fechanacimiento, idrol,idseleccion,numeroJugador)
values
('Keylor', 'Navas', '1986-12-15', 1,8, 1)
,('Esteban','Alvarado', '1989-04-28', 1,8, 18)
,('Patrick', 'Sequeira', '1999-03-01', 1,8, 23)
,('Juan', 'Vargas', '1995-06-06', 2,8, 3)
,('Keysher', 'Fuller', '1994-07-12', 2,8, 4)
,('Oscar', 'Duarte', '1989-06-03', 2,8, 6)
,('Bryan', 'Oviedo', '1990-02-18', 2,8, 8)
,('Francisco', 'Calvo', '1992-07-08' , 2,8, 15)
,('Carlos', 'Martínez', '1999-03-30', 2,8, 16)
,('Kendall', 'Waston', '1988-01-01', 2,8, 19)
,('Ronald', 'Matarrita', '1994-07-09', 2,8, 22)
,('Daniel', 'Chacón', '2001-04-11', 3,8, 2)
,('Celso', 'Borges', '1988-05-27', 3,8, 5)
,('Jewison', 'Bennette', '2004-06-15', 3,8, 9)
,('Bryan', 'Ruiz', '1985-08-18', 3,8, 10)
,('Gerson', 'Torres', '1997-08-28', 3,8, 13)
,('Youstin', 'Salas', '1996-06-17', 3,8, 14)
,('Yeltsin', 'Tejeda', '1992-03-17', 3,8, 17)
,('Brandon', 'Aguilera', '2003-06-28', 3,8, 20)
,('Douglas', 'López', '1998-09-21', 3,8, 21)
,('Roan', 'Wilson', '2002-05-01', 3,8, 24)
,('Anthony', 'Hernández', '2001-10-11', 3,8, 25)
,('Álvaro', 'Zamora', '2002-03-09', 3,8, 26)
,('Anthony', 'Contreras', '2000-01-29', 4,8, 7)
,('Johan', 'Venegas', '1988-11-27', 4,8, 11)
,('Joel', 'Campbell', '1992-06-26',4,8, 12);

-- Alemania
insert into jugador (nombre, apellido, fechanacimiento, idrol,idseleccion,numeroJugador)
values
('Manuel', 'Neuer', '1986-03-27', 1,14, 1)
,('Kevin','Trapp', '1990-07-08', 1,14, 12)
,('Marc-André', 'Ter Stegen', '1992-04-30', 1,14, 22)
,('Antonio', 'Rüdiger', '1993-03-03', 2,14, 2)
,('Matthias', 'Ginter', '1994-01-19', 2,14, 4)
,('David', 'Raum', '1998-04-22', 2,14, 3)
,('Thilo', 'Kehrer', '1996-09-21', 2,14, 5)
,('Niklas', 'Süle', '1995-09-03' , 2,14, 15)
,('Lukas', 'Klostermann', '1996-06-03', 2,14, 16)
,('Christian', 'Günter', '1993-02-28', 2,14, 20)
,('Nico', 'Schlotterbeck', '1999-12-01', 2,14, 23)
,('Armel', 'Bella-Kotchap', '2001-12-11', 2,14, 25)
,('Joshua', 'Kimmich', '1995-02-08', 3,14, 6)
,('Leon', 'Goretzka', '1995-02-06', 3,14, 8)
,('Mario', 'Götze', '1992-06-03', 3,14, 11)
,('Jamal', 'Musiala', '2003-02-26', 3,14, 14)
,('Julian', 'Brandt', '1996-05-02', 3,14, 17)
,('Jonas', 'Hofmann', '1992-07-14', 3,14, 18)
,('Leroy', 'Sané', '1996-01-11', 3,14, 19)
,('Ilkay', 'Gündogan', '1990-10-24', 3,14, 21)
,('Thomas', 'Müller', '1989-09-13', 3,14, 13)
,('Kai', 'Havertz', '1999-06-11', 4,14, 7)
,('Niclas', 'Füllkrug', '1993-02-09', 4,14, 9)
,('Serge', 'Gnabry', '1995-07-14', 4,14, 10)
,('Karim', 'Adeyemi', '2002-01-18', 4,14, 24)
,('Youssoufa', 'Moukoko', '2004-11-20', 4,14, 26);

-- Portugal
insert into jugador (idseleccion, idrol, nombre, apellido, fechanacimiento ,numeroJugador)
VALUES
(23,1,'RUI','PATRICIO','1999-09-19', 1),
(23,1,'JOSE','SA','1993-01-17', 12),
(23,1,'DIOGO','COSTA','1999-09-19', 22),
(23,2,'DIGO','DALOT','1999-03-18', 2),
(23,2,'PEPE','','1983-02-26', 3),
(23,2,'RUBEN ','DIAS','1997-05-14', 4),
(23,2,'RAPHAEL','GUERREIRO','1993-12-22', 5),
(23,2,'DANILO','','1991-09-09', 13),
(23,2,'NUNO','MENDES','2002-06-19', 19),
(23,2,'JOAO','CANCELO','1994-05-27', 20),
(23,2,'ANTONIO','SILVA','2003-10-30', 24),
(23,3,'JOAO','PALHINHA','1995-07-09', 6),
(23,3,'BRUNO','FERNANDES','1994-09-08', 8),
(23,3,'WILLIAM','','1992-04-07', 14),
(23,3,'VITINHA','','2000-02-13', 16),
(23,3,'JOAO','MARIO','1993-01-19', 17),
(23,3,'RUBEN ','NEVES','1997-03-13', 18),
(23,3,'MATHEUS','NUNES','1998-08-27', 23),
(23,3,'OTAVIO','','1995-02-09', 25),
(23,4,'CRISTIANO','RONALDO','1985-02-05', 7),
(23,4,'ANDRE ','SILVA','1995-11-06', 9),
(23,4,'BERNARDO','SILVA','1994-08-10', 10),
(23,4,'JOAO','FELIX','1999-11-10', 11),
(23,4,'RAFAEL','LEAO','1999-06-10', 15),
(23,4,'RICARDO','HORTA','1994-09-15', 21),
(23,4,'GONCALO','RAMOS','2001-06-20', 26);


-- belgica
insert into jugador (nombre, apellido, fechanacimiento, idrol,idseleccion,numeroJugador)
values
('Thibaut', 'Courtois', '1992-05-11', 1,4, 1)
,('Simon','Mignolet', '1988-03-06', 1,4, 12)
,('Koen', 'Casteels', '1992-06-25', 1,4, 13)

,('Toby', 'Alderweireld', '1989-03-02',2,4, 2)
,('Arthur', 'Theate', '2000-05-25', 2,4, 3)
,('Wout', 'Faes', '1998-04-03', 2,4, 4)
,('Jan', 'Vertonghen', '1987-04-24', 2,4, 5)
,('Leander', 'Dendoncker', '1995-04-15' , 2,4, 19)
,('Zeno', 'Debast', '2003-10-24', 2,4, 26)

,('Axel', 'Witsel', '1989-01-12', 3,4, 6)
,('Kevin', 'De Bruyne', '1991-06-28', 3,4, 7)
,('Youri', 'Tielemans', '1997-05-07', 3,4, 8)
,('Thomas', 'Meunier', '1991-09-12', 3,4, 15)
,('Thorgan', 'Hazard', '1993-03-29', 3,4, 16)
,('Amadou', 'Onana', '2001-08-16', 3,4, 18)
,('Hans', 'Vanaken', '1992-08-24', 3,4, 20)
,('Timothy', 'Castagne', '1995-12-05', 3,4, 21)

,('Romelu', 'Lukaku', '1993-05-13', 3,4, 9)
,('Eden', 'Hazard', '1991-01-07', 3,4, 10)
,('Yanick', 'Carrasco', '1993-09-04', 3,4, 11)
,('Dries', 'Mertens', '1987-05-06', 3,4, 14)
,('Leandro', 'Trossard', '1994-12-04', 3,4, 17)
,('Charles', 'De Ketelaere', '2001-03-10', 3,4, 22)
,('Michy', 'Batshuayi', '1993-10-02', 3,4, 23)
,('Loïs', 'Openda', '2000-02-16', 3,4,24 )
,('Jérémy', 'Doku', '2002-05-27', 3,4, 25);



-- canada

insert into jugador (nombre, apellido, fechanacimiento, idrol,idseleccion,numeroJugador)
values
('Dayne', 'St. Clair', '1997-05-09', 1,7, 1)
,('James','Pantemis', '1997-02-21', 1,7, 16)
,('Milan', 'Borjan', '1987-10-23', 1,7, 18)

,('Alistair', 'Johnston', '1998-10-08', 2,7, 2)
,('Sam', 'Adekugbe', '1995-01-16', 2,7, 3)
,('Kamal', 'Miller', '1997-05-16', 2,7, 4)
,('Steven', 'Vitória', '1987-01-11', 2,7, 5)
,('Richie', 'Laryea', '1995-01-07', 2,7, 22)
,('Derek', 'Cornelius', '1997-11-25', 2,7, 25)
,('Joel', 'Waterman', '1996-01-24', 2,7, 26)

,('Samuel', 'Piette', '1994-11-12', 3,7, 6)
,('Stephen', 'Eustaquio', '1996-12-21', 3,7, 7)
,('Liam', 'Fraser', '1998-02-13', 3,7, 8)
,('Junior', 'Hoilett', '1990-06-05', 3,7, 10)
,('Atiba', 'Hutchinson', '1983-02-08', 3,7, 13)
,('Mark-Anthony', 'Kaye', '1994-12-02', 3,7, 14)
,('Ismaël', 'Koné', '2002-06-16', 3,7, 15)
,('Jonathan', 'Osorio', '1992-06-12', 3,7, 21)
,('Liam', 'Millar', '1999-09-27', 3,7, 23)
,('David', 'Wotherspoon', '1990-01-16', 3,7, 24)

,('Lucas', 'Cavallini', '1992-12-28', 4,7, 9)
,('Tajon', 'Buchanan', '1999-02-08', 4,7, 11)
,('Iké', 'Ugbo', '1998-09-21', 4,7, 12)
,('Cyle', 'Larin', '1995-04-17', 4,7, 17)
,('Alphonso', 'Davies', '2000-11-02', 4,7, 19)
,('Jonathan', 'David', '2000-01-14', 4,7, 20);

-- marruecos
insert into jugador (nombre, apellido, fechanacimiento, idrol,idseleccion,numeroJugador)
values
('Yassine', 'Bounou', '1991-04-05', 1,20, 1)
,('Monir','Mohand', '1989-05-10', 1,20, 12)
,('Ahmed', 'Tagnaouti', '1996-04-05', 1,20, 22)

,('Achraf', 'Hakimi', '1998-11-04', 2,20, 2)
,('Nayef', 'Aguerd', '1996-03-30', 2,20, 5)
,('Romain', 'Saïss', '1990-03-26', 2,20, 6)
,('Jawad', 'El Yamiq', '1992-02-29', 2,20, 18)
,('Achraf', 'Dari', '1999-05-06' , 2,20, 20)
,('Noussair', 'Mazraoui', '1997-11-14', 2,20, 3)
,('Badr', 'Benoun', '1993-09-30', 2,20, 24)
,('Yahia', 'Attiyat Allah', '1995-03-02', 2,20, 25)

,('Sofyan', 'Amrabat', '1996-08-21', 3,20, 4)
,('Hakim', 'Ziyech', '1993-03-19', 3,20, 7)
,('Azzedine', 'Ounahi', '2000-04-19', 3,20, 8)
,('Anass', 'Zaroury', '2000-11-07', 3,20, 10)
,('Ilias', 'Chair', '1997-10-30', 3,20, 13)
,('Zakaria', 'Aboukhlal', '2000-02-18', 3,20, 14)
,('Selim', 'Amallah', '1996-11-15', 3,20, 15)
,('Sofiane', 'Boufal', '1993-09-17', 3,20, 17)
,('Bilal', 'El Khannouss', '2004-05-10', 3,20, 23)
,('Yahya', 'Jabrane', '1991-06-18', 3,20, 26)

,('Abderrazak', 'Hamdallah', '1990-12-17',4,20, 9)
,('Abdelhamid', 'Sabiri', '1996-11-28', 4,20, 11)
,('Abde', 'Ezzalzouli', '1998-05-07', 4,20, 16)
,('Youssef', 'En-Nesyri', '2001-12-17', 4,20, 19)
,('Walid', 'Cheddira', '1998-01-22', 4,20, 21);


-- croacia

insert into jugador (nombre, apellido, fechanacimiento, idrol,idseleccion,numeroJugador)
values
('Dominik', 'Livakovic', '1995-01-09', 1,9, 1)
,('Ivo','Grbic', '1995-02-01', 1,9, 12)
,('Ivica', 'Ivusic', '1996-01-18', 1,9, 23)

,('Josip', 'Stanisic', '2000-04-02', 2,9, 2)
,('Borna', 'Barisic', '1992-11-10', 2,9, 3)
,('Martin', 'Erlic', '1998-01-24', 2,9, 5)
,('Dejan', 'Lovren', '1989-07-05', 2,9, 6)
,('Borna', 'Sosa', '1998-01-21' , 2,9, 19)
,('Josko', 'Gvardiol', '2002-01-23', 2,9, 20)
,('Domagoj', 'Vida', '1989-04-29', 2,9, 21)
,('Josip', 'Juranovic', '1995-08-16', 2,9, 22)
,('Josip', 'Sutalo', '2000-02-28', 2,9, 24)

,('Lovro', 'Majer', '1998-01-17', 3,9, 7)
,('Mateo', 'Kovacic', '1994-05-06', 3,9, 8)
,('Luka', 'Modric', '1985-09-09', 3,9, 10)
,('Marcelo', 'Brozovic', '1992-11-16', 3,9, 11)
,('Nikola', 'Vlasic', '1997-10-04', 3,9, 13)
,('Mario', 'Pasalic', '1995-02-09', 3,9, 15)
,('Luka', 'Sucic', '2002-09-08', 3,9, 25)
,('Kristijan', 'Jakic', '1997-05-14', 3,9, 26)

,('Ivan', 'Perisic', '1989-02-02', 4,9, 4)
,('Andrej', 'Kramaric', '1991-06-19', 4,9, 9)
,('Marko', 'Livaja', '1993-08-26', 4,9, 14)
,('Bruno', 'Petkovic', '1994-09-16', 4,9, 16)
,('Ante', 'Budimir', '1991-07-22', 4,9, 17)
,('Mislav', 'Orsic', '1992-12-29', 4,9, 18);


-- francia
insert into jugador (nombre, apellido, idrol, fechanacimiento ,idseleccion,numeroJugador)  VALUES
("Alphonse","Areola",1,'1993-02-27',13, 23)
,("Hugo","Lloris",1,'1986-12-26',13, 1)
,("Steve","Mandanda",1,'1985-03-28',13, 16)
,("Benjamin","Pavard",2,'1996-03-28',13, 2)
,("Axel","Disasi",2,'1998-03-11',13, 3)
,("Raphaël","Varane",2,'1993-04-25',13, 4)
,("Jules","Koundé",2,'1998-11-12',13, 5)
,("William","Saliba",2,'2001-03-24',13, 17)
,("Dayot","Upamecano",2,'1998-10-27',13, 18)
,("Theo","Hernández",2,'1997-10-06',13, 22)
,("Ibrahima","Konaté",2,'1999-05-25',13, 24)
,("Youssouf","Fofana",2,'1999-01-10',13, 13)
,("Lucas","Hernández",2,'1996-02-14',13, 22)
,("Mattéo","Guendouzi",3,'1999-04-14',13, 6)
,("Adrien","Rabiot",3,'1995-04-03',13, 14)
,("Aurélien","Tchouameni",3,'2000-01-27',13, 8)
,("Jordan","Veretout",3,'1993-03-01',13, 15)
,("Eduardo","Camavinga",3,'2002-11-10',13, 25)
,("Antoine","Griezmann",4,'1991-03-21',13, 7)
,("Olivier","Giroud",4,'1986-09-30',13, 9)
,("Kylian","Mbappé",4,'1998-12-20',13, 10)
,("Ousmane","Dembélé",4,'1997-05-15',13, 11)
,("Randal","Kolo Muani",4,'1998-12-05',13, 12)
,("Karim","Benzema",4,'1987-12-19',13, 19)
,("Marcus","Thuram",4,'1997-08-06',13, 26)
,("Kingsley","Coman",4,'1996-06-13',13, 20);

-- australia
insert into jugador (apellido,nombre,idrol,fechanacimiento,idseleccion, numeroJugador) VALUES
("Ryan","Mathew",1,'1992-04-08',3, 1)
,("Redmayne","Andrew",1,'1989-01-13',3, 12)
,("Danny","Vukovic",1,'1985-03-27',3, 18)
,("Degenek","Milos",2,'1994-04-28',3, 2)
,("Atkinson","Nathaniel",2,'1999-06-13',3, 3)
,("Rowles","Kye",2,'1998-06-24',3, 4)
,("Karacic","Fran",2,'1996-05-12',3, 5)
,("Wright","Bailey",2,'1992-07-28',3, 8)
,("Behich","Aziz",2,'1990-12-16',3, 16)
,("Harry","Souttar",2,'1998-10-22',3, 19)
,("Joel","King",2,'2000-10-30',3, 24)
,("Deng","Thomas",2,'1997-03-20',3, 20)
,("Tilio","Marco",3,'2001-08-23',3, 6)
,("Leckie","Mathew",3,'1991-02-04',3, 7)
,("Maclaren","Jamie",3,'1993-07-29',3, 9)
,("Mabil","Awer",3,'1995-09-15',3, 11)
,("Kuol","Garang",3,'2004-09-15',3, 15)
,("Goodwin","Craig",3,'1991-12-16',3, 21)
,("Cummings","Jason",3,'1995-08-01',3, 23)
,("Duke","Mitchell",3,'1991-01-18',3, 25)
,("Hrustic","Ajdin",4,'1996-07-05',3, 10)
,("Mooy","Aaron",4,'1990-09-15',3, 13)
,("McGree","Riley",4,'1998-11-02',3, 14)
,("Devlin","Cammy",4,'1998-06-07',3, 17)
,("Irvine","Jackson",4,'1993-03-07',3, 22)
,("Baccus","Keanu",4,'1998-06-07',3, 26);
	
-- dinamarca
insert into jugador(apellido,nombre,idrol,fechanacimiento,idseleccion, numeroJugador) VALUES
("Oliver","CHRISTENSE",1,'1999-03-22',10, 16)
,("Kasper","Schmeichel",1,'1986-11-05',10, 1)
,("Frederik","Rönnow",1,'1992-08-04',10, 22)
,("Joachim","Andersen",2,'1996-05-31',10, 2)
,("Victor","Nelsson",2,'1998-10-14',10, 3)
,("Simon","Kjaer",2,'1989-03-26',10, 4)
,("Joakim","Maehle",2,'1997-05-20',10, 5)
,("Andreas","Cornelius",2,'1993-03-16',10, 6)
,("Rasmus","Kristensen",2,'1997-07-11',10, 13)
,("Jens","Stryger Larsen",2,'1991-02-21',10, 17)
,("Daniel"," Wass",2,'1989-05-31',10, 18)
,("Alexander","Bah",2,'1997-12-09',10, 26)
,("Mathias","Jensen",3,'1996-01-01',10, 7)
,("Thomas","Delaney",3,'1991-09-03',10, 8)
,("Christian","Eriksen",3,'1992-02-14',10, 10)
,("Andreas","Skov Olsen",3,'1999-12-29',10, 11)
,("Christian","Nörgaard",3,'1994-03-10',10, 15)
,("Pierre-Emile","Höjbjerg",3,'1995-08-05',10, 23)
,("Robert","Skov",3,'1996-05-20',10, 24)
,("Jesper","Lindström",3,'2000-02-29',10, 25)
,("Mikkel","Damsgaard",3,'2000-07-03',10, 14)
,("Martin","Braithwaite",4,'1991-06-05',10, 9)
,("Kasper","Dolberg",4,'1997-10-06',10, 12)
,("Jonas","Wind",4,'1999-02-07',10, 19)
,("Yussuf","Poulsen",4,'1994-06-15',10, 20)
,("Andreas","Cornelius",4,'1993-03-16',10, 21);
	
-- Tunisia
insert into jugador(nombre,apellido,fechanacimiento,idrol,idseleccion,numeroJugador) VALUES
("Aymen", "Balbouli", "1984-09-14",1,29, 1)
,("Mouez", "Hassen", "1995-03-05",1,29, 26)
,("Bechir", "Ben Mustapha", "1994-11-29",1,29, 22)
,("Aymen", "Dahmen", "1997-01-28",1,29, 16)
,("Dylan", "Bronn", "1995-06-14",2,29,6)
,("Yassine", "Meriah", "1992-02-07",2,29,4)
,("Montassar", "Talbi", "1998-05-29",2,29,3)
,("Nader", "Ghandri", "1995-02-18",2,29,5)
,("Bilel", "Ifa", "1990-03-09",2,29,2)
,("Ali", "Maâloul", "1990-01-01",2,29,12)
,("Mohamed", "DRAGER", "1996-06-25",2,29,20)
,("Wajdi", "Kechrida", "1995-11-05",2,29, 21)
,("Ali", "ABDI", "1993-12-20",2,29,24)
,("Nader", "GHANDRI", "1995-02-18",3,29,5)
,("Hannibal", "MEJBRI", "2003-01-21",3,29,8)
,("Ferjani", "SASSI", "1992-03-18",3,29,13)
,("Aissa", "LAIDOUNI", "1996-12-13",3,29,14)
,("BEN", "Romdhane", "1999-09-06",3,29,15)
,("Ellyes", "SKHIRI", "1995-05-10",3,29,17)
,("Ghaylen", "CHAALELI", "1994-02-28",3,29,18)
,("Youssef", "MSAKNI", "1990-10-28",4,29,7)
,("Issam", "JEBALI", "1991-12-25",4,29,9)
,("Wahbi", "KHAZRI", "1991-02-08",4,29,10)
,("Taha", "KHENISSI", "1992-06-01",4,29,11)
,("Seifeddine", "JAZIRI", "1993-02-12",4,29,19)
,("Naim", "SLITI", "1992-07-27",4,29,23)
,("Anis", "SLIMANE", "2001-03-16",4,29,25);

-- Estados Unidos
insert into jugador(nombre,apellido,idrol,fechanacimiento,idseleccion,numeroJugador) VALUES
("Matt","Turner",1,'1994-06-24',30,1)
,("Sean","Johnson",1,'1989-05-31',30,25)
,("Ethan","Horvath",1,'1995-06-09',30,12)
,("Cameron","Carter-Vickers",2,'1997-12-31',30,20)
,("Walker","Zimmerman",2,'1993-05-19',30,3)
,("Aaron","Long",2,'1992-10-12',30,15)
,("Tim","Ream",2,'1987-10-05',30,13)
,("Antonee","Robinson",2,'1997-08-08',30,5)
,("Sergiño","Dest",2,'2000-11-03',30,2)
,("Joe","Scally",2,'2002-12-31',30,26)
,("DeAndre","Yedlin",2,'1993-07-09',30,22)
,("Shaquell","Moore",2,'1996-11-02',30,18)
,("Tyler","Adams",3,'1999-02-14',30,4)
,("Kellyn","Acosta",3,'1995-07-24',30,23)
,("Weston","McKennie",3,'1998-08-28',30,8)
,("Yunus","Musah",3,'2002-11-29',30,6)
,("Cristian","Roldán",3,'1995-06-03',30,17)
,("Luca","de la Torre",3,'1998-05-23',30,14)
,("Giovanni","Reina",4,'2002-11-13',30,7)
,("Brenden","Aaronson",4,'2000-10-22',30,11)
,("Jordan","Morris",4,'1994-10-26',30,16)
,("Christian","Pulisic",4,'1998-09-18',30,10)
,("Timothy","Weah",4,'2000-02-22',30,21)
,("Josh","Sargent",4,'2000-02-20',30,24)
,("Jesús","Ferreira",4,'2000-12-24',30,9)
,("Haji","Wright",4,'1998-03-27',30,19);

-- Inglaterra
INSERT INTO jugador(nombre, apellido, idrol, fechanacimiento,idseleccion, numeroJugador) VALUES 
("Jordan", "Pickford", 1, '1994-03-07',12,1)
,("Nick", "Pope", 1, '1992-04-19',12,13)
,("Aaron","Ramsdale", 1, '1998-05-14',12,23)
,("Kyle","WALKER", 2, '1990-05-28',12,2)
,("Luke","SHAW", 2, '1995-07-12',12,3)
,("John", "Stones", 2, '1994-05-28',12,5)
,("Harry","MAGUIRE", 2, '1993-03-05',12,6)
,("Kieran","TRIPPIER", 2, '1990-09-19',12,12)
,("Eric", "Dier", 2, '1994-01-15',12,15)
,("Conor","COADY", 2, '1993-02-25',12,16)
,("Trent","Alexander-Arnold", 2, '1998-10-07',12,18)
,("Ben","White", 2, '1997-10-08',12,21)
,("Declan","RICE", 3, '1999-01-14',12,4)
,("Jordan","HENDERSON", 3, '1990-06-17',12,8)
,("Kalvin","PHILLIPS", 3, '1995-12-02',12,14)
,("Mason","Mount", 3, '1999-01-10',12,19)
,("Phil","Foden", 3, '2000-05-28',12,20)
,("Jude","Bellingham", 3, '2003-06-29',12,22)
,("James","Maddison", 3, '1996-11-23',12,25)
,("Conor","Gallagher", 3, '2000-02-06',12,26)
,("Jack","GREALISH", 4, '1995-09-10',12,7)
,("Harry","Kane", 4, '1993-07-28',12,9)
,("Raheem", "Sterling", 4, '1994-12-08',12,10)
,("Marcus", "RASHFORD", 4, '1997-10-31',12,11)
,("Bukayo","Saka", 4, '2001-09-05',12,17)
,("Callum","Wilson", 4, '1992-02-27',12,24);

-- Iran
INSERT INTO jugador(nombre, apellido, idrol, fechanacimiento, idseleccion,numeroJugador) VALUES 
("Ali","BEIRANVAND", 1, '1992-09-21',16,1)
,("Payam","Niazmand", 1, '1995-04-06',16,17)
,("Amir","Abedzadeh", 1, '1993-04-26',16,22)
,("Hossein","Hossein", 1, '1992-06-30',16,24)
,("Sadegh","Moharrami", 2, '1996-03-01',16,2)
,("Ehsan","Hajsafi", 2, '1990-02-25' ,16,3)
,("Shoja","Khalilzadeh", 2, '1989-05-14',16,4)
,("Milad","Mohammadi", 2, '1993-09-29',16,5)
,("Morteza","Pouraliganji", 2, '1992-04-19',16,8)
,("Mohammad","Kanaani",2, '1994-03-23',16,13)
,("Roozbeh","Cheshmi", 2, '1993-06-24',16,15)
,("Majid","Hosseini",2, '1996-06-20',16,19)
,("Ramin","Rezaeian", 2, '1990-03-21',16,23)
,("Abolfazl","Jalali", 2, '1998-06-26',16,25)
,("Saeid","Ezatolahi", 3, '1996-10-01',16,6)
,("Alireza","Jahanbakhsh", 3, '1993-08-11',16,7)
,("Vahid","Amiri", 3, '1988-04-02',16,11)
,("Saman","Ghoddos", 3, '1993-09-06',16,14)
,("Mehdi","Torabi", 4, '1994-09-10',16,16)
,("Ali","Gholizadeh", 3, '1996-03-10',16,17)
,("Ali","Karimi", 3, '1994-02-11',16,18)
,("Ahmad","Nourollahi", 3, '1993-02-01',16,21)
,("Mehdi","Taremi", 4, '1992-07-18',16,9)
,("Karim","Ansarifard", 4, '1990-04-03',16,10)
,("Sardar","Azmoun", 4, '1995-01-01',16,20)
;

INSERT INTO jugador(nombre, apellido, idrol, fechanacimiento,idseleccion,numeroJugador)
VALUES 
("Danny","Ward", 1, '1993-06-22',32,12)
,("Wayne","Hennessey", 1, '1987-01-24',32,1)
,("Adam","Davies", 1, '1992-07-17',32,21)
,("Joe","Rodon", 2, '1997-10-22',32,6)
,("Ethan","Ampadu", 2, '2000-09-14',32,15)
,("Ben","Cabango", 2, '2000-05-30',32,24)
,("Chris","Mepham", 2, '1997-11-05',32,5)
,("Tom","Lockyer", 2, '1994-12-03',32,17)
,("Ben","Davies", 2, '1993-04-24',32,4)
,("Neco","Williams", 2, '2001-04-13',32,3)
,("Connor","Roberts", 2, '1995-09-23',32,14)
,("Chris","Gunter", 2, '1989-07-21',32,2)
,("Rubin","Colwill", 3, '2002-04-27',32,25)
,("Sorba","Thomas", 3, '1999-01-25',32,22)
,("Matt","Smith", 3, '1999-11-22',32,26)
,("Aaron","Ramsey", 3, '1990-12-26' ,32,10)
,("Joe","Allen", 3, '1990-03-14',32,7)
,("Dylan","Levitt", 3, '2000-11-17',32,23)
,("Joe","Morrell", 3, '1997-01-03',32,16)
,("Jonathan","Williams", 3, '1993-10-09',32,18)
,("Harry","Wilson", 3, '1997-03-22',32,8)
,("Daniel","James", 4, '1997-11-10',32,20)
,("Gareth","Bale", 4, '1989-07-16',32,11)
,("Brennan","Johnson", 4, '2001-05-23',32,9)
,("Mark","Harris", 4, '1998-12-29',32,19)
,("Kieffer","Moore", 4, '1992-08-08',32,13);

-- corea
INSERT INTO jugador (idseleccion, idrol,nombre,apellido, fechaNacimiento,numeroJugador)
 VALUES (18,1,'KIM','Seunggyu','1990-09-30',1),
 (18,1,'SONG','Bumkeun','1997-10-15',12),
 (18,1,'JO','Hyeonwoo','1994-06-27',21),
 (18,2,'YOON','Jonggyu','1996-01-26',2), 
 (18,2,'KIM','Jinsu','1992-05-12',3),
 (18,2,'KIM','MINJAE','1997-06-11',4), 
 (18,2,'HONG','Chul','1989-12-14',14),
 (18,2,'KIM','Moonhwan','1996-12-20',15),
 (18,2,'KIM','Younggwon','1994-04-24',19),
 (18,2,'KWON','Kyungwon','1994-09-13',20),
 (18,2,'KIM','Taehwan','1997-02-24',23),
 (18,2,'CHO','Yumin','2001-04-12',24), 
 (18,3,'JUNG','Wooyoung','1995-08-10',5),
 (18,3,'HWANG','Inbeom','1992-08-10',6),
 (18,4,'SON','Heungmin','1991-07-03',7),
 (18,3,'PAIK','Seungho','1997-09-20',8),
 (18,3,'SON','Junho','1991-07-03',13),
 (18,4,'NA','Sangho','1997-09-20',17),
 (18,3,'LEE','Kangin','2001-07-09',18), 
 (18,3,'KWON','Changhoon','1992-07-08',22), 
 (18,3,'JEONG','Wooyeong','1999-09-12',25),
 (18,4,'SONG','Minkyu','1996-08-12',26),
 (18,4,'HWANG','Uijo','1999-01-06',16), 
 (18,3,'JO',' Gyu-Seong','1998-01-25',9),
 (18,3,'LEE','Jae-Sung','1992-08-10',10),
 (18,4,'HWANG','Hee-Chan','1996-01-26',11);
 
-- grupo g
 insert into jugador (nombre, apellido, fechanacimiento, idrol, idseleccion, numeroJugador) VALUES
('Alisson', 'Becker', '1992-10-02', 1, 5, 1)
,('Danilo','Luiz', '1991-07-15', 2, 5, 2)
,('Thiago', 'Silva', '1984-09-22', 2, 5, 3)
,('Marcos', 'Aoás', '1994-05-14', 2, 5, 4)
,('Carlos', 'Casimiro', '1992-02-23', 3, 5, 5)
,('Alex', 'Sandro', '1991-01-26', 2, 5, 6)
,('Lucas', 'Paquetá', '1997-06-27', 3, 5, 7)
,('Fred', 'Paula', '1993-03-05' , 3, 5, 8)
,('Richarlison', 'de Andrade', '1997-05-10', 4, 5, 9)
,('Neymar', 'Silva', '1992-02-05', 4, 5, 10)
,('Raphael', 'Dias', '1996-12-14', 4, 5, 11)
,('Weverton', 'Pereira', '1987-12-13', 1, 5, 12)
,('Dani', 'Alves', '1983-05-06', 2, 5, 13)
,('Éder', 'Militão', '1998-01-18', 2, 5, 14)
,('Fábio', 'Tavares', '1993-10-23', 3, 5, 15)
,('Alex', 'Telles', '1992-12-15', 2, 5, 16)
,('Bruno', 'Guimarães', '1997-11-16', 3, 5, 17)
,('Gabriel', 'Jesus', '1997-04-03', 4, 5, 18)
,('Antony', 'dos Santos', '2000-02-24', 4, 5, 19)
,('Vinícius', 'Junior', '2000-07-12', 4, 5, 20)
,('Rodrygo', 'Silva', '2001-01-09', 4, 5, 21)
,('Éverton', 'Ribeiro', '1989-04-10', 3, 5, 22)
,('Ederson', 'Santana', '1993-08-17', 1, 5, 23)
,('Bremer', 'Silva', '1997-03-18', 2, 5, 24)
,('Pedro', 'Abreu', '1997-06-20', 4, 5, 25)
,('Gabriel', 'Martinelli', '2001-06-18', 4, 5, 26)
-- Suiza
,('Yann', 'Sommer', '1998-12-17', 1, 28, 1)
,('Fabian', 'Frei', '1989-01-08', 3, 28, 20)
,('Haris', 'Seferovic', '1992-02-22', 4 , 28, 9)
,('Xherdan', 'Shaqiri', '1991-10-10', 3 , 28, 23)
,('Ricardo', 'Rodriguez', '1992-08-25', 2 ,28, 13)
,('Fabian', 'Schär', '1991-12-20', 2, 28, 22)
,('Remo', 'Freuler', '1992-04-15', 3, 28, 8)
,('Granit', 'Xhaka', '1992-09-27', 3, 28, 10)
,('Silvan', 'Widmer', '1993-03-05', 2, 28, 3)
,('Renato', 'Steffen', '1991-11-03', 2, 28, 11)
,('Nico', 'Elvedi', '1996-09-30', 2, 28, 4)
,('Edimilson', 'Fernandes', '1996-04-15', 2, 28, 2)
,('Breel', 'Embolo', '1997-02-14', 4, 28, 7)
,('Djibril', 'Sow', '1997-02-06', 4, 28, 15)
,('Manuel', 'Akanji', '1995-07-19', 2, 28, 5)
,('Gregor', 'Kobel', '1997-12-06', 1, 28, 21)
,('Jonas', 'Omlin', '1994-01-10', 1, 28, 12)
,('Eray', ' Cömert', '1998-02-04', 2, 28, 18)
,('Denis', 'Zakaria', '1996-11-20', 3, 28, 6)
,('Christian', 'Fassnacht', '1993-11-11', 3, 28, 16)
,('Philipp', 'Köhn', '1998-04-02', 1, 28, 24)
,('Michel', 'Aebischer', '1997-01-06', 3, 28, 14)
,('Noah', 'Okafor', '2000-05-24', 4, 28, 19)
,('Ruben', 'Vargas', '1988-08-05', 4, 28, 17)
,('Fabian', 'Rieder', '2002-02-16', 4, 28, 25)
,('Ardon', 'Jashari', '2002-07-30', 3, 28, 26)
-- Camerun
,('Simon', 'Ngapandouetnbu', '2003-04-12',1, 6, 1)
,('Jerome', 'Ngom Mbekeli', '1998-09-30', 2, 6, 2)
,('Nicolas', 'Nkoulou', '1990-03-27', 2, 6, 3)
,('Christopher', 'Wooh', '2001-09-18', 2, 6, 4)
,('Gael', 'Ondoua', '1995-11-04', 3, 6, 5)
,('Nicolas', 'Moumi Ngamaleu', '1994-07-09', 3, 6, 6)
,('Georges Kevin', 'Noudou', '1995-02-13' , 3, 6, 7)
,('Frank', 'Anguissa', '1995-11-16', 4, 6, 8)
,('Jean-Pierre', 'Nsame', '1993-05-01', 4, 6, 9)
,('Vincent', 'Aboubakar', '1992-01-22', 4, 6, 10)
,('Christian ', 'Bassogog', '1995-10-30', 4, 6, 11)
,('Karl', 'Toko Ekambi', '1992-09-14', 4, 6, 12)
,('Eric Maxim', 'Choupo-Moting', '1989-03-23', 4, 6, 13)
,('Samuel', 'Oum Gouet', '1997-12-14', 3, 6, 14)
,('Pierre', 'Kunde', '1995-07-26', 3, 6, 15)
,('Devis', 'Epassy', '1993-02-02', 1, 6, 16)
,('Olivier', 'Mbaizo', '1997-08-15', 2, 6, 17)
,('Martin', 'Hongla', '1998-03-16', 3, 6, 18)
,('Collins', 'Fai', '1992-08-13', 2, 6, 19)
,('Bryan', 'Mbeumo', '1999-08-07', 4, 6, 20)
,('Jean-Charles', 'Castelletto', '1995-01-26', 2, 6, 21)
,('Olivier', 'Ntcham ', '1996-02-09', 4, 6, 22)
,('André', 'Onana', '1996-04-02', 1, 6, 23)
,('Enzo', 'Ebosse', '1999-03-11', 2, 6, 24)
,('Nouhou', 'Tolo', '1997-06-23', 2, 6, 25)
,('Souaibou', 'Marou', '2000-12-03', 4, 6, 26)
-- Serbia
,('Marko', 'Dmitrovic', '1992-01-24', 1, 26, 1)
,('Strahinja', 'Pavlovic', '2001-05-24', 2, 26, 2)
,('Strahinja', 'Erakovic', '2001-01-22', 2, 26, 3)
,('Nikola', 'Milenkovic', '1997-10-12', 2, 26, 4)
,('Milos', 'Veljkovic', '1995-09-26', 2, 26, 5)
,('Nemanja', 'Maksimovic', '1995-01-26', 3, 26, 6)
,('Nemanja', 'Radonjic', '1996-02-15', 4, 26, 7)
,('Nemanja', 'Gudelj', '1991-11-16', 3, 26, 8)
,('Aleksandar', 'Mitrovic', '1994-09-16', 4, 26, 9)
,('Dusan', 'Tadic', '1988-11-20', 4, 26, 10)
,('Luka', 'Jovic', '1997-12-23', 4, 26, 11)
,('Predrag', 'Rajkovic', '1995-10-31', 1, 26, 12)
,('Stefan', 'Mitrovic', '1990-05-22', 2, 26, 13)
,('Andrija', 'Zivkovic', '1996-07-11', 3, 26, 14)
,('Srdjan', 'Babic', '1996-08-13', 2, 26, 15)
,('Sasa', 'Lukic', '1996-08-13', 3, 26, 16)
,('Filip', 'Kostic', '1992-11-01', 3, 26, 17)
,('Dusan', 'Vlahovic', '2000-01-28', 2, 26, 18)
,('Uros', 'Racic', '1998-03-17', 3, 26, 19)
,('Sergej', 'Milinkovic Savic', '1995-02-27', 3, 26, 20)
,('Filip', 'Djuricic', '1992-01-30', 4, 26, 21)
,('Darko', 'Lazovic', '1990-09-15', 3, 26, 22)
,('Vanja', 'Milinkovic Savic', '1997-02-20', 1, 26, 23)
,('Ivan', 'Ilic', '2001-03-17', 3, 26, 24)
,('Filip', 'Mladenovic', '1991-08-15', 2, 26, 25)
,('Marko', 'Grujic', '1996-04-13', 4, 26, 26);

-- polonia
INSERT INTO jugador
(nombre, apellido, fechanacimiento, idrol,idseleccion, numeroJugador) 
VALUES 
('Wojciech', 'Szczesny', '1990-04-18', 1, 22, 1)
,('Lukasz', 'Skorupski', '1991-05-05', 1, 22, 12)
,('Kamil', 'Grabara', '1999-01-08', 1, 22, 22)
,('Matty', 'Cash', '1997-08-07', 2, 22, 2)
,('Artur', 'Jedrzejczyk', '1987-11-04', 2, 22, 3)
,('Mateusz', 'Wieteska', '1997-02-11', 2, 22, 4)
,('Jan', 'Bednarek', '1996-04-12', 2, 22, 5)
,('Jakub', 'Kiwior', '2000-02-15', 2, 22, 14)
,('Kamil', 'Glik', '1988-02-03', 2, 22, 15)
,('Bartosz', 'BereszyNski', '1992-07-12', 2, 22, 18)
,('Robert', 'Gumny', '1998-06-04', 2, 22, 25)
,('Krystian', 'Bielik', '1998-01-04', 3, 22, 6)
,('Damian', 'Szymanski', '1995-06-16', 3, 22, 8)
,('Grzegorz', 'Krychowiak', '1990-01-29', 3, 22, 10)
,('Kamil', 'Grosicki', '1988-06-08', 3, 22, 11)
,('Jakub', 'Kanski', '2002-06-05',3, 22, 13)
,('Szymon', 'Zurkowski', '1997-09-25', 3, 22, 17)
,('Sebastian', 'Szymaski', '1999-05-10', 3, 22, 19)
,('Piotr', 'Zieliski', '1994-05-20', 3, 22, 20)
,('Nicola', 'Zalewski', '2002-01-23', 3, 22, 21)
,('Przemysaw', 'Frankowski', '1995-04-12', 3, 22, 24)
,('Michal', 'Skoras', '2000-02-15', 3, 22, 26)
,('Arkadiusz', 'Milik', '1994-02-28', 4, 22, 7)
,('Robert', 'Lewandowski', '1988-08-21', 4, 22, 9)
,('Karol', 'Swiderski', '1997-01-23', 4, 22, 16)
,('Krzysztof', 'Piatek', '1995-07-01', 4, 22, 23);

-- MEXICO
INSERT INTO jugador (nombre, apellido, fechanacimiento, idrol,idseleccion,numeroJugador)
VALUES
('Alfredo','Talavera','1982-09-18',1,19,1)
,('Rodolfo','Cota','1987-07-03',1,19,12)
,('Guillermo','Ochoa','1985-07-13',1,19,13)
,('Nestor','Araujo','1991-08-29',2,19,2)
,('Cesar','Montes','1997-02-24',2,19,3)
,('Edson','Alvarez','1997-10-24',3,19,4)
,('Johan','Vasquez','1998-10-22',2,19,5)
,('Gerardo','Arteaga','1998-09-07',2,19,6)
,('Hector','Moreno','1988-01-17',2,19,15)
,('Jorge','Sanchez','1990-12-10',2,19,19)
,('Jesus','Gallardo','1994-08-15',2,19,23)
,('Kevin','Alvarez','1999-01-15',2,19,26)
,('Luis','Romo','1995-06-05',3,19,7)
,('Carlos','Rodriguez','1990-01-03',3,19,8)
,('Erick','Gutierrez','1995-06-15',3,19,14)
,('Hector','Herrera','1990-04-19',3,19,16)
,('Andres','Guardado','1986-09-28',3,19,18)
,('Luis','Chavez','1996-01-15',3,19,24)
,('Raul','Jimenez','1991-05-05',4,19,9)
,('Alexis','Vega','1997-11-25',4,19,10)
,('Rogelio','Funes Mori','1991-03-05',4,19,11)
,('Orbelin','Pineda','1996-03-24',3,19,17)
,('Henry','Martin','1992-11-18',4,19,20)
,('Uriel','Antuna','1997-08-21',4,19,21)
,('Hirving','Lozano','1995-07-30',4,19,22)
,('Roberto','Alvarado','1998-09-07',4,19,25);

-- Arabia saudita
INSERT INTO jugador (nombre, apellido, fechanacimiento, idrol,idseleccion,numeroJugador)
VALUES
('Mohammed', 'Alyami', '1997-08-14', 1,24,1)
,('Mohammed', 'Al-owais', '1991-10-10', 1,24,21)
,('Nawaf', 'Alaqidi', '2000-05-10', 1,24,22)
,('Sultan', 'Alghannam', '1994-05-06', 3,24,2)
,('Abdullah', 'Madu', '1993-07-15', 2,24,3)
,('Abdullelah', 'Alamri', '1997-01-15', 2,24,4)
,('Ali', 'Albulayhi', '1989-11-21', 2,24,5)
,('Mohammed', 'Alburayk', '1992-09-15', 2,24,6)
,('Saud', 'Abdulhamid', '1999-07-18', 3,24,12)
,('Yasser', 'Alshaherani', '1992-05-25', 2,24,13)
,('Hassan', 'Altambakti', '1999-02-09', 2,24,17)
,('Salman', 'Alfaraj', '1989-08-01', 3,24,7)
,('Abdulelah', 'Almalki', '1994-10-11', 3,24,8)
,('Abdullah', 'Otayf', '1992-08-30', 3,24,14)
,('Ali', 'Alhassan', '1997-03-04', 3,24,15)
,('Sami', 'Alnaji', '1997-02-07', 3,24,16)
,('Nawaf', 'Al Abid', '1990-01-25', 3,24,18)
,('Mohamed', 'Kanno', '1992-09-15', 3,24,23)
,('Nasser', 'Aldawsari', '1998-12-19',3,24,24)
,('Riyadh', 'Sharahili', '1993-04-28', 3,24,26)
,('Feras', 'Albrikan', '2000-05-14', 3,24,9)
,('Salem', 'Aldawsari', '1991-08-19', 4,24,10)
,('Saleh', 'Alshehri', '1993-11-01', 4,24,11)
,('Hatan', 'Bahbri', '1992-07-16', 4,24,19)
,('Abdulrahman', 'Alobud', '1995-06-10', 4,24,20)
,('Haitham', 'Asiri', '2001-07-01', 4,24,25);

-- Argentina
INSERT INTO jugador (nombre, apellido, fechanacimiento, idrol,idseleccion,numeroJugador)
VALUES
('Franco', 'Armani', '1986-10-16', 1,2,1)
,('Geronimo', 'Rulli', '1992-05-20', 1,2,12)
,('Damian', 'Martinez', '1992-09-02', 1,2,23)
,('Juan', 'Foyth', '1998-01-12', 2,2,2)
,('Nicolas', 'Tagliafico', '1992-08-31', 2,2,3)
,('Gonzalo', 'Montiel', '1997-01-01', 2,2,4)
,('German', 'Pezella', '1991-06-27', 2,2,6)
,('Cristian', 'Romero', '1998-04-27', 2,2,13)
,('Nicolas', 'Otamendi', '1988-02-12', 2,2,19)
,('Lisandro', 'Martinez', '1998-01-18', 2,2,25)
,('Nahuel', 'Molina', '1998-04-06', 2,2,26)
,('Leandro', 'Paredes', '1994-06-29', 3,2,5)
,('Rodrigo', 'De Paul', '1994-05-24', 3,2,7)
,('Marcos', 'Acuna', '1991-10-28', 2,2,8)
,('Exequiel', 'Palacios', '1998-10-05', 3,2,14)
,('Thiago', 'Almada', '2001-04-26', 3,2,16)
,('Alejandro', 'Gomez', '1988-02-15', 3,2,17)
,('Rodriguez', 'Guido', '1994-04-12', 3,2,18)
,('Alexis', 'Mac Allister', '1998-12-24', 3,2,20)
,('Enzo', 'Fernandez', '2001-01-17', 3,2,24)
,('Julian', 'Alvarez', '2000-01-31', 4,2,9)
,('Lionel', 'Messi', '1987-06-24', 4,2,10)
,('Angel', 'Di Maria', '1988-02-14',3,2,11)
,('Angel', 'Correa', '1995-03-09', 4,2,15)
,('Paulo', 'Dybala', '1993-11-15', 4,2,21)
,('Lautaro', 'Martinez', '1997-08-22', 4,2,22);

-- ghana
INSERT INTO jugador(idseleccion,idrol,nombre,apellido,fechanacimiento,numeroJugador)
VALUES
(15, 1, 'Lawrence', 'Ati ZIGI', '1996-11-29',1),
(15, 1, 'Danlad', 'IBRAHIM', '2002-12-02',12),
(15, 1, 'Abdul', 'Manaf NURUDEEN', '1999-02-08',16),

(15, 2, 'Tariq', 'LAMPTEY', '2000-09-30',2),
(15, 2, 'Denis', 'ODOI', '1988-05-27',3),
(15, 2, 'Mohammed', 'SALISU', '1999-04-17',4),
(15, 2, 'Gideon', 'MENSAH', '1998-07-18',14),
(15, 2, 'Joseph', 'AIDOO', '1995-09-29',15),
(15, 2, 'Baba', 'RAHMAN', '1994-07-02',17),
(15, 2, 'Daniel', 'AMARTEY', '1994-12-21',18),
(15, 2, 'Alexander', 'DJIKU', '1994-08-09',23),
(15, 2, 'Seidu', 'ALIDU', '2000-06-04',26),

(15, 3, 'Thomas', 'PARTEY', '1993-06-13',5),
(15, 3, 'Elisha', 'OWUSU', '1997-11-07',6),
(15, 3, 'Abdul', 'Fatawu ISSAHAKU', '2004-03-08',7),
(15, 3, 'Daniel-Kofi', 'KYEREH', '1996-03-08',8),
(15, 3, 'Osman', 'BUKARI', '1998-12-13',11),
(15, 3, 'Daniel', 'AFRIYIE', '2001-06-26',13),
(15, 3, 'Kudus', 'MOHAMMED', '2000-08-02',20),
(15, 3, 'Salis', 'ABDUL SAMED', '2000-03-26',21),
(15, 3, 'Kamaldeen', 'SULEMANA', '2002-02-15',22),
(15, 3, 'Kamal', 'SOWAH', '2000-01-09',24),

(15, 4, 'Jordan', 'AYEW', '1991-09-11',9),
(15, 4, 'Andre', 'AYEW', '1989-12-17',10),
(15, 4, 'Inaki', 'WILLIAMS', '1994-06-15',19),
(15, 4, 'Antoine', 'SEMENYO', '2000-01-07',25);

-- uruguay

INSERT INTO jugador (idseleccion,idrol,nombre,apellido,fechanacimiento,numeroJugador)
VALUES (31,1,'Fernando','MUSLERA','1986-06-16',1),
(31,1,'Sebastian','SOSA','1986-08-19',12),
(31,1,'Sergio','ROCHET','1993-03-23',23),
(31,2,'Jose','GIMENEZ','1995-01-20',2),
(31,2,'Diego','GODIN','1986-02-16',3),
(31,2,'Ronald','ARAUJO','1999-03-07',4),
(31,2,'Guillermo','VARELA','1993-03-24',13),
(31,2,'Mathias','OLIVERA','1997-10-31',16),
(31,2,'Matias','VINA','1997-11-09',17),
(31,2,'Sebastian','COATES','1990-10-07',19),
(31,2,'Martin','CACERES','1987-04-07',22),
(31,2,'Jose Luis','RODRIGUEZ','1997-03-14',26),
(31,3,'Matias','VECINO','1991-08-24',5),
(31,3,'Rodrigo','BENTANCUR','1997-06-25',6),
(31,3,'Nicolas','DE LA CRUZ','1997-06-01',7),
(31,3,'Giorgian','DE ARRASCAETA','1994-06-01',10),
(31,3,'Lucas','TORREIRA','1996-02-11',14),
(31,3,'Federico','VALVERDE','1998-07-22',15),
(31,3,'Agustin','CANOBBIO','1998-10-01',24),
(31,3,'Manuel','UGARTE','2001-04-11',25),
(31,4,'Facundo','PELLISTRI','2001-12-20',8),
(31,4,'Luis','SUAREZ','1987-01-24',9),
(31,4,'Darwin','NUNEZ','1999-06-24',11),
(31,4,'Maximiliano','GOMEZ','1996-08-14',18),
(31,4,'Facundo','TORRES','2000-04-13',20),
(31,4,'Edinson','CAVANI','1987-02-14',21);

-- senegal

insert into jugador (idseleccion,nombre, apellido, fechanacimiento,idrol,numeroJugador) 
values
	(25,'Alfred', 'Gomis', '1993-09-05',1,23)
	,(25,'Sony', 'Dieng', '1994-11-23',1,1)
	,(25,'Edouard', 'Mendy', '1992-03-01',1,16)

	,(25,'Kalidou', 'Koulibaly', '1991-06-20',2,3)
	,(25,'Formose', 'Mendy', '2001-01-02',2,2)
	,(25,'Pape', 'Abou Cisse', '1995-09-14',2,4)
	,(25,'Youssouf', 'Sabaly', '1993-03-05',2,21)
	,(25,'Moussa', 'Ndiaye', '2002-06-18',2,10)
	,(25,'Cheikhou', 'Kouyate', '1989-12-21',2,8)
	,(25,'Fode', 'Ballo', '1997-01-03',2,12)
	,(25,'Ismail', 'Jakobs', '1999-08-17',2,14)
	,(25,'Abdou', 'Diallo', '1996-05-04',2,22)
	,(25,'Moustapha', 'Name', '1995-05-05',2,24)

	,(25,'Nampalys','Mendy','1992-06-23',3,6)
	,(25,'Idrissa','Gueye','1989-09-26',3,5)
	,(25,'Pathe','Ciss','1994-03-16',3,11)
	,(25,'Krepin','Diatta','1999-02-25',3,15)
	,(25,'Pape','Sarr','2002-09-14',3,17)
	,(25,'Mamadou','Ndiaye','1996-12-30',3,25)
	,(25,'Pape','Gueye','1999-01-24',3,26)

	,(25,'Famara', 'Diedhiou', '1992-12-15',4,19)
       	,(25,'Iliman', 'Ndiaye', '2000-03-06',4,13)
      	,(25,'Nicholas', 'Jackson', '2001-06-20',4,7)
      	,(25,'Boulaye', 'Dia', '1996-11-16',4,9)
       	,(25,'Cheikh', 'Dieng', '2000-03-23',4,20)
       	,(25,'Ismaïla', 'Sarr', '1998-02-25',4,18);
       	
-- Qatar
insert into jugador (idseleccion,nombre, apellido, fechanacimiento,idrol,numeroJugador) 
values
	(1,'Saad', 'Alsheeb', '1990-02-19',1,1)
	,(1,'Yousof', 'Hassan', '1996-05-24',1,21)
	,(1,'Meshaal', 'Barsham', '1998-02-14',1,22)

	,(1,'Pedro', 'Miguel', '1990-08-06',2,2)
	,(1,'Mohammed', 'Waad', '1999-09-18',2,4)
	,(1,'Tarek', 'Salman', '1997-12-05',2,5)
	,(1,'Musaab', 'Khidir', '1993-01-01',2,13)
	,(1,'Homam', 'Ahmed', '1999-08-25',2,14)
	,(1,'Bassam', 'Hisham', '1997-12-16',2,15)
	,(1,'Boualem', 'Khoukhi', '1990-07-09',2,16)
	,(1,'Ismail', 'Mohamad', '1990-04-05',2,17)

	,(1,'Abdelkarim','Hassan','1993-08-28',3,3)
	,(1,'Abdulaziz','Hatem','1990-10-28',3,6)
	,(1,'Ali','Assadalla','1993-01-19',3,8)
	,(1,'Hassan','Alhaydos','1990-12-11',3,10)
	,(1,'Karim','Boudiaf','1990-09-16',3,12)
	,(1,'Salem','Al-Hajri','1996-04-10',3,20)
	,(1,'Assim','Madibo','1996-10-22',3,23)
	,(1,'Naif','Abdulrahe','2001-07-18',3,24)
	,(1,'Jassem','Gaber','2002-02-20',3,25)
	,(1,'Moustafa','Tarek','2001-03-28',3,26)

	,(1,'Ahmed', 'Alaaeldin', '1993-01-31',4,7)
       	,(1,'Mohammed', 'Muntari', '1993-12-20',4,9)
      	,(1,'Akram', 'Afif', '1996-11-18',4,11)
      	,(1,'Khalid', 'Muneer', '1998-02-24',4,18)
       	,(1,'Almoez', 'Ali', '1996-08-19',4,19);

-- Paises bajos
INSERT INTO jugador
(idseleccion, nombre, apellido, fechanacimiento, idrol,numeroJugador)
VALUES
 (21, 'Remko', 'Pasveer', '1983-11-08', 1, 1)
,(21, 'Justin', 'Bijlow', '1998-01-22', 1, 13)
,(21, 'Andries', 'Noppert', '1994-04-07', 1, 23)
,(21, 'Jurrien', 'Timber', '2001-06-17', 2, 2)
,(21, 'Matthijs', 'de Ligt', '1999-08-12', 2, 3)
,(21, 'Virgil', 'van Dijk', '1991-07-08', 2, 4)
,(21, 'Nathan', 'Ake', '1995-02-18', 2, 5)
,(21, 'Stefan', 'de Vrij', '1992-02-05', 2, 6)
,(21, 'Tyrell', 'Malacia', '1999-08-17', 2, 16)
,(21, 'Daley', 'Blind', '1990-03-09', 2, 17)
,(21, 'Denzel', 'Dumfries', '1996-04-18', 2, 22)
,(21, 'Jeremie', 'Frimpong', '2000-12-10', 2, 26)
,(21, 'Steven', 'Bergwijn', '1997-10-08', 3, 7)
,(21, 'Cody', 'Gakpo', '1999-05-07', 3, 8)
,(21, 'Luuk', 'de Jong', '1990-08-27', 3, 9)
,(21, 'Memphis', 'Depay', '1994-02-13', 3, 10)
,(21, 'Noa', 'Lang', '1999-06-17', 3, 12)
,(21, 'Vincent', 'Janssen', '1994-06-15', 3, 18)
,(21, 'Wout', 'Weghorst', '1992-08-07', 3, 19)
,(21, 'Steven', 'Berghuis', '1991-12-19', 4, 11)
,(21, 'Davy', 'Klaassen', '1993-02-21', 4, 14)
,(21, 'Marten', 'de Roon', '1991-03-29', 4, 15)
,(21, 'Teun', 'Koopmeiners', '1998-02-28', 4, 20)
,(21, 'Frenkie', 'de Jong', '1997-05-12', 4, 21)
,(21, 'Kenneth', 'Taylor', '2002-05-16', 4, 24)
,(21, 'Xavi', 'Simons', '2003-04-21', 4, 25);

-- ecuador
INSERT INTO jugador (idseleccion,idrol,nombre,apellido,fechanacimiento,numeroJugador) 
VALUES
(11,1,'Hernan','Galindez','1987-03-30',1),
(11,1,'Moises','Ramirez','2000-09-09',12),
(11,1,'Alexander','Dominguez','1987-06-05',22),
(11,2,'Felix','Torres','1997-01-11',2),
(11,2,'Piero','Hincapie','2002-01-09',3),
(11,2,'Robert','Arboleda','1991-10-22',4),
(11,2,'William','Pacho','2001-10-16',6),
(11,2,'Pervis','Estupinan','1998-01-21',7),
(11,2,'Xavier','Arreaga','1994-09-28',14),
(11,2,'Angelo','Preciado','1998-02-18',17),
(11,2,'Diego','Palacios','1999-07-12',18),
(11,2,'Jackson','Porozo','2000-08-04',25),
(11,3,'Jose','Cifuentes','1999-03-12',5),
(11,3,'Carlos','Gruezo','1995-04-19',8),
(11,3,'Eduar','Preciado','1998-02-18',9),
(11,3,'Romario','Ibarra','1994-09-24',10),
(11,3,'Angel','Mena','1988-01-21',15),
(11,3,'Jeremy','Sarmiento','2002-06-16',16),
(11,3,'Gonzalo','Plata','2000-11-01',19),
(11,3,'Alan','Franco','1998-08-21',21),
(11,3,'Moises','Caicedo','2001-11-02',23),
(11,4,'Michael','Estrada','1996-04-07',11),
(11,4,'Enner','Valencia','1989-11-04',13),
(11,4,'Djorkaeff','Reasco','1999-01-18',24),
(11,4,'Fernando','Gaibor','1991-07-06',20),
(11,4,'Cristian','Nunez','1995-12-09',26);



-- Partidos

-- Fase de grupos

-- Grupo A
insert into partido (idseleccion1, idseleccion2, idestadio, idfase, fecha,  tExtraPrimero, tExtraSegundo, penales, goles1, goles2, ganador)
values

(1, 11, 1, 1,'2022-11-20','00:04','00:03', 0, 0, 2, "Ecuador"),
(25, 21, 4, 1,'2022-11-21','00:02','00:09', 0, 0, 2, "Países Bajos"),        
(1, 25, 4, 1,'2022-11-25', '00:03','00:01', 0, 1, 3, "Senegal"),
(11, 21, 6, 1,'2022-11-25','00:01','00:08', 0, 1, 1, "Empate"),
(21, 1, 1, 1,'2022-11-29', '00:04','00:01', 0, 2, 0, "Países Bajos"),
(11, 25, 6, 1,'2022-11-29','00:04','00:05', 0, 1, 2, "Senegal")
;


-- Grupo B
insert into partido (idseleccion1, idseleccion2, idestadio, idfase, fecha, tExtraPrimero, tExtraSegundo, penales, goles1, goles2, ganador)
values
	(12, 16, 6, 1,'2022-11-21','00:01','00:13',0, 6, 2, "Inglaterra"),
	(30, 32, 3, 1,'2022-11-21','00:02','00:10',0, 1, 1, "Empate"),
	(32, 16, 3, 1,'2022-11-25','00:03','00:15',0, 0, 2, "Irán"),
	(12, 30, 1, 1,'2022-11-25','00:01','00:02',0, 0, 0, "Empate"),
	(32, 12, 7, 1,'2022-11-29','00:03','00:02',0, 0, 3, "Inglaterra"),
	(16, 30, 4, 1,'2022-11-29','00:02','00:06',0, 0, 1, "Estados Unidos");

-- Grupo C

insert into partido (idseleccion1, idseleccion2, idestadio, idfase, fecha, tExtraPrimero, tExtraSegundo, penales, goles1, goles2, ganador)
values
	(2, 24, 7, 1,'2022-11-22','00:04','00:10',0,1,2,"Arabia Saudita"),
	(19, 22, 8,1,'2022-11-22','00:02','00:03',0,0,0,"Empate"),
	(22, 24, 5, 1,'2022-11-26','00:04','00:05',0,2,0,"Polonia"),
	(2, 19, 7, 1,'2022-11-26','00:02','00:03',0,2,0,"Argentina"),
	(22, 2, 8, 1,'2022-11-30','00:03','00:05',0,0,2,"Argentina"),
	(24, 19, 7, 1,'2022-11-30', '00:03' , '00:07' , 0,1,2,"México");

-- Grupo D
insert into partido (idseleccion1, idseleccion2, idestadio, idfase, fecha, tExtraPrimero, tExtraSegundo, penales, goles1, goles2, ganador)
values
	(10, 29, 5, 1,'2022-11-22','00:01','00:02',0,0,0,"Empate"),
	(13, 3, 2, 1,'2022-11-22','00:04','00:05',0,4,1,"Francia"),
	(29, 3, 2, 1,'2022-11-26','00:01','00:03',0,0,1,"Australia"),
	(13, 10, 8, 1,'2022-11-26','00:02','00:02',0,2,1,"Francia"),
	(10, 3, 5, 1,'2022-11-30','00:01', '00:02', 0,0,1,"Australia"),
	(13, 29, 2, 1,'2022-11-30','00:01', '00:03', 0,0,1,"Tunez");
	
-- grupos e al h

insert into partido (idseleccion1, idseleccion2, idestadio, 
idfase, fecha, tExtraPrimero, tExtraSegundo, penales, goles1, goles2, ganador) values
(14, 17, 6, 1,'2022-11-23',  '00:02', '00:03', 0, 1, 2, "Japón")
,(27, 8, 4, 1,'2022-11-23',  '00:01', '00:07', 0, 7, 0, "España")
,(17, 8, 3, 1,'2022-11-27',  '00:01', '00:05', 0, 0, 1, "Costa Rica")
,(27, 14, 1, 1,'2022-11-27', '00:02', '00:04', 0, 1, 1, "Empate")
,(17, 27, 6, 1,'2022-12-01', '00:01', '00:04', 0, 2, 1, "Japón")
,(8, 14, 1, 1,'2022-12-01',  '00:02', '00:03', 0, 2, 4, "Alemania")

,(20, 9, 1, 1,'2022-11-23', '00:03', '00:02', 0, 0, 0, "Empate")
,(4, 7, 3, 1,'2022-11-23',  '00:01', '00:01', 0, 1, 0, "Bélgica")
,(4, 20, 4, 1,'2022-11-27', '00:02', '00:05', 0, 0, 2, "Marruecos")
,(9, 7, 6, 1,'2022-11-27',  '00:02', '00:04', 0, 4, 1, "Croacia")
,(9, 4, 3, 1,'2022-12-01',  '00:01', '00:02', 0, 0, 0, "Empate")
,(7, 20, 4, 1,'2022-12-01', '00:03', '00:06', 0, 1, 2, "Marruecos")

,(28, 6, 2, 1,'2022-11-24', '00:03', '00:02', 0, 1, 0, "Suiza")
,(5, 26, 7, 1,'2022-11-24', '00:05', '00:04', 0, 2, 0, "Brasil")
,(6, 26, 2, 1,'2022-11-28', '00:04', '00:03', 0, 3, 3, "Empate")
,(5, 28, 8, 1,'2022-11-28', '00:05', '00:03', 0, 1, 0, "Brasil")
,(6, 5, 7, 1,'2022-12-02',  '00:03', '00:03', 0, 1, 0, "Camerún")
,(26, 28, 8, 1,'2022-12-02','00:02', '00:10', 0, 2, 3, "Suiza")

,(31, 18, 5, 1,'2022-11-24', '00:03', '00:08', 0, 0, 0, "Empate")
,(23, 15, 8, 1,'2022-11-24', '00:01', '00:05', 0, 3, 2, "Portugal")
,(18, 15, 5, 1,'2022-11-28', '00:04', '00:11', 0, 2, 3, "Ghana")
,(23, 31, 7, 1,'2022-11-28', '00:01', '00:03', 0, 2, 0, "Portugal")
,(18, 23, 5, 1,'2022-12-02', '00:01', '00:03', 0, 2, 1, "Corea del Sur")
,(15, 31, 2, 1,'2022-12-02', '00:04', '00:10', 0, 0, 2, "Uruguay");

-- iskander 

-- OCTAVOS DE FINAL

INSERT INTO PARTIDO(idseleccion1, idseleccion2,idestadio, idfase, fecha, textraprimero, textrasegundo, penales, prorrogatotal, goles1, goles2, ganador, penales1 ,penales2) values
(20, 27, 5, 2, '2022-12-06', '00:01', '00:06', 1, '00:36', 0, 0, "Marruecos",3,0)
,(17, 9, 2, 2, '2022-12-05', '00:03', '00:04', 1, '00:34',1,1,"Croacia",1,3)
,(5, 18, 8, 2, '2022-12-05', '00:05', '00:04', 0, '00:00',4,1,"Brasil",NULL,NULL)
,(23, 28, 7, 2, '2022-12-06', '00:04', '00:05', 0, '00:00',6,1,"Portugal",NULL,NULL)
,(21, 30, 6, 2, '2022-12-03', '00:02', '00:07', 0, '00:00',3,1,"Países Bajos",NULL,NULL)
,(2, 3, 3, 2, '2022-12-03', '00:03', '00:08', 0, '00:00', 2, 1, "Argentina",NULL,NULL)
,(13, 22, 4, 2, '2022-12-04', '00:03', '00:09', 0, '00:00', 3, 1, "Francia",NULL,NULL)
,(12, 25, 1, 2, '2022-12-04', '00:03', '00:05', 0, '00:00',3,0,"Inglaterra",NULL,NULL);

-- CUARTOS DE FINAL

INSERT INTO PARTIDO(idseleccion1, idseleccion2,idestadio, idfase, fecha, textraprimero, textrasegundo, penales, prorrogatotal, goles1, goles2, ganador,penales1 ,penales2) VALUES
(9, 5, 5, 3, '2022-12-09', '00:02', '00:04', 1, '00:36', 1, 1, "Croacia", 4, 2)
,(21, 2, 7, 3, '2022-12-09', '00:07', '00:13', 1, '00:32', 2, 2, "Argentina", 3, 4)
,(20, 23, 4, 3, '2022-12-10', '00:03', '00:09', 0, '00:00', 1, 0, "Marruecos",NULL,NULL)
,(12, 13, 1, 3, '2022-12-10', '00:05', '00:11', 0, '00:00', 1, 2, "Francia",NULL,NULL);


-- SEMIFINALES

INSERT INTO PARTIDO(idseleccion1, idseleccion2,idestadio, idfase, fecha, textraprimero, textrasegundo, penales, prorrogatotal, goles1, goles2, ganador) VALUES
(2, 9, 7, 4, '2022-12-13', '00:05', '00:05', '0', NULL, 3, 0, "Argentina")
,(13, 20, 1, 4, '2022-12-14', '00:04', '00:06', '0', NULL, 2, 0, "Francia");

-- PARTIDO POR EL TERCER LUGAR

INSERT INTO PARTIDO(idseleccion1, idseleccion2,idestadio, idfase, fecha, textraprimero, textrasegundo, penales, prorrogatotal, goles1, goles2, ganador) VALUES
(9, 20, 6, 5, '2022-12-17', '00:02', '00:07', '0', NULL, 2, 1, "Croacia");

-- FINAL

INSERT INTO PARTIDO(idseleccion1, idseleccion2,idestadio, idfase, fecha, textraprimero, textrasegundo, penales, prorrogatotal, goles1, goles2, ganador, penales1 ,penales2) VALUES
(2, 13, 7, 6, '2022-12-18', '00:08', '00:09', '1', '00:37', 3, 3, "Argentina", 4, 2);


-- cronologia
-- grupo a
iNSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- QATAR VS ECUADOR
(1, 755, NULL, '15', 2, NULL)
,(1, 829, NULL, '16', 1, NULL)
,(1, 829, NULL, '16', 5, "Penal")
,(1, 780, NULL, '22', 2, NULL)
,(1, 827, NULL, '29', 2, NULL)
,(1, 829, NULL, '31', 5, NULL)
,(1, 770, NULL, '36', 2, NULL)
,(1, 831, NULL, '56', 2, NULL)
,(1, 824, 822, '68', 4, NULL)
,(1, 759, 769, '71', 4, NULL)
,(1, 777, 780, '72', 4, NULL)
,(1, 819, 829, '77', 4, NULL)
,(1, 778, NULL, '78', 2, NULL)
,(1, 832, 828, '90', 4, NULL)
,(1, 826, 827, '90', 4, NULL),

-- SENEGAL VS PAÍSES BAJOS
(2, 785, NULL, '56', 2, NULL)
,(2, 739, 740, '62', 4, NULL)
,(2, 796, 798, '62', 4, NULL)
,(2, 753, 752, '69', 4, NULL)
,(2, 748, 737, '73', 4, NULL)
,(2, 751, 745, '73', 4, NULL)
,(2, 801, 793, '79', 4, NULL)
,(2, 803, 800, '79', 4, NULL)
,(2, 794, NULL, '84', 5, NULL)
,(2, 742, NULL, '90+4', 2, NULL)
,(2, 802, 794, '90+4', 4, NULL)
,(2, 743, NULL, '90+6', 2, NULL)
,(2, 801, NULL, '90+9', 5, NULL),

-- QATAR VS SENEGAL
(3, 765, NULL, '20', 2, NULL)
,(3, 752, NULL, '30', 2, NULL)
,(3, 752, NULL, '41', 5, NULL)
,(3, 762, NULL, '45+2', 2, NULL)
,(3, 749, NULL, '48', 5, NULL)
,(3, 739, NULL, '52', 2, NULL)
,(3, 744, 745, '64', 4, NULL)
,(3, 767, 770, '69', 4, NULL)
,(3, 777, 769, '74', 4, NULL)
,(3, 753, 749, '74', 4, NULL)
,(3, 750, 754, '74', 4, NULL)
,(3, 746, 742, '77', 4, NULL)
,(3, 734, NULL, '77', 4, NULL)
,(3, 777, NULL, '78', 5, NULL)
,(3, 759, 758, '83', 4, NULL)
,(3, 760, 762, '83', 4, NULL)
,(3, 753, 739, '84', 5, NULL)
,(3, 744, NULL, '87', 2, NULL)
,(3, 772, NULL, '90+1', 2, NULL),

-- PAÍSES BAJOS VS ECUADOR
(4, 794, NULL, '6', 5, NULL)
,(4, 796, 793, '45+1', 4, NULL)
,(4, 829, NULL, '49', 5, NULL)
,(4, 831, NULL, '57', 2, NULL)
,(4, 800, 801, '69', 4, NULL)
,(4, 824, 828, '74', 4, NULL)
,(4, 802, 803, '79', 4, NULL)
,(4, 799, 794, '80', 4, NULL)
,(4, 832, 829, '90', 4, NULL)
,(4, 822, 825, '90', 4, NULL),

-- QATAR VS PAÍSES BAJOS
(5, 794, NULL, '26', 5, NULL)
,(5, 804, NULL, '49', 5, NULL)
,(5, 787, NULL, '52', 2, NULL)
,(5, 770, 772, '64', 4, NULL)
,(5, 777, 780, '64', 4, NULL)
,(5, 768, 769, '64', 4, NULL)
,(5, 800, 801, '66', 4, NULL)
,(5, 798, 796, '66', 4, NULL)
,(5, 799, 794, '83', 4, NULL)
,(5, 803, 802, '83', 4, NULL)
,(5, 776, 767, '85', 4, NULL)
,(5, 761, 765, '85', 4, NULL)
,(5, 805, 804, '86', 4, NULL),
 
-- SENEGAL VS ECUADOR
(6, 754, NULL, '44', 1, NULL)
,(6, 754, NULL, '44', 5, "Penal")
,(6, 824, 826, '45+1', 4, NULL)
,(6, 819, 820, '45+1', 4, NULL)
,(6, 830, 828, '64', 4, NULL)
,(6, 743, NULL, '66', 2, NULL)
,(6, 827, NULL, '67', 5, NULL)
,(6, 732, NULL, '70', 5, NULL)
,(6, 742, 744, '74', 4, NULL)
,(6, 753, 750, '75', 4, NULL)
,(6, 818, 816, '85', 4, NULL)
,(6, 734, 752, '90+5', 4, NULL);

-- alemania vs costa rica grupo E 
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES


	(30,102,NULL,"10",5,null),
    (30,87,92,"46",4,null),
    (30,69,71,"46",4,null),
    (30,101,98,"55",4,null),
    (30,70,NULL,"58",5,null),
    (30,100,99,"66",4,null),
    (30,93,84,"67",4,null),
    (30,56,NULL,"70",5,null),
    (30,100,NULL,"73",5,null),
    (30,63,77,"74",4,null),
    (30,66,57,"74",4,null),
    (30,58,NULL,"76",2,null),
    (30,100,NULL,"85",5,null),
    (30,101,NULL,"89",5,null),
    -- (30, , ,"90",5,null),
    (30,76,59,"90+3",4,null),
    (30,73,70,"90+3",4,null),
    (30,83,86,"90+3",4,NULL);
-- gerly
-- cronologia de todos los partidos del grupo H en la fase de grupos 


INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- URUGUAY VS REPUBLICA DE COREA 31,18
(43,713,NULL,'57',2,NULL) 
,(43,728,724,'64',4,'entra E.Cavani sale L.Suarez')
,(43,454,465,'74',4,"entra Cho Gue-Sung sale HWANG Uijo")
,(43,459,461,'74',4,"entra Son Jun-Ho sale Lee Jae-Sung")
,(43,448,447,'75',4,"entra KIM MINJAE sale KIM Jinsu")

,(43,717,715,'78',4,"entra N . de la Cruz, sale M.Vecino")
,(43,711,710,'79',4,"entra M.Viña sale M.Olivera")
,(43,452,NULL,'79',2,NULL);
 
-- PORTUGAL VS GHANA 23,15
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
(44,682,NULL,'45',2,NULL)
,(44,700,NULL,'49',2,NULL)
,(44,118,123,'56',4,"entra William Carvalho sale Octavio")
,(44,679,NULL,'57',2,NULL)
,(44,124,NULL,'65',1,null)
,(44,124,NULL,'65',5,"Penal") -- ESTE ES UN PENAL, QUEDA A REVISION DE LOS DBA
,(44,680,679,'66',4,"entra T. Lamptey sale A.Seidu")
,(44,700,NULL,'73',5,NULL)
,(44,128,121,'77',4,"entra Rafael Leao sale Ruben Nieves")
,(44,699,700,'77',4,"entra J. Ayew sale A.Ayew")
,(44,693,682,'77',4,"entra O.Bukari sale M.Kudus")
,(44,127,NULL,'78',5,NULL)
,(44,128,NULL,'89',5,NULL)
,(44,116,126,'88',4,"entra Joao Palhinha sale Bernardo Silva")
,(44,120,127,'88',4,"Entra Joao Mario sale Joao Felix")
,(44,130,124,'88',4,"Entra Goncalo Ramos sale Cristiano Ronaldo")
,(44,693,NULL,'89',5,NULL)
,(44,112,NULL,'90+1',2,NULL)
,(44,701,NULL,'90+1',2,NULL)
,(44,702,696,'90+2',4,"entra A.Semenyo sale S.Abdul Samed")
,(44,692,687,'90+2',4,"Entra D.Kyereh sale A.Djiku")
,(44,117,NULL,'90+5',2,NULL);

-- REPUBLICA DE COREA VS GHANA 18,15
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
(45,686,NULL,'21',2,NULL)
,(45,682,NULL,'24',5,NULL)
,(45,455,NULL,'27',2,NULL)
,(45,695,NULL,'34',5,NULL)
,(45,460,463,'46',4,"entra Na San-Ho sale Jeon Woo-Yeong")
,(45,461,462,'57',4,"entra Lee Kang In sale Kwon Chang-Hoon")
,(45,454,NULL,'58',5,NULL)
,(45,454,NULL,'61',5,NULL)
,(45,695,NULL,'68',5,NULL)
,(45,680,NULL,'73',2,NULL)
,(45,451,NULL,'77',2,NULL)
,(45,692,700,'78',4,"entra D.Kyereh, sale A.Ayew")
,(45,697,699,'78',4,"entra K.Sulemana sale J.Ayew")
,(45,681,680,'78',4,"entra D.Odou sale T.Lamptey")
,(45,465,455,'79',4,"entra Hwang Ui-Jo sale Jung Woo-Young");

-- PORTUGAL VS URUGUAY 23,31
-- el id esta mal, le corresponde el 46 xddd a todos los que tienen el 48
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
(46,716,NULL,'6',2,NULL)
,(46,121,NULL,'38',2,NULL)
,(46,111,113,'42',4,"entra Raphaël Guerreiro sale Nuno Mendes")
,(46,710,NULL,'44',2,NULL)
,(46,117,NULL,'54',5,NULL)
,(46,723,707,'62',4,"entra F. Pellistri sale D. Godín")
,(46,718,715,'62',4,"entra G. de Arrascaeta sale M. Vecino")
,(46,128,121,'69',4,"entra Rafael Leão sale Rúben Neves")
,(46,726,725,'72',4,"entra M. Gómez sale D. Núñez")
,(46,724,728,'73',4,"entra L. Suárez sale E. Cavani")
,(46,127,NULL,'77',2,NULL)
,(46,130,124,'82',4,"entra Goncalo Ramos sale Cristiano Ronaldo")
,(46,122,127,'82',4,"entra Matheus Nunes sale João Félix")
,(46,116,118,'82',4,"entra João Palhinha sale William Carvalho")
,(46,711,710,'86',4,"entra M. Viña sale M. Olivera")
,(46,110,NULL,'89',2,NULL)
,(46,117,NULL,'90+3',1,NULL)
,(46,117,NULL,'90+3',5,"Penal");

-- REPUBLICA DE COREA VS PORTUGAL 18,23
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
(47,129,NULL,'5',5,NULL)
,(47,451,NULL,'27',5,NULL)
,(47,461,NULL,'36',2,NULL)
,(47,125,124,'65',4,"entra Andre Silva sale Cristiano Ronaldo ")
,(47,128,121,'65',4,"entra Rafael Leão sale Rúben Neves")
,(47,116,122,'65',4,"entra João Palhinha sale Matheus Nunes")
,(47,465,461,'66',4,"entra Hwang Hee-Chan entra Lee Jae-Sung ")
,(47,459,451,'81',4,"entra Son Jun-Ho sale Kim Young-Gwon")
,(47,465,463,'81',4,"entra Hwang Ui-Jo sale Lee Kang-In")
,(47,126,119,'81',4,"entra Bernardo Silva sale Vitinha")
,(47,118,120,'86',4,"entra William Carvalho sale João Mário")
,(47,456,NULL,'90+3',5,NULL);

-- GHANA VS URUGUAY 15,31
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
(48,700,NULL,'21',1,NULL)
,(48,718,NULL,'26',5,null)
,(48,718,NULL,'26',5,null)
,(48,715,716,'34',4,"Entra M. Vecino sale R. Bentancur")
,(48,697,699,'46',4,"entra O. Bukari sale A. Ayew")
,(48,724,NULL,'60',2,null)
,(48,728,724,'66',4,"entra E. Cavani sale L. Suárez ")
,(48,717,723,'66',4,"entra N. de la Cruz sale F. Pellistri")
,(48,702,701,'72',4,"entra A. Semenyo sale I. Williams")
,(48,692,696,'72',4,"entra D. Kyereh sale S. Abdul Samed")
,(48,726,725,'80',4,"entra M. Gómez sale D. Núñez")
,(48,721,718,'80',4,"entra A. Canobbio sale G. de Arrascaeta")
,(48,697,NULL,'86',2,NULL)
,(48,679,NULL,'90+8',2,null)
,(48,728,NULL,'90+10',2,null);

    -- Francia VS Polonia
insert into cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle)
VALUES
    
-- ESPAÑA VS MARRUECOS
(49, 17, 15, '63', 4, NULL)
,(49, 19, 20, '63', 4, NULL)
,(49, 206, 201, '66', 4, NULL)
,(49, 22, 21, '75', 4, NULL)
,(49, 11, NULL, '76', 2, NULL)
,(49, 208, 200, '82', 4, NULL)
,(49, 205, 207, '82', 4, NULL)
,(49, 193, 191, '82', 4, NULL)
,(49, 189, 187, '84', 4, NULL)
,(49, 188, NULL, '90', 2, NULL)
,(49, 26, 24, '98', 4, NULL)
,(49, 7, 9, '98', 4, NULL)
,(49, 25, 22, '118', 4, NULL)
,(49, 192, 196, '120', 4, NULL)
,(49, 205, NULL, 'PEN', 5, NULL)
,(49, 25, NULL, 'PEN', 1, NULL)
,(49, 195, NULL, 'PEN', 5, NULL)
,(49, 17, NULL, 'PEN', 1, NULL)
,(49, 192, NULL, 'PEN', 1, NULL)
,(49, 12, NULL, 'PEN', 1, NULL)
,(49, 186, NULL, 'PEN', 5, NULL)
 
 -- JAPÓN VS CROACIA
,(50, 52, NULL, '43', 5, NULL)
,(50, 229, NULL, '55', 5, NULL)
,(50, 233, 232, '62', 4, NULL)
,(50, 49, 52, '64', 4, NULL)
,(50, 41, 33, '64', 4, NULL)
,(50, 226, 230, '68', 4, NULL)
,(50, 35, 46, '75', 4, NULL)
,(50, 42, 40, '87', 4, NULL)
,(50, 222, NULL, '90', 2, NULL)
,(50, 225, 222, '99', 4, NULL)
,(50, 221, 223, '99', 4, NULL)
,(50, 47, 44, '105', 4, NULL)
,(50, 231, 233, '105', 4, NULL)
,(50, 234, 229, '105', 4, NULL)
,(50, 213, NULL, '116', 2, NULL)
,(50, 42, NULL, 'PEN', 1, NULL)
,(50, 225, NULL, 'PEN', 5, NULL)
,(50, 41, NULL, 'PEN', 1, NULL)
,(50, 224, NULL, 'PEN', 5, NULL)
,(50, 49, NULL, 'PEN', 5, NULL)
,(50, 231, NULL, 'PEN', 1, NULL)
,(50, 36, NULL, 'PEN', 1, NULL)
,(50, 226, NULL, 'PEN', 5, NULL);

-- gabo

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Marruecos vs Croacia
( 31, 226, 225, '46', 4, 'entra Mario Pasalic y sale Nikola Vlasic')
,( 31, 193, 191, '60', 4, 'entra Yahya Attiat-Allah y sale Noussair Mazraqui')
,( 31, 206, 201, '65', 4, 'entra Abde Ezzalzouli y sale Sofiane Boufal')
,( 31, 231, 230, '71', 4, 'entra Marko Livaja y sale Andrej Kramaric')
,( 31, 194, NULL, '78', 2, NULL)
,( 31, 221, 222, '79', 4, 'entra Lovro Majer y sale Mateo Kovacic')
,( 31, 204, 207, '81', 4, 'entra Abderrazak Hamdallah y sale Youssef En Nesyri')
,( 31, 205, 196, '81', 4, 'entra Abdelhamid Sabiri y sale Azzedine Ounahi')
,( 31, 234, 229, '90', 4, 'entra Mislav Orsic y sale Ivan Perisic');

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Bélgica vs Canadá
( 32, 150, NULL, '9', 2, NULL)
,( 32, 154, NULL, '44', 5, NULL)
,( 32, 145, 142, '46', 4, 'entra Amadou Onan y sale Youri Tielemans')
,( 32, 143, 150, '46', 4, 'entra Thomas Meunier y sale Yannick Carrasco')
,( 32, 143, NULL, '54', 2, NULL)
,( 32, 145, NULL, '56', 2, NULL)
,( 32, 180, 170, '58', 4, 'entra Cyle Larin y sale Junior Hoilett')
,( 32, 173, 149, '58', 4, 'entra Ismael Kone y sale Atiba Hutchinson')
,( 32, 152, 149, '62', 4, 'entra Leandro Trossard y sale Eden Hazard')
,( 32, 161, 164, '74', 4, 'entra Sam Adekugbe y sale Richie Laryea')
,( 32, 155, 154, '78', 4, 'entra Lois Openda y sale Michy Batshuayi')
,( 32, 175, 178, '81', 4, 'entra Liam Millar y sale Tajon Buchanan')
,( 32, 174, 168, '81', 4, 'entra Jonathan Osorio y sale Sthephen Eustaquio')
,( 32, 181, NULL, '81', 2, NULL)
,( 32, 160, NULL, '83', 2, NULL);

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Bélgica vs Marruecos
( 33, 145, NULL, '29', 2, NULL)
,( 33, 142, 145, '60', 4, 'entra Youri Tielemans y sale Amadou Onana')
,( 33, 151, 149, '60', 4, 'entra Dries Mertens y sale Eden Hazard')
,( 33, 205, 186, '68', 4, 'entra Abdelhamid Sabiri y sale Acharaf Hakimi')
,( 33, 203, 200, '68', 4, 'entra Yahya Attiat-Allah y sale Selim Amallah')
,( 33, 199, 201, '73', 4, 'entra Zakaria Aboukhlal y sale Sofiane Boufal')
,( 33, 204, 207, '73', 4, 'entra Abderrazak Hamdallah y sale Youssef En Nesyri')
,( 33, 188, NULL, '73', 5, NULL)
,( 33, 153, 154, '75', 4, 'entra Charles De Ketelare y sale Michy Batshuayi')
,( 33, 152, 144, '75', 4, 'entra Leandro Trossard y sale Thorgan Hazard')
,( 33, 189, 196, '78', 4, 'entra Jawald El Yamiq y sale Azzeline Ounahi')
,( 33, 148, 143, '81', 4, 'entra Romelu Lukaku y sale Thomas Meunier')
,( 33, 199, NULL, '90 + 2', 5, NULL)
,( 33, 205, NULL, '90 + 5', 2, NULL);

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Croacia vs Canadá
( 34, 181, NULL, '2', 5, NULL)
,( 34, 230, NULL, '36', 5, NULL)
,( 34, 231, NULL, '44', 5, NULL)
,( 34, 174, 180, '46', 4, 'entra Jonathan Osorio y sale Cyle Larin')
,( 34, 173, 168, '46', 4, 'entra Ismael Kone y sale Stephen Eustaquio')
,( 34, 178, NULL, '52', 2, NULL)
,( 34, 215, NULL, '56', 2, NULL)
,( 34, 232, 231, '60', 4, 'entra Bruno Petkovic y sale Marko Livaja')
,( 34, 170, 164, '62', 4, 'entra Junior Hoilett y sale Richie Laryea')
,( 34, 230, NULL, '70', 5, NULL)
,( 34, 177, 182, '72', 4, 'entra Lucas Cavallini y sale Jonathan David')
,( 34, 161, 171, '72', 4, 'entra Sam Adekugbe y sale Atiba Hutchinson')
,( 34, 225, 230, '72', 4, 'entra Nikola Vlasic y sale Andre Kramaric')
,( 34, 162, NULL, '85', 2, NULL)
,( 34, 223, NULL, '85', 2, NULL)
,( 34, 234, 229, '86', 4, 'entra Mislav orsic y sale Ivan Perisic')
,( 34, 221, 222, '86', 4, 'entra Lovro Majer y sale Mateo Kovacic')
,( 34, 226, 223, '86', 4, 'entra Mario Pasalic y sale Luka Modric')
,( 34, 221, NULL, '90 + 4', 5, NULL);

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Croacia vs Bélgica
( 35, 148, 151, '46', 4, 'entra Romelu Lukaku y sale Dries Mertens')
,( 35, 144, 152, '59', 4, 'entra Thorgan Hazard y sale Leandro Trossard')
,( 35, 232, 231, '64', 4, 'entra Bruno Petrovic y sale Marko Livaja')
,( 35, 226, 230, '64', 4, 'entra Mario Pasalic y sale Andrej Kramaric')
,( 35, 138, NULL, '67', 2, NULL)
,( 35, 156, 150, '72', 4, 'entra Jeremy Doku y sale Yannick Carrasco')
,( 35, 142, 138, '72', 4, 'entra Youri Tielemans y sale Leander Dendoncker')
,( 35, 149, 143, '87', 4, 'entra Eden Hazard y sale Thomas Meunier')
,( 35, 221, 222, '90 + 2', 4, 'entra Lavro Majer y sale Mateo Kovacic');

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Canadá vs Marruecos
( 36, 195, NULL, '4', 5, NULL)
,( 36, 170, NULL, '7', 2, NULL)
,( 36, 207, NULL, '23', 5, NULL)
,( 36, 174, NULL, '26', 2, NULL)
,( 36, 180, NULL, '40', 5, NULL)
,( 36, 161, NULL, '45 + 2', 2, NULL)
,( 36, 182, 180, '60', 4, 'entra Jonathan David y sale Cyle Larin')
,( 36, 171, 172, '60', 4, 'entra Atiba Hutchinson y sale Marck-Anthony Kaye')
,( 36, 172, 161, '60', 4, 'entra Ismael Kone y sale Sam Adekugbe')
,( 36, 199, 201, '65', 4, 'entra Zakaria Aboukhlal y sale Sofiane Boufal')
,( 36, 200, 205, '65', 4, 'entra Selim Amallah y sale Abdelhamid Sabiri')
,( 36, 164, 174, '65', 4, 'entra Richie Laryea y sale Jonathan Osorio')
,( 36, 176, 170, '76', 4, 'entra David Wotherspoon y sale Junior Hoilett')
,( 36, 204, 195, '76', 4, 'entra Abderrazack Hamdallah y sale Hakim Ziyech')
,( 36, 189, 196, '76', 4, 'entra Jawad El Yamiq y sale Azzedine Ounahi')
,( 36, 163, NULL, '84', 2, NULL)
,( 36, 203, 186, '85', 4, 'entra Yahya Jabrane y sale Achraf Hakimi');


INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
(51, 488, NULL, '7', 5, 'Gol de Vinicius Jr')
,(51, 478, NULL, '13', 5, 'Gol de Neymar')
,(51, 477, NULL, '29', 5, 'Gol de richarlison')
,(51, 475, NULL, '36', 5, 'Gol de Lucas Paqueta')
,(51, 455, NULL, '44', 2, 'Tarjeta amarilla a Jung Wooyoung')
,(51, 449, 447, '46', 4, 'entra Hong Chul y sale Kim Jinsu')
,(51, 459, 455, '46', 4, 'entra Son Junho y sale Jung Wooyoung')
,(51, 481, 482, '63', 4, 'entra Dani Alves y sale Eder Militao')
,(51, 458, 456, '65', 4, 'entra Paik Seungho y sale Hwang Inbeam')
,(51, 494, 488, '72', 4, 'entra Gabriel Martinelli y sale Vinicius Jr')
,(51, 492, 470, '72', 4, 'entra Bremer y sale Danilo')
,(51, 461, 460, '74', 4, 'entra Lee Kangin y sale Lee Jaesung')
,(51, 458, NULL, '76', 5, 'Gol de Paik Seungho')
,(51, 465, 454, '80', 4, 'entra Hwang Uijo y sale Cho Guesung')
,(51, 480, 469, '80', 4, 'entra Weverton y sale Alisson')
,(51, 489, 478, '80', 4, 'entra Rodrygo y sale Neymar');

-- Inglaterra Senegal

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
	(56,379,NULL,'38',5, 'Gol de Jordan HENDERSON'),
	(56,387,NULL,'45+3',5, 'Gol de Harry KANE'),
	(56,745,746,'46',4,'Cambio de Krepin DIATTA a Pape SARR'),	
	(56,747,753,'46',4,'Cambio de Iliman NDIAYE a Cheikh DIENG'),
	(56,744,748,'46',4,'Cambio de Pathe CISS a Pape GUEYE'),
	(56,390,NULL,'57',5,'Gol de Bukayo SAKA'),	
	(56,390,385,'65',4,'Cambio de Bukayo SAKA a Marcus RASHFORD'),	
	(56,388,382,'65',4,'Cambio de Phil FODEN a Jack GREALISH'),
	(56,752,749,'72',4,'Cambio de Boulaye DIA a Famara DIEDHIOU'),
	(56,732,NULL,'76',2,'Tarjeta amarilla a Kalidou KOULIBALY'),	
	(56,386,389,'76',4,'Cambio de Jude BELLINGHAM a Mason MOUNT'),
	(56,369,366,'76',4,'Cambio de John STONES a Eric DIER'),
	(56,367,368,'82',4,'Cambio de Jordan HENDERSON a Kalvin PHILLIPS'),	
	(56,739,738,'84',4,'Cambio de Ismail JAKOBS a Fode BALLO');	



INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- PORTUGAL VS SUIZA
(52, 130, NULL, '17', 5, NULL)
,(52, 109, NULL, '33', 5, NULL)
,(52, 500, NULL, '43', 2, NULL)
,(52, 512, 500, '45+1', 4, NULL)
,(52, 130, NULL, '51', 5, NULL)
,(52, 497, 508, '54', 4, NULL)
,(52, 513, 501, '54', 4, NULL)
,(52, 111, NULL, '55', 5, NULL)
,(52, 509, NULL, '58', 5, NULL)
,(52, 512, NULL, '59', 2, NULL)
,(52, 517, 518, '66', 4, NULL)
,(52, 130, NULL, '67', 5, NULL)
,(52, 124, 127, '73', 4, NULL)
,(52, 119, 123, '74', 4, NULL)
,(52, 129, 130, '74', 4, NULL)
,(52, 121, 126, '81', 4, NULL)
,(52, 128, 117, '87', 4, NULL)
,(52, 520, 507, '89', 4, NULL)
,(52, 128, NULL, '90+2', 5, NULL);



-- ARGENTINA VS AUSTRALIA
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle)
VALUE (54,285,null,'15',2,'Tarjeta amarilla para ')
    ,(54,672,null,'35',5,null)
    ,(54,264,null,'38',2,null)
    ,(54,671,667,'50',4,'Entra Lisandro entra sale Papu Gómez')
    ,(54,671,null,'57',5,null)
    ,(54,278,283,'58',4,'Entra Goodwin entra sale McGreen')
    ,(54,281,286,'58',4,'Entra A. Hrustic entra sale K. Baccus')
    ,(54,676,671,'71',4,'Entra Lautaro sale Marcos J. Álvarez')
    ,(54,655,664,'72',4,'Entra Tagliafico sale Marcos Acuña')
    ,(54,277,274,'72',4,'Entra Kuol sale Marcos Leckie')
    ,(54,275,280,'72',4,'Entra Maclaren sale Duke')
    ,(54,267,264,'72',4,'Entra Fran sale Degenek')
    ,(54,665,661,'72',4,'Entra Palacios sale Molina')
    ,(54,277,NULL,'77',5,null)
    ,(54,656,669,'72',4,'Entra Montiel sale Mac');

    -- Paises Bajos VS Estados unidos
    insert into cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle)
VALUE (53,796,null,'10',5,null)
    ,(53,803,801,'45+1',4,"Entra Koopmeiners sale Klaassen")    
    ,(53,801,363,'46',4,"Entra Reyna sale Ferreira")
    ,(53,793,802,'46',4,"Entra Bergwijn sale d Roon")
    ,(53,803,null,'60',2,null)
    ,(53,364,353,'67',4,"Entra Wright sale  Mckennie")
    ,(53,358,361,'67',4,"Entra Aaronson sale  Weah")
    ,(53,349,347,'75',4,"Entra Yedlin sale Dest")
    ,(53,365,null,'76',5,null)
    ,(53,790,NULL,'45+1',5,null)
    ,(53,791,null,'81',5,null)
    ,(53,806,796,'83',4,"Entra Simons sale Depay")
    ,(53,804,null,'87',2,null)
    ,(53,359,346,'90+2',4,"Entra Morris sale Robinson")
    ,(53,785,787,'90+3',4,"Entra de Ligt sale Aké")
    ,(53,799,794,'90+3',4,"Entra Weghorst sale Gakpo");

    -- Francia VS Polonia
 insert into cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle)
VALUE 
(55,250,null,'31',2,null)
     ,(55,254,null,'44',5,null)
     ,(55,582,null,'47',2,null)
     ,(55,595,590,'64',4,"Entra Milik sale Szymanski ")
     ,(55,246,250,'66',4,"Entra Fofana sale Tchouameni ")
     ,(55,584,586,'71',4,"Entra Bielik sale Krychowiak ")
     ,(55,592,588,'71',4,"Entra Zalewski sale Kaminski ")
     ,(55,255,null,'74',5,null)
     ,(55,260,256,'76',4,"Entra Coman sale Dembele ")
     ,(55,256,254,'76',4,"Entra Thruam sale Giroud ")
     ,(55,579,580,'86',4,"Entra Bednarek sale Kiwior ")
     ,(55,587,593,'87',4,"Entra Grosicki sale Frankowski ")
     ,(55,593,null,'88',2,null)
     ,(55,255,null,'90+1',5,null)
     ,(55,239,241,'90+2',4,"Entra Disasi sale Koundé ")
     ,(55,596,null,'90+6',1,null)
     ,(55,596,null,'90+9',5,"Penal");
    
-- isk 2

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- FRANCIA VS INGLATERRA
(60, 250, NULL, '17', 5, NULL)
,(60, 253, NULL, '43', 2, NULL)
,(60, 256, NULL, '46', 2, NULL)
,(60, 387, NULL, '54', 1, NULL)
,(60, 387, NULL, '54', 5, "Penal")
,(60, 254, NULL, '78', 5, NULL)
,(60, 389, 379, '79', 4, NULL)
,(60, 371, 390, '79', 4, NULL)
,(60, 260, 256, '79', 4, NULL)
,(60, 365, NULL, '81', 1, NULL)
,(60, 244, NULL, '82', 2, NULL)
,(60, 377, 388, '85', 4, NULL)
,(60, 370, NULL, '90', 2, NULL)
,(60, 381, 369, '90+8', 4, NULL)


-- MARRUECOS VS PORTUGAL
,(59, 207, NULL, '42', 5, NULL)
,(59, 124, 121, '51', 4, NULL)
,(59, 114, 111, '51', 4, NULL)
,(59, 190, 188, '57', 4, NULL)
,(59, 192, 207, '65', 4, NULL)
,(59, 208, 200, '65', 4, NULL)
,(59, 128, 130, '69', 4, NULL)
,(59, 119, 123, '69', 4, NULL)
,(59, 190, NULL, '70', 2, NULL)
,(59, 129, 108, '79', 4, NULL)
,(59, 199, 195, '82', 4, NULL)
,(59, 203, 201, '82', 4, NULL)
,(59, 119, NULL, '87', 2, NULL)
,(59, 208, NULL, '90+1', 2, NULL)
,(59, 208, NULL, '90+3', 2, NULL)
,(59, 208, NULL, '90+3', 3, NULL)


-- BRASIL VS CROACIA
,(57, 470, NULL, '25', 2, NULL)
,(57, 224, NULL, '31', 2, NULL)
,(57, 487, 479, '56', 4, NULL)
,(57, 489, 488, '64', 4, NULL)
,(57, 473, NULL, '68', 2, NULL)
,(57, 225, 226, '72', 4, NULL)
,(57, 232, 230, '72', 4, NULL)
,(57, 472, NULL, '77', 2, NULL)
,(57, 493, 477, '84', 4, NULL)
,(57, 221, 222, '105', 4, NULL)
,(57, 474, 482, '105', 4, NULL)
,(57, 476, 475, '105', 4, NULL)
,(57, 478, NULL, '105+1', 5, NULL)
,(57, 233, 216, '110', 4, NULL)
,(57, 234, 224, '114', 4, NULL)
,(57, 232, NULL, '117', 5, NULL)
,(57, 232, NULL, '117', 2, NULL)
,(57, 225, NULL, 'PEN', 5, NULL)
,(57, 489, NULL, 'PEN', 1, NULL)
,(57, 221, NULL, 'PEN', 5, NULL)
,(57, 473, NULL, 'PEN', 5, NULL)
,(57, 223, NULL, 'PEN', 5, NULL)
,(57, 493, NULL, 'PEN', 5, NULL)
,(57, 234, NULL, 'PEN', 5, NULL)
,(57, 472, NULL, 'PEN', 1, NULL)


-- ARGENTINA VS PAÍSES BAJOS

,(58, 661, NULL, '35', 5, NULL)
,(58, 784, NULL, '43', 2, NULL)
,(58, 664, 479, '43', 2, NULL)
,(58, 658, NULL, '45', 2, NULL)
,(58, 799, 479, '45+2', 2, NULL)
,(58, 803, 802, '46', 4, NULL)
,(58, 800, 793, '46', 4, NULL)
,(58, 795, 790, '64', 4, NULL)
,(58, 662, 663, '66', 4, NULL)
,(58, 672, NULL, '73', 1, NULL)
,(58, 672, NULL, '73', 5, "Penal")
,(58, 660, NULL, '76', 2, NULL)
,(58, 796, NULL, '76', 2, NULL)
,(58, 655, 664, '78', 4, NULL)
,(58, 799, 796, '78', 4, NULL)
,(58, 657, 658, '78', 4, NULL)
,(58, 676, 671, '82', 4, NULL)
,(58, 799, NULL, '83', 5, NULL)
,(58, 800, NULL, '88', 2, NULL)
,(58, 662, NULL, '89', 2, NULL)
,(58, 672, NULL, '90+10', 2, NULL)
,(58, 799, NULL, '90+11', 5, NULL)
,(58, 659, NULL, '90+11', 2, NULL)
,(58, 793, NULL, '90+14', 2, NULL)
,(58, 656, 661, '105', 4, NULL)
,(58, 656, NULL, '109', 2, NULL)
,(58, 657, NULL, '112', 2, NULL)
,(58, 673, 660, '112', 4, NULL)
,(58, 797, 794, '113', 4, NULL)
,(58, 791, NULL, '120+8', 2, NULL)
,(58, 791, NULL, '120+8', 2, NULL)
,(58, 791, NULL, '120+8', 3, NULL)
,(58, 797, NULL, '120+8', 2, NULL)
,(58, 786, NULL, 'PEN', 1, NULL)
,(58, 672, NULL, 'PEN', 5, NULL)
,(58, 800, NULL, 'PEN', 1, NULL)
,(58, 662, NULL, 'PEN', 5, NULL)
,(58, 803, NULL, 'PEN', 5, NULL)
,(58, 656, NULL, 'PEN', 5, NULL)
,(58, 799, NULL, 'PEN', 5, NULL)
,(58, 670, NULL, 'PEN', 1, NULL)
,(58, 795, NULL, 'PEN', 5, NULL)
,(58, 676, NULL, 'PEN', 5, NULL);

-- cronologia grupo c
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- argentina-v-arabia-saudí

	(13,662,NULL,"8",'1','Penalti: confirmado'),
	(13,672,NULL,"10",'5','Penal'),
	(13,641,604,'45+4','4','Nawaf Al Abid'), 
	(13,647,NULL,"48",'5','Saleh Al Shehri'), 
	(13,633,NULL,"53",'5','Salem Al Dawsari'),
	(13,671,667,"59",'4','E. Fernández'), 
	(13,670,662,"59",'4','J. Álvarez'), 
	(13,660,NULL,"67",'4','Abdulelah Al Malki'), 
	(13,664,655,"71",'4','M. Acuña'),
 	(13,641,667,"75",'2','Ali Al Bulayhi'), 
	(13,671,650,"78",'4','Sultan Al Ghannam'), 
	(13,610,NULL,"79",'2','Salem Al Dawsari'),
	(13,633,NULL,"82",'2','Saud Abdulhamid'), 
	(13,664,NULL,"88",'2','Abdulelah Al Amri'), 
	(13,653,641,"88",'4','Nawaf Al Abid'), 
	(13,650,641,"89",'4','Haitham Asiri'), 
	(13,641,NULL,'90+2','2','Mohammed Al Owais'), 
	(13,641,610,'90+9','4','Mohammed Al Burayk'), 


-- Polonia-vs México
	(14,608,NULL,"29",'2',"Jorge Sanchez"),
	(14,584,592,"45",'4','entra Krystian Bielik y sale Nicola Zalewsky'),
	(14,607,NULL,"57",'2','Hector Moreno'),
	(14,612,614,"70",'4','entra Carlos Rodriguez y sale Hector Herrera'),
	(14,617,621,"70",'4','entra Raul Jimenez y sale Henry Martin'),
	(14,593,585,"71",'4','entra Przemysaw Frankoswki y sale Damian Szymasnki'),
	(14,593,NULL,"76",'2',' Przemysaw Frankoswki '),
	(14,618,622,"84",'4','entra Uriel Antuna y sale Alexis Vega'),
	(14,595,591,"87",'4','entra Arcadiusz Milik y sale Piotr Zielinksi'),

-- polonia-v-argentina
	(17,594,597,"46",'4','entra Michal Skoras y sale Karol Swideriski'),
	(17,588,593,"46",'4','entra Jakub Kaminski y sale Pryemyslaw Frankowski'),
	(17,669,NULL,"46",'5','Gol de Mac Allister'),
	(17,664,NULL,"49",'2','Marcos Acuna'),
	(17,662,673,"59",'4','entra Leandro Paredes y sale Angel Di Maria'),
	(17,655,664,"59",'4','entra Nicolas Tagliafico y sale Marcos Acuna'),
	(17,585,584,"62",'4','entra Damian Szymansky y sale Krystian Bielik'),
	(17,671,NULL,"67",'5','Gol de Julian Alvarez'),
	(17,577,582,"72",'4','entra Artur Jedrzejczyk y sale Bartosz Bereszynki'),
	(17,586,NULL,"78",'2','Grzegorz Krychowiak'),
	(17,657,670,"79",'4','entra German Pezzela y sale Enzo Fernandez'),
	(17,676,671,"79",'4','entra Lautaro Martinez y sale Julian Alvarez'),
	(17,598,586,"83",'4','entra Krzysztof Piatek y sale Grzegorz Krychowiak'),
	(17,666,669,"83",'4','entra Thiago Almada y sale Alexis Mac Allister'),

-- argentina-v-méxico
	(16,602,NULL,"22",'2','Tarjeta Amarilla a Nestor ARAUJO')
	,(16,613,615,"42",'4','Cambio de É. Gutiérrez a Andres GUARDADO')
	,(16,656,NULL,"43",'2','Tarjeta Amarilla a G. Montiel')
	,(16,613,NULL,"50",'2','Tarjeta Amarilla a É. Gutiérrez')
	,(16,670,668,"57",'4','Cambio de E. Fernández a RODRIGUEZ GUIDO')
	, (16,671,676,"63",'4','Cambio de Julian ALVAREZ a Lautaro Martínez')
	, (16,656,661,"63",'4','Cambio de N. Molina a Gonzalo MONTIEL')
	, (16,672,NULL,"64",'5','Gol de L. Messi')
	, (16,614,NULL,"66",'4','H. Herrera Tarjeta Amarilla')
	, (16,617,610,"66",'4','CAMBIO de Raul JIMENEZ a Kevin ALVAREZ')
	, (16,622,618,"66",'4','Cambio de U. Antuna a Alexis VEGA')
	, (16,614,NULL,"66",'2','Tarjeta amarilla a Hector HERRERA')
	, (16,669,665,"69",'4','Cambio de Alexis MAC ALLISTER a Exequiel PALACIOS')
	, (16,658,673,"69",'4','Cambio de C. Romero a Angel DI MARIA')
	, (16,624,623,"73",'4','Cambio de R. Alvarado a Hirving LOZANO')
	, (16,670,NULL,"87",'5','Gol de E. Fernández')
	, (16,624,NULL,"89",'2','Tarjeta Amarilla a Roberto ALVARADO'),
-- arabia-saudí-v-méxico

	(18,604,NULL,"16",'2','Tarjeta amarilla  a Edson ALVAREZ'), 
	(18,647,NULL,"28",'2','Tarjeta amarilla  a SALEH ALSHEHRI'),
	(18,631,NULL,"34",'2','Tarjeta amarilla  a Ali Al Bulayhi'),
	(18,631,644,"37",'4','Cambio de ALI ALBULAYHI a RIYADH SHARAHILI'),
	(18,618,622,"46",'4','Cambio de Alexis VEGA a U.autuna'),
	(18,639,629,"46",'4','Cambio de ALI ALHASSAN a ABDULLAH MADU'),
	(18,621,NULL,"47",'5', 'Gol de H. Martín'),
	(18,635,NULL,"52",'4', 'Tarjeta amarilla  a Hassan Tambakti'),
	(18,616,NULL,"52",'5', 'Gol de L. Chávez'),
	(18,647,630,"62",'4', 'Cambio de SALEH ALSHEHR a Abdulrahman Al Obud'),
	(18,621,617,"77",'4','Cambio de Henry MARTIN a Raul JIMENEZ'),
	(18,620,612,"77",'4','Cambio de Orbelin PINEDA a C. Rodríguez'),
	(18,629,NULL,"81",'2','Tarjeta amarilla a ABDULLAH MADU'),
	(18,608,610,"86",'4','Cambio de Jorge SANCHEZ a Kevin ALVAREZ'),
	(18,604,619,"86",'4','Cambio de Edson ALVAREZ a Rogelio FUNES MORI'),
	(18,628,621,"88",'4','Cambio de SULTAN ALGHANNAM a H. Martín'),
	(18,630,NULL,'90+1','2','Tarjeta Amarilla a Abdulelah ALAMRI'),
	(18,646,NULL,'90+5','5','Gol de SALEM ALDAWSARI'),
	(18,648,NULL,'90+7','2','Tarjeta Amarilla a HATAN BAHBRI');

-- polonia-v-arabia-saudí
INSERT INTO cronologia
(idpartido,idjugador1,idjugador2,minuto,idevento, detalle)
VALUES
  	 (15,580,NULL,"15",'2','Tarjeta Amarilla - J. Kiwior')
	,(15,576,NULL,"16",'2','Tarjeta Amarilla - M. Cash')
	,(15,595,NULL,"19",'2','Tarjeta Amarilla - A. Milik')
	,(15,637,NULL,"20",'2','Tarjeta Amarilla - Adbulelah Al Malki')
	,(15,591,NULL,"39",'5','Gol - P. Zielinski')
	,(15,647,NULL,"39",'1','Penalti - Confirmado - Saleh Al Shehri')
	,(15,646,NULL,"45+1",'1','Penalti - Fallado - Salem Al Dawsari')
	,(15,573,NULL,"45+1",'2','Tarjeta Amarilla - W. Szczesny')
	,(15,627,640,"46",'4','Cambio')
	,(15,598,591,"63",'4','Cambio')
	,(15,628,632,"65",'4','Cambio')
	,(15,598,595,"71",'4','Cambio')
	,(15,596,NULL,"82",'5','Gol - R. Lewandowski')
	,(15,649,637,"85",'4','Cambio')
	,(15,643,647,"86",'4','Cambio')
	,(15,648,641,"90+5",'4','Cambio')
	;

-- Grupo D Gabo

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Dinamarca vs Túnez
( 19, 295, NULL, '24', 2, NULL)
,( 19, 307, 300, '45 + 1', 4, 'entra Mikkel Damsgaard y sale Thomas Delaney')
,( 19, 312, 309, '65', 4, 'entra Andreas Cornelius y sale Kasper Dolberg')
,( 19, 299, 292, '65', 4, 'entra Mathias Jensen y sale Simon Kjaer')
,( 19, 306, 302, '65', 4, 'entra Jesper Lindstrom y sale Andreas Skov Olsen')
,( 19, 336, 330, '67', 4, 'entra Naim Sliti y sale Anice Slimane')
,( 19, 299, NULL, '78', 2, NULL)
,( 19, 314, 316, '80', 4, 'entra Hannibal Mejbri y sale Youseff Msakni')
,( 19, 333, 321, '80', 4, 'entra Taha Khenissi y sale Issam Jebali')
,( 19, 336, NULL, '86', 2, NULL)
,( 19, 324, 328, '88', 4, 'entra Wajdi Kechrida y sale Mohamed Drager')
,( 19, 325, 332, '88', 4, 'entra Ferjani Sassi y sale Aissa Laidouni');


INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Francia vs Australia
( 20, 278, NULL, '9', 5, NULL)
,( 20, 244, 247, '13', 4, 'entra Theo Hernández y sale Lucas Hernández')
,( 20, 249, NULL, '27', 5, NULL)
,( 20, 254, NULL, '32', 5, NULL)
,( 20, 280, NULL, '55', 2, NULL)
,( 20, 279, 280, '56', 4, 'entra Jason Cummings y sale Mitch Duke')
,( 20, 255, NULL, '68', 5, NULL)
,( 20, 254, NULL, '71', 5, NULL)
,( 20, 276, 283, '73', 4, 'entra Awer Mabil y sale Riley McGree')
,( 20, 277, 278, '73', 4, 'entra Garang Kuol y sale Craig Goodwing')
,( 20, 246, 250, '77', 4, 'entra Youssouf Fofana y sale Aurelien Tchouameni')
,( 20, 260, 256, '77', 4, 'entra Kingsley Coman y sale Ousmane Dembele')
,( 20, 285, NULL, '80', 2, NULL)
,( 20, 286, 285, '85', 4, 'entra Keanu Baccus y sale Jackson Irvine')
,( 20, 264, 265, '85', 4, 'entra Milos Degeneck y sale Nathaniel Atkinso')
,( 20, 241, 238, '89', 4, 'entra Jules Kounde y sale Benjamin Pavard')
,( 20, 259, 254, '89', 4, 'entra Marcus Thuram y sale Olivier Giroud')
,( 20, 282, NULL, '90 + 5', 2, NULL);

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Túnez vs Australia
( 21, 280, NULL, '23', 5, NULL)
,( 21, 314, NULL, '26', 2, NULL)
,( 21, 325, 328, '46', 4, 'entra Ferjani Sassi y sale Mohamed Drager')
,( 21, 275, 280, '64', 4, 'entra Jamie MacLaren y sale Mitch Duke')
,( 21, 281, 275, '64', 4, 'entra Ajdin Hrustic y sale Riley McGree')
,( 21, 334, NULL, '64', 2, NULL)
,( 21, 321, 314, '67', 4, 'entra Wahbi Khazri y sale Aissa Laidouni')
,( 21, 324, 317, '73', 4, 'entra Wajdi Kechrida y sale Dylan Bronn')
,( 21, 333, 336, '73', 4, 'entra Taha Khenissi y sale Issam Jebali')
,( 21, 264, 267, '75', 4, 'entra Milos Degenek y sale Fran Karacic')
,( 21, 276, 278, '85', 4, 'entra Awer Mabil y sale Craig Goodwin')
,( 21, 286, 274, '85', 4, 'entra Keanu Baccus y sale Matthew Leckie')
,( 21, 325, NULL, '90 + 3', 2, NULL);

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Japón VS España
(29,19,NULL,'11',5,'Gol de Alvaro Morata'),
(29,32,NULL,'39',2,'Kou Itakura'),
(29,31,NULL,'44',2,'Shogo Taniguchi'),
(29,36,NULL,'45',2,'Maya Yoshida'),
(29,40,43,'46',4,'entra Ritsu Doan y sale Takefusa Kubo'),
(29,41,33,'46',4,'entra Kaoru Mitoma y sale Yuto Nagatomo'),
(29,10,4,'46',4,'entra Dani Carvajal y sale Cesar Azpilicueta'),
(29,40,NULL,'48',5,'Gol de Ritsu Doan'),
(29,47,NULL,'51',5,'Gol de Ao Tanaka'),
(29,21,22,'57',4,'entra Ferran Torres y sale Nico Williams'),
(29,20,19,'57',4,'entra Marco Asencio y sale Alvaro Morata'),
(29,49,NULL,'62',4,'entra Takuma Asano y sale Daizen Maeda'),
(29,26,15,'68',4,'entra Ansu Fati y sale Pablo Gavi'),
(29,9,7,'68',4,'entra Jordi Alba y sale Alejandro Balde'),
(29,34,46,'68',4,'entra Takehiro Tomiyasu y sale Daichi Kamada'),
(29,38,47,'87',4,'entra Watoru Endo y sale Ao Tanaka');

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Japón VS CR
(27,76,NULL,'41',2,'Anthony Contreras'),
(27,30,NULL,'44',2,'Miki Yamane'),
(27,37,33,'46',4,'entra Hiroki Ito y sale Yuto Asano'),
(27,49,51,'46',4,'entra Takuma Asano y sale Ayase Ueda'),
(27,65,NULL,'61',2,'Celso Borges'),
(27,41,30,'62',4,'entra Kaouru Mitoma y sale Miki Yamane'),
(27,71,68,'65',4,'entra Brandon Aguilera y sale Gerson Torres'),
(27,66,76,'65',4,'entra Jewison Bennete y sale Anthony Contreras'),
(27,45,40,'67',4,'entra Junyan Ito y sale Ritsu Doan'),
(27,60,NULL,'70',4,'Francisco Calvo'),
(27,57,NULL,'81',5,'Gol de Keysher Fuller'),
(27,42,48,'82',4,'entra Takumi Minamino y sale Yuki Soma'),
(27,32,NULL,'84',2,'Kou Itakura'),
(27,69,65,'89',4,'entra Youstin Salas y sale Celso Borges'),
(27,38,NULL,'90+3',2,'Wataru Endo'),
(27,64,78,'90+5',4,'entra Daniel Chacon y sake Joel Campbell');

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- España VS Alemania
(28,85,NULL,'37',2,'Thilo Kehrer'),
(28,12,NULL,'44',2,'Sergio Busquets'),
(28,19,21,'54',4,'entra Alvaro Morata y sale Ferran Torres'),
(28,92,NULL,'58',2,'Leon Goretzka'),
(28,91,NULL,'60',2,'Joshua Kimmich'),
(28,19,NULL,'62',5,'Gol de Alvaro Morata'),
(28,14,20,'66',4,'entra Koke y sale Marco Asensio'),
(28,22,15,'66',4,'entra Nico Williams y sale Pablo Gavi'),
(28,101,99,'70',4,'entra Niclas Fuellkrug y sale Thomas Mueller'),
(28,87,85,'70',4,'entra Lukas Klostermann y sale Thilo Kherer'),
(28,97,98,'70',4,'entra Leroy Sane y sale Ilkay Guendogan'),
(28,7,9,'82',4,'entra Alejandro Balde y sale Jordi Alba'),
(28,101,NULL,'83',5,'Gol de Niclas Fuellkrug'),
(28,96,102,'85',4,'entra Jonas Hofmann y sale Serge Gnabry'),
(28,89,84,'87',4,'entra Nico Scholotterbeck y sale David Raum');

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES

-- Francia vs Dinamarca
(22,'287',NULL,'20','2','Andreas CHRISTENSEN recibe tarjeta amarilla'),
(22,'294',NULL,'23','2','Andreas CORNELIUS recibe tarjeta amarilla'),
(22,'241',NULL,'43','2','Jules KOUNDE recibe tarjeta amarilla'),
(22,'308',NULL,'46','4','Cambio de Martin BRAITHWAITE a Andreas CORNELIUS'),
(22,'255',NULL,'61','5','Kylan MPBAPEE mete un GOL'),
(22,'259','254','63','4','Cambio de Olivier GIROUD Marcus THURAM'),
(22,'287',NULL,'68','5','GOL de Andreas CHRISTENSEN'),
(22,'309','307','73','4','cambio de Mikkel DAMSGAARD a Kasper DOLBERG'),
(22,'245','240','75','4','cambio de Ousmane DEMBELE Kingsley COMAN'),
(22,'260','256','75','4','cambio de Raphael VARANE a Ibrahima KONATE'),
(22,'303','306','85','4', 'cambio de Jesper LINDSTROM a Christian NORGAARD'),
(22,'255',NULL,'86','5','Gol Kylian MBAPPE'),
(22,'298','295','90+2','4','cambio de Rasmus KRISTENSEN a Alexander BAH'),
(22,'246','253','90+2','4','cambio de Antoine GRIEZMANN aYoussouf Fofana'),

-- Australia vs Denmark
(23,'298',NULL,4,'2','Tarjeta amarilla a Aziz BEHICH'),
(23,'304','277',46,'4','Cambio de Craig GOODWIN a Keanu BACCUS'),
(23,'298','295',46,'4','Cambio de Rasmus KRISTENSEN a Alexander BAH'), 
(23,'307',NULL,57,'2','Tarjeta amarilla a Milos DEGENEK'), 
(23,'309','308',59,'4','Cambio de Mathias JENSEN a Kasper DOLBERG'),
(23,'307','299',59,'4','Cambio de Martin BRAITHWAITE Mikkel DAMSGAARD'),
(23,'286',NULL,60,'5','Gol de Mathew LECKIE'),
(23,'305','306',69,'4','Cambio de Andreas SKOV OLSEN a Robert SKOV'),
(23,'312','293',69,'4','Cambio de Andreas CORNELIUS a Joakim MAEHLE'),
(23,'310','273',74,'4','Cambio de Bailey WRIGHT Riley McGREE'),
(23,'305',NULL,75,'2','Tarjeta amarilla a Robert SKOV'),
(23,'303','309',82,'4','Cambio de Mitch DUKE a Jamie MacLAREN'),
(23,'270','306',89,'4','Cambio de Ajdin HRUSTIC a Mathew LECKIE'),



-- Tunisia vs Francia

(24,'322','313',"83",4,'Cambio de Ali ABDI a Anis SLIMANE'),
(24,'256','248',"79",4,'Cambio de Matteo GUENDOUZI a Ousmane DEMBELE'),
(24,'327','322',"74",4,'Cambio de Ghaylen CHAALELI a BEN ROMDHANE Ali'),
(24,'253','246',"73",4,'Cambio de Youssouf Fofana a Antoine GRIEZMANN'),
(24,'255','260',"63",4,'Cambio de Jordan VERETOUT a Adrien RABIOT'),
(24,'249','251',"63",4,'Cambio de Kingsley COMAN a Kylian MBAPPE'),
(24,'242','240',"63",4,'Cambio de Kylian MBAPPE a William SALIBA'),
(24,'316','326',"60",4,'Cambio de Raphael VARANE a Wahbi KHAZRI a Issam JEBALI'),
(24,'326',NULL,"58",5,'Gol de Wahbi KHAZRI'),
(24,'324',NULL,"28",2,'Tarjeta amarilla a Wajdi KECHRIDA');

-- GRUPO G 
-- FASE DE GRUPOS
-- BRASIL 5
-- CAMERUN 6
-- SUIZA 28
-- SERBIA 26
--
-- JORNADA 1  ============================================================================================================
-- SUIZA VS CAMERUN 28,6
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
(37,539,null,'36',2,null)
,(37,507,null,'48',5,null)
,(37,505,null,'64',2,null)
,(37,525,538,'68',4,"entra G. Ondoua M. Hongla")
,(37,496,508,'71',4,"entra F. Frei sale D. Sow")
,(37,517,498,'72',4,"entra N. Okafor sale X. Shaqiri")
,(37,497,507,'72',4,"entra H. Seferović sale B. Embolo")
,(37,530,533,'74',4,"entra V. Aboubakar sale E. Choupo-Moting")
,(37,527,532,'74',4,"entra G. Nkoudou sale K. Toko Ekambi")
,(37,519,518,'81',4,"entra  F. Riede sale R. Vargas")
,(37,509,null,'83',2,null);

-- BRASIL VS SERBIA 5,26
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
(38,548,null,'7',2,null)
,(38,554,null,'49',2,null)
,(38,570,554,'57',4,"entra I. Ilić sale N. Gudelj")
,(38,553,560,'57',4,"entra N. Radonjić sale A. Živković ")
,(38,477,null,'62',5,null)
,(38,562,null,'64',2,null)
,(38,564,571,'66',4,"entra D. Vlahović sale F. Mladenović ")
,(38,568,562,'66',4,"entra D. Lazović sale S. Lukić")
,(38,477,null,'73',5,null)
,(38,476,475,'75',4,"entra Fred sale Lucas Paquetá")
,(38,487,478,'80',4,"entra Antony sale Neymar")
,(38,494,479,'87',4,"entra Gabriel Martinelli sale Raphinha");
-- JORNADA 2  ============================================================================================================
-- CAMERUN VS SERBIA 6,26
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
(39,523,null,'24',2,null)
,(39,541,null,'29',5,null)
,(39,531,null,'30',2,null)
,(39,548,NULL,'45+1',5,NULL)
,(39,566,NULL,'45+3',5,NULL)
,(39,557,null,'45+4',2,NULL)
,(39,555,null,'53',5,null)
,(39,530,538,'55',4,"entra  V. Aboubakar sale M. Hongla")
,(39,559,548,'56',4,"entra S. Mitrović sale S. Pavlović")
,(39,530,null,'63',5,NULL)
,(39,533,null,'66',5,null)
,(39,525,535,'67',4,"entra G. Ondoua sale P. Kunde")
,(39,531,532,'67',4,"entra C. Bassogog sale K. Toko Ekambi")
,(39,561,551,'78',4,"entra S. Babić sale M. Veljković")
,(39,554,560,'78',4,"entra N. Radonjić sale A. Živković")
,(39,572,566,'79',4,"entra M. Grujić sale S. Milinković-Savić")
,(39,534,543,'81',4,"entra S. Oum Gouet sale A. Zambo Anguissa")
,(39,527,540,'81',4,"entra G. Nkoudou B. Mbeumo ")
,(39,567,563,'90+2',4,"entra F. Đuričić sale F. Kostić");


-- BRASIL VS SUIZA 5,28
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
(40,489,475,'46',4,"entra Rodrygo sale Lucas Paquetá")
,(40,519,null,'50',2,null)
,(40,476,null,'52',2,null)
,(40,485,476,'58',4,"entra Bruno Guimarães sale Fred")
,(40,506,518,'59',4,"entra E. Fernandes sale R. Vargas")
,(40,504,519,'59',4,"entra R. Steffen sale F. Rieder")
,(40,486,477,'73',4,"entra Gabriel Jesus sale Richarlison")
,(40,487,479,'73',4,"entra Antony sale Raphinha")
,(40,516,508,'76',4,"entra M. Aebischer sale D. Sow")
,(40,497,507,'76',4,"entra H. Seferović sale B. Embolo")
,(40,473,null,'83',5,null)
,(40,496,503,'86',4,"entra F. Frei sale S. Widmer");


-- JORNADA 3  ===========================================================================================================
-- CAMERUN VS BRASIL 6,5
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
(41,545,null,'6',2,null)
,(41,482,null,'7',2,null)
,(41,535,null,'28',2,null)
,(41,539,null,'32',2,null)
,(41,472,484,"54",4,"entra Marquinhos sale Alex Telles")
,(41,485,476,"55",4,"entra Bruno Guimarães sale Fred")
,(41,490,489,"55",4,"entra Éverton Ribeiro sale Rodrygo")
,(41,493,486,"64",4,"entra Pedro sale Gabriel Jesus")
,(41,532,540,"64",4,"entra K. Toko Ekambi sale B. Mbeumo")
,(41,542,535,"68",4,"entra O. Ntcham sale P. Kunde")
,(41,479,487,"79",4,"entra Raphinha sale Antony")
,(41,530,null,"81",2,null)
,(41,485,null,"85",2,null)
,(41,522,526,"86",4,"entra J. Mbekeli sale M. Ngamaleu")
,(41,530,null,"90+2",5,null)
,(41,530,null,"90+3",1,null)
,(41,530,null,"90+3",3,"segunda amarilla, expulsion");


-- SERBIA VS SUIZA 26,28
INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
(42,503,null,"15",2,null)
,(42,498,null,"20",5,null)
,(42,555,null,"26",5,null)
,(42,518,null,"34",2,null) 
,(42,564,null,"35",5,null)
,(42,507,null,"44",5,null)
,(42,566,null,"47",2,null)
,(42,501,null,"48",5,null)
,(42,557,564,"55",4,"entra L. Jović sale D. Vlahović")
,(42,554,551,"55",4,"entra N. Gudelj sale M. Veljković")
,(42,548,null,"56",2,null)
,(42,558,null,"66",2,null)
,(42,552,566,"67",4,"entra N. Maksimović sale S. Milinković-Savić")
,(42,506,508,"68",4,"entra E. Fernandes sale D. Sow")
,(42,513,498,"69",4,"entra D. Zakaria sale X. Shaqiri")
,(42,567,556,"78",4,"entra F. Đuričić sale D. Tadić")
,(42,554,null,"81",2,null)
,(42,555,null,"82",2,null)
,(42,514,518,"83",4,"entra C. Fassnacht sale R. Vargas")
,(42,502,null,"90+5",2,null)
,(42,550,null,"90+5",2,null)
,(42,517,507,"90+6",4,"entra N. Okafor sale B. Embolo")
,(42,500,null,"90+9",2,null)
,(42,562,null,"90+10",2,NULL);
 -- ===========================================================


INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Inglaterra vs Irán
	(7,'409','391','20','4','cambio'),
	(7,'397',Null,'25','2','Tarjeta Amarilla'),
	(7,'383',Null,'35','5','GOL'),
	(7,'390',Null,'43','5','GOL'),
	(7,'388',NULL,'45+1','5','GOL'),
	(7,'405','370','46','4','Cambio'),
	(7,'397','407','46','4','Cambio'),
	(7,'408','396','46','4','Cambio'),
	(7,'398',Null,'48','2','Tarjeta Amarilla'),
	(7,'390',NULL,'62','5','GOL'),
	(7,'395','406','63','4','Cambio'),
	(7,'414','399','65','5','GOL'),
	(7,'366','398','70','4','Cambio'),
	(7,'389',Null,'71','5','GOL'),
	(7,'387','366','71','4','Cambio'),
	(7,'383','389','71','4','Cambio'),
	(7,'371','370','71','4','Cambio'),
	(7,'390','388','71','4','Cambio'),
	(7,'365','384','76','4','Cambio'),
	(7,'409','410','77','4','Cambio'),
	(7,'386',NULL,'90','5','GOL'),
	(7,'398',Null,'90+10','1','penal'),
	(7,'414',Null,'90+13','5','Penal'),


-- Estados Unidos vs Gales
	('8','347',NULL,'11','2','Tarjeta Amarilla'),
	('8','353',NULL,'13','2','Tarjeta Amarilla'),
	('8','362',NULL,'36','5','Gol'),
	('8','439',NULL,'40','2','Tarjeta Amarilla'),
	('8','423','438','45+3','2','Tarjeta Amarilla'),
	('8','350',NULL,'46','4','Cambio'),
	('8','345',NULL,'51','2','Tarjeta Amarilla'),
	('8','358','353','66','4','Cambio'),
	('8','364','362','74','4','Cambio'),
	('8','349','360','74','4','Cambio'),
	('8','352','354','75','4','Cambio'),
	('8','440','426','79','4','Cambio'),
	('8','439',NULL,'82','1','Penal'),
	('8','439',NULL,'82','5','Penal'),
	('8','359','361','88','4','Cambio'),
	('8','272','437','90+3','4','Cambio'),
	('8','435','421','90+5','4','Cambio'),
	('8','352',NULL,'90+10','3','Tarjeta roja'),


-- Gales Vs iran
	('9','420',NULL,'45' + '3','2', 'J. Rodon Tarjeta Amarilla'),
	('9','340','427','57','4', 'B. Johnson A C. Roberts'),
	('9','438','437','58','4', 'D. James A H.Wilson'),
	('9','400','410','68','4', 'K. Ansarifard A S.Azmoun'),
	('9','406','418','77','4', 'J. Allen A E.Ampadu'),
	('9','397','407','77','4', 'A. Jahanbakhsh A A.Gholizadeh'),
	('9','433','421','77','4', 'M. Torabi A E.Hajisafi'),
	('9','405','400','78','4', 'R. Cheshmi A A.Noorollahi'),
	('9','408','396','83','4', 'A. Karimi A S.Ezatolahi'),
	('9','418',NULL,'85','4', 'Aumento de tarjeta: confirmado W. 
Hennessey'),
	(9,'418',NULL,'86','3', 'W. Hennessey Tarjeta Roja'),
	(9,'417','432','87','4', 'D. Ward A A. Ramsey'),
	(9,'413',NULL,'90 + 4','3', 'R. Rezaeian Tarjeta Amarilla'),
	(9,'397',NULL,'90 + 5','3', 'A. Jahanbakhsh Tarjeta Amarilla'),
	(9,'402',NULL,'90 + 8','5', 'R. Cheshmi Gol 0 - 1'),
	(9,'404',NULL,'90 + 11','5', 'R. Rezaeian M. Taremi 0 - 2'),
-- Inglaterra VS Estados Unidos
	(10,NULL,'371',"68",'4', 'J. Grealish A R. Sterling'),
	(10,NULL,'386',"69",'4', 'J. Henderson A J. Bellingham'),
	(10,'358','353',"77",'4', 'B. Aaronson A W. McKennie'),
	(10,NULL,'390',"78",'4', 'S. Moore A S. Dest'),
	(10,'350','347',"78",'4', 'M. Rashford A B. Saka'),
	(10,NULL,'361',"83",'4','G. Reyna A T. Weah'),
	(10,'362','364',"83",'4', 'J. Sargent A H. Wright'),


-- Gales vs Inglaterra
	(11,'438',NULL,"29",'2','D. James Tarjeta Amarilla'),
	(11,'427','426',"36",'4','C. Roberts N. Williams'),
	(11,'440','439',"46",'4','B. Johnson G. Bale'),
	(11,'389',NULL,"50",'5','P. Foden H. Kane 0 - 2'),
	(11,'382',NULL,"51",'5','T. Alexander-Arnold K. Walker'),
	(11,'373',NULL,"58",'4','K. Phillips D. Rice'),
	(11,'384',NULL,"58",'4','C. Wilson H. Kane'),
	(11,'435','425',"59",'4','J. Morrell B. Davies'),
	(11,'432',NULL,"61",'2','A. Ramsey Tarjeta Amarilla'),
	(11,"389",NULL,"68",'5','M. Rashford K. Phillips 0 - 3'),
	(11,'437','438',"77",'4','H. Wilson D. James'),
	(11,'429','433',"81",'4','R. Colwill J. Allen'),
-- Iran vs Estados Unidos
	(12,'361',NULL,"38", '5', 'Tarjeta Amarilla'),
	(12,'408','395',"43", '4', 'M. Mohammadi'),
	(12,'358','395',"45+3", '4', 'A. Karimi'),
	(12,'358','360',"46", '4', 'S. Azmoun'),
	(12,'404','410',"46", '4', 'B. Aaronson'),
	(12,'352','353',"65", '4', 'K. Acosta'),
	(12,'407','406',"71", '4', 'M. Torabi'),
	(12,'415','407',"72", '4', 'Tarjeta Amarilla'),
	(12,'409',NULL,"77", '2', 'M. Hosseini'),
	(12,'364','362',"77", '4', 'H. Wright'),
	(12,'400','407',"78", '4', 'K. Ansarifard'),
	(12,'350','347',"82", '4', 'W. Zimmerman'),
	(12,'343','361',"82", '4', 'S. Moore'),
	(12,'408',NULL,"83", '2', 'H. Kanani'),
	(12,'343','361',"82", '4', 'S. Moore'),
	(12,'415',NULL,'90 + 6', '2', 'A. Jalali');
	
	INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- Japón VS Alemania
(25, 98, NULL, '33', 1, NULL)
,(25, 98, NULL, '33', 5, "Penal")
,(25, 34, 43, '46', 4, NULL)
,(25, 41, 33, '57', 4, NULL)
,(25, 49, 52, '57', 4, NULL)
,(25, 96, 99, '67', 4, NULL)
,(25, 92, 98, '67', 4, NULL)
,(25, 40, 47, '71', 4, NULL)
,(25, 42, 35, '74', 4, NULL)
,(25, 40, NULL, '75', 5, NULL)
,(25, 101, 100, '79', 4, NULL)
,(25, 93, 94, '79', 4, NULL)
,(25, 49, NULL, '83', 5, NULL)
,(25, 104, 102, '90', 4, NULL);

INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- España vs Costa Rica
(26, 24, NULL, '11', 5, NULL)
,(26, 20, NULL, '21', 5, NULL)
,(26, 21, NULL, '31', 1, NULL)
,(26, 21, NULL, '31', 5, "Penal")
,(26, 62, 61, '46', 4, NULL)
,(26, 21, NULL, '54', 5, NULL)
,(26, 19, 21, '57', 4, NULL)
,(26, 17, 18, '57', 4, NULL)
,(26, 67, 66, '61', 4, NULL)
,(26, 75, 76, '61', 4, NULL)
,(26, 7, 9, '64', 4, NULL)
,(26, 14, 12, '64', 4, NULL)
,(26, 60, NULL, '68', 2, NULL)
,(26, 22, 20, '69', 4, NULL)
,(26, 71, 65, '72', 4, NULL)
,(26, 15, NULL, '74', 5, NULL)
,(26, 63, 59, '82', 4, NULL)
,(26, 17, NULL, '90', 5, NULL)
,(26, 19, NULL, '90+2', 5, NULL)
,(26, 78, NULL, '90+7', 2, NULL);

	INSERT INTO cronologia (idpartido,idjugador1,idjugador2,minuto,idevento, detalle) VALUES
-- ARGENTINA VS CROACIA
(61, 209, NULL, '32', 2, NULL)
,(61, 222, NULL, '32', 2, NULL)
,(61, 672, NULL, '34', 1, NULL)
,(61, 672, NULL, '34', 5, "Penal")
,(61, 671, NULL, '39', 5, NULL)
,(61, 225, 226, '45+1', 4, NULL)
,(61, 234, 216, '45+1', 4, NULL)
,(61, 232, 224, '50', 4, NULL)
,(61, 660, 662, '62', 4, NULL)
,(61, 658, NULL, '68', 2, NULL)
,(61, 671, NULL, '69', 5, NULL)
,(61, 659, NULL, '71', 2, NULL)
,(61, 231, 230, '72', 4, NULL)
,(61, 665, 663, '74', 4, NULL)
,(61, 675, 671, '74', 4, NULL)
,(61, 221, 223, '81', 4, NULL)
,(61, 674, 669, '86', 4, NULL)
,(61, 654, 661, '86', 4, NULL)


-- MARRUECOS VS FRANCIA
,(62, 244, NULL, '5', 5, NULL)
,(62, 200, 188, '21', 4, NULL)
,(62, 201, NULL, '27', 2, NULL)
,(62, 193, 191, '45+1', 4, NULL)
,(62, 259, 254, '65', 4, NULL)
,(62, 204, 207, '66', 4, NULL)
,(62, 199, 201, '67', 4, NULL)
,(62, 206, 200, '78', 4, NULL)
,(62, 257, 256, '79', 4, NULL)
,(62, 257, NULL, '79', 5, NULL)

-- CROACIA VS MARRUECOS
,(63, 217, NULL, '7', 5, NULL)
,(63, 190, NULL, '9', 5, NULL)
,(63, 234, NULL, '42', 5, NULL)
,(63, 198, 205, '45+1', 4, NULL)
,(63, 196, 202, '56', 4, NULL)
,(63, 225, 230, '61', 4, NULL)
,(63, 192, 190, '64', 4, NULL)
,(63, 197, 201, '64', 4, NULL)
,(63, 232, 231, '66', 4, NULL)
,(63, 226, 221, '67', 4, NULL)
,(63, 200, 189, '67', 4, NULL)
,(63, 196, NULL, '68', 2, NULL)
,(63, 200, NULL, '84', 2, NULL)
,(63, 228, 234, '90+5', 4, NULL)

-- ARGENTINA VS FRANCIA
,(64, 672, NULL, '23', 1, NULL)
,(64, 672, NULL, '23', 5, "Penal")
,(64, 673, NULL, '36', 5, NULL)
,(64, 259, 254, '41', 4, NULL)
,(64, 257, 256, '41', 4, NULL)
,(64, 670, NULL, '45+7', 2, NULL)
,(64, 249, NULL, '55', 2, NULL)
,(64, 664, 673, '64', 4, NULL)
,(64, 252, 244, '71', 4, NULL)
,(64, 260, 253, '71', 4, NULL)
,(64, 255, NULL, '80', 1, NULL)
,(64, 255, NULL, '80', 5, "Penal")
,(64, 255, NULL, '81', 5, NULL)
,(64, 259, NULL, '87', 2, NULL)
,(64, 656, 661, '90', 4, NULL)
,(64, 254, NULL, '90+5', 2, NULL)
,(64, 664, NULL, '90+8', 2, NULL)
,(64, 246, 249, '96', 4, NULL)
,(64, 662, 663, '102', 4, NULL)
,(64, 676, 671, '103', 4, NULL)
,(64, 672, NULL, '108', 5, NULL)
,(64, 245, 240, '113', 4, NULL)
,(64, 662, NULL, '114', 2, NULL)
,(64, 656, NULL, '116', 2, NULL)
,(64, 657, 669, '116', 4, NULL)
,(64, 255, NULL, '118', 1, NULL)
,(64, 255, NULL, '118', 5, "Penal")
,(64, 675, 655, '120+1', 4, NULL)
,(64, 239, 241, '120+1', 4, NULL)
,(64, 653, NULL, '120+5', 2, NULL)
,(64, 255, NULL, 'PEN', 5, NULL)
,(64, 672, NULL, 'PEN', 5, NULL)
,(64, 260, NULL, 'PEN', 1, NULL)
,(64, 675, NULL, 'PEN', 5, NULL)
,(64, 250, NULL, 'PEN', 1, NULL)
,(64, 662, NULL, 'PEN', 5, NULL)
,(64, 257, NULL, 'PEN', 5, NULL)
,(64, 656, NULL, 'PEN', 5, NULL);

INSERT INTO arbitraje (idpartido,idarbitro) VALUES
(1,2)
,(1,21)
,(1,48)
,(1,68)
,(1,82)

,(2,1)
,(2,5)
,(2,48)
,(2,60)
,(2,31)

,(3,28)
,(3,35)
,(3,41)
,(3,50)
,(3,77)

,(4,4)
,(4,15)
,(4,12)
,(4,30)
,(4,74)

,(5,6)
,(5,7)
,(5,65)
,(5,39)
,(5,75)

,(6,19)
,(6,9)
,(6,54)
,(6,66)
,(6,78)

,(7,16)
,(7,9)
,(7,38)
,(7,45)
,(7,79)

,(8,6)
,(8,33)
,(8,42)
,(8,71)
,(8,86)

,(9,11)
,(9,18)
,(9,44)
,(9,60)
,(9,80)

,(10,34)
,(10,22)
,(10,50)
,(10,58)
,(10,89)

,(11,23)
,(11,32)
,(11,64)
,(11,53)
,(11,90)

,(12,28)
,(12,19)
,(12,69)
,(12,42)
,(12,88)

,(13,5)
,(13,17)
,(13,62)
,(13,66)
,(13,81)

,(14,11)
,(14,16)
,(14,44)
,(14,66)
,(14,84)

,(15,31)
,(15,30)
,(15,51)
,(15,65)
,(15,95)

,(16,32)
,(16,23)
,(16,71)
,(16,72)
,(16,83)

,(17,25)
,(17,26)
,(17,65)
,(17,73)
,(17,90)

,(18,1)
,(18,3)
,(18,65)
,(18,44)
,(18,85)

,(19,28)
,(19,9)
,(19,65)
,(19,70)
,(19,80)

,(20,34)
,(20,31)
,(20,66)
,(20,63)
,(20,87)

,(21,13)
,(21,5)
,(21,69)
,(21,74)
,(21,77)

,(22,10)
,(22,19)
,(22,66)
,(22,51)
,(22,92)

,(23,8)
,(23,5)
,(23,60)
,(23,50)
,(23,90)

,(24,16)
,(24,23)
,(24,40)
,(24,37)
,(24,80)

,(25,8)
,(25,17)
,(25,52)
,(25,42)
,(25,92)

,(26,19)
,(26,30)
,(26,39)
,(26,40)
,(26,79)

,(27,1)
,(27,2)
,(27,39)
,(27,70)
,(27,77)

,(28,22)
,(28,12)
,(28,62)
,(28,38)
,(28,78)

,(29,18)
,(29,25)
,(29,39)
,(29,60)
,(29,80)

,(30,20)
,(30,25)
,(30,45)
,(30,65)
,(30,85)

,(31,6)
,(31,8)
,(31,69)
,(31,53)
,(31,89)

,(32,22)
,(32,21)
,(32,61)
,(32,56)
,(32,95)

,(33,26)
,(33,28)
,(33,41)
,(33,40)
,(33,79)

,(34,12)
,(34,31)
,(34,61)
,(34,70)
,(34,92)

,(35,16)
,(35,28)
,(35,65)
,(35,42)
,(35,92)

,(36,14)
,(36,15)
,(36,65)
,(36,41)
,(36,94)

,(37,26)
,(37,20)
,(37,60)
,(37,70)
,(37,80)

,(38,28)
,(38,26)
,(38,53)
,(38,61)
,(38,93)

,(39,5)
,(39,1)
,(39,62)
,(39,47)
,(39,94)

,(40,15)
,(40,35)
,(40,42)
,(40,71)
,(40,79)

,(41,26)
,(41,18)
,(41,68)
,(41,52)
,(41,88)

,(42,15)
,(42,16)
,(42,38)
,(42,39)
,(42,78)

,(43,25)
,(43,26)
,(43,41)
,(43,63)
,(43,93)


,(44,13)
,(44,12)
,(44,41)
,(44,40)
,(44,85)

,(45,30)
,(45,28)
,(45,67)
,(45,70)
,(45,78)

,(46,15)
,(46,25)
,(46,65)
,(46,54)
,(46,80)

,(47,36)
,(47,35)
,(47,51)
,(47,61)
,(47,90)

,(48,9)
,(48,8)
,(48,39)
,(48,38)
,(48,89)

,(49,4)
,(49,8)
,(49,42)
,(49,66)
,(49,88)


,(50,30)
,(50,9)
,(50,71)
,(50,70)
,(50,79)

,(51,6)
,(51,4)
,(51,37)
,(51,71)
,(51,92)


,(52,19)
,(52,7)
,(52,70)
,(52,69)
,(52,93)

,(53,34)
,(53,24)
,(53,66)
,(53,44)
,(53,94)

,(54,2)
,(54,4)
,(54,50)
,(54,52)
,(54,80)

,(55,6)
,(55,37)
,(55,72)
,(55,70)
,(55,95)

,(56,36)
,(56,35)
,(56,72)
,(56,56)
,(56,91)

,(57,31)
,(57,14)
,(57,48)
,(57,49)
,(57,90)

,(58,4)
,(58,9)
,(58,60)
,(58,61)
,(58,92)

,(59,5)
,(59,8)
,(59,62)
,(59,41)
,(59,93)

,(60,6)
,(60,18)
,(60,62)
,(60,45)
,(60,95)

,(61,7)
,(61,41)
,(61,3)
,(61,45)
,(61,76)

,(62,9)
,(62,56)
,(62,44)
,(62,17)
,(62,92)

,(63,20)
,(63,86)
,(63,87)
,(63,23)
,(63,95)

,(64,35)
,(64,70)
,(64,47)
,(64,78)
,(64,25);

alter table cuerpoTecnico add constraint foreign key (idseleccion) references seleccion(idseleccion);

alter table jugador add constraint foreign key (idrol) references rol(idrol);
alter table jugador add constraint foreign key (idseleccion) references seleccion(idseleccion);

alter table partido add constraint foreign key (idseleccion1) references seleccion(idseleccion);
alter table partido add constraint foreign key (idseleccion2) references seleccion(idseleccion);
alter table partido add constraint foreign key (idestadio) references estadio(idestadio);
alter table partido add constraint foreign key (idfase) references fase(idfase);

-- alter table arbitraje drop foreign KEY arbitraje_ibfk_1;
alter table arbitraje add constraint foreign KEY idpart (idpartido)  references partido(idpartido);
alter table arbitraje add constraint foreign key idarb (idarbitro) references arbitro(idarbitro);

alter table arbitro add constraint foreign key (idrol) references rolarbitro(idrolarbitro);

alter table cronologia add constraint foreign key (idpartido) references partido(idpartido);
alter table cronologia add constraint foreign key (idevento) references evento(idevento);
alter table cronologia add constraint foreign key (idjugador1) references jugador(idjugador);
alter table cronologia add constraint foreign key (idjugador2) references jugador(idjugador);
