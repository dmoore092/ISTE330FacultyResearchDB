-- DROP DATABASE IF EXISTS collaborit;
-- CREATE DATABASE collaborit;

USE iste330t01;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS user;
CREATE TABLE user(
id INT AUTO_INCREMENT,
username VARCHAR(20) NOT NULL,
password VARCHAR(100) NOT NULL,
name VARCHAR(50) NOT NULL,
tagline VARCHAR(150),
imagePath VARCHAR(150),
title VARCHAR(40),
interestArea VARCHAR(50),
office VARCHAR(20),
website VARCHAR(50),
phone VARCHAR(20),
email VARCHAR(40),
role INT,
CONSTRAINT pk_users PRIMARY KEY(id)
);

DROP TABLE IF EXISTS project;
CREATE TABLE project(
id INT AUTO_INCREMENT,
projectName VARCHAR(20) NOT NULL,
projectLead VARCHAR(20) NOT NULL,
projectDescription VARCHAR(20) NOT NULL,
CONSTRAINT pk_project PRIMARY KEY(id)
);

DROP TABLE IF EXISTS projectUsers;
CREATE TABLE projectUsers(
projectId INT NOT NULL,
userId INT NOT NULL,
CONSTRAINT pk_projectUser PRIMARY KEY(projectId, userId),
CONSTRAINT fk_projectUser_userId FOREIGN KEY(userId) REFERENCES users(id),
CONSTRAINT fk_projectUser_projectId FOREIGN KEY(projectId) REFERENCES users(id)
);

INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('gpavks','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Garret Arcoraci',NULL,'https://ist.rit.edu/assets/img/people/gpavks.jpg','Lecturer','cit nsa ist','GOL 2315',NULL,'5854757854','gpavks@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('ciiics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Catherine Beaton',NULL,'https://ist.rit.edu/assets/img/people/ciiics.jpg','Associate Professor','hci hcc cit ist','GOL 2621','http://www.ist.rit.edu/~cib','585-281-6162','catherine.beaton@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dsbics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Daniel Bogaard','Undergraduate Program Director','https://ist.rit.edu/assets/img/people/dsbics.jpg','Associate Professor','cit hcc wmc ist','GOL 2111','http://people.rit.edu/dsbics','5854755231','dsbics@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('cbbics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Charlie Border',NULL,'https://ist.rit.edu/assets/img/people/cbbics.jpg','Associate Professor','cit ist nsa','GOL 2615',NULL,'585-475-7946','cbbics@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sgcics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Stephen Cady',NULL,'https://ist.rit.edu/assets/img/people/sgcics.jpg','Visiting Lecturer','ist',NULL,NULL,NULL,NULL,1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('mjfics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Michael Floeser',NULL,'https://ist.rit.edu/assets/img/people/mjfics.jpg','Senior Lecturer','ist cit wmc','GOL 2669',NULL,'585-475-7031','Michael.Floeser@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('bdfvks','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Bryan French','BS WMC Program Coordinator','https://ist.rit.edu/assets/img/people/bdfvks.jpg','Lecturer','cit ist wmc','GOL 2619',NULL,'(585) 475-6511','bdfvks@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('efgics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Erik Golen',NULL,'https://ist.rit.edu/assets/img/people/efgics.jpg','Lecturer','nsa ist cit','GOL 2617',NULL,NULL,'efgics@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('jrhicsa','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','James Habermas',NULL,'https://ist.rit.edu/assets/img/people/jrhicsa.jpg','Visiting Lecturer','wmc cit hcc hci nsa ist','GOL 2443',NULL,'475-6369','jrhicsa@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('vlhics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Vicki Hanson',NULL,'https://ist.rit.edu/assets/img/people/vlhics.jpg','Professor Emerita','hci hcc','GOL 2645','https://vickihanson.org/','(585)-475-5384','vlh@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('bhhics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Bruce Hartpence','Building networks and stuff','https://ist.rit.edu/assets/img/people/bhhics.jpg','Professor','cit ist nsa','GOL 2323','http://www.brucehartpence.com','585-475-7938','Bruce.Hartpence@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('amhgss','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Andrew Herbert','Dept. of Psychology',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('lwhfac','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Larry Hill','MS HIT Program Coordinator','https://ist.rit.edu/assets/img/people/lwhfac.jpg','Associate Professor','cit nsa ist hi','GOL 2331',NULL,'585-475-7064','Lawrence.Hill@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('ephics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Ed Holden','MS IST Program Coordinator','https://ist.rit.edu/assets/img/people/ephics.jpg','Associate Professor','cit ist hi','GOL 2655','http://www.ist.rit.edu/','585-475-5361','edward.holden@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('mphics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Matt Huenerfauth','MS HCI Program Coordinator','https://ist.rit.edu/assets/img/people/mphics.jpg','Professor','hcc hci','GOL 2659','http://huenerfauth.ist.rit.edu','585-475-2459','matt.huenerfauth (AT) rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sjhcco','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Sarah J. Huibregtse',NULL,'https://ist.rit.edu/assets/img/people/sjhcco.jpg','Visiting Lecturer','ist','GOL 2518','https://www.linkedin.com/in/sjhuibregtse',NULL,'sjhcco@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('jwkics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Jai Kang',NULL,'https://ist.rit.edu/assets/img/people/jwkics.jpg','Associate Professor','cit ist hi','GOL 2651','http://www.jkang.com','585-475-5362','jai.kang@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('jalics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Jeffrey Lasky','International Programs Coordin','https://ist.rit.edu/assets/img/people/jalics.jpg','Professor','cit ist','GOL 26xx',NULL,'585-475-2284','Jeffrey.Lasky@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('jalvks','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Jim Leone',NULL,'https://ist.rit.edu/assets/img/people/jalvks.jpg','Professor','cit ist nsa wmc','GOL 2657',NULL,'585-475-6451','jalvks@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('phlics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Peter Lutz',NULL,'https://ist.rit.edu/assets/img/people/phlics.jpg','Professor','cit nsa ist','GOL 2345','http://www.ist.rit.edu/~phl','585-475-6162','Peter.Lutz@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('spmics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Sharon Mason',NULL,'https://ist.rit.edu/assets/img/people/spmics.jpg','Professor','nsa cit ist','GOL 2319','http://ist.rit.edu/~spm','585-475-6989','Sharon.Mason@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('mjmics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Michael McQuaid','BS HCC Program Coordinator','https://ist.rit.edu/assets/img/people/mjmics.jpg','Lecturer','cit ist hci hcc',NULL,NULL,NULL,'mickmcquaid@gmail.com',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('thoics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Tae (Tom) Oh','MS NSA Program Coordinator','https://ist.rit.edu/assets/img/people/thoics.jpg','Associate Professor','hci hcc cit nsa ist wmc','GOL 2281','https://ist.rit.edu/~tho','585-475-7642','Tom.Oh@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dkpvcs','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','David Patric',NULL,'https://ist.rit.edu/assets/img/people/dkpvcs.jpg','Visiting Lecturer','ist','GOL-2281',NULL,'585-475-5231','dkpvcs@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sphics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Sylvia Perez-Hardy','BS CIT Program Coordinator','https://ist.rit.edu/assets/img/people/sphics.jpg','Associate Professor','cit nsa ist',NULL,NULL,'585-475-7941','sylvia.perez-hardy@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('djpihst','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Jerry Powell',NULL,'https://ist.rit.edu/assets/img/people/djpihst.jpg','Visiting Assistant Professor','hi','CBT-2161',NULL,'585-475-2487','djpihst@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('nxsvks','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Nirmala Shenoy',NULL,'https://ist.rit.edu/assets/img/people/nxsvks.jpg','Professor','cit nsa ist',NULL,'http://ist.rit.edu/~nxsvks/',NULL,'nxsvks@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('kssics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Kristen Shinohara',NULL,'https://ist.rit.edu/assets/img/people/kssics.jpg','Assistant Professor','hci hcc',NULL,'http://www.kristenshinohara.com',NULL,'kssics@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('aesfaa','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Adam Smith','Program Chair',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('bmtski','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Brian Tomaszewski',NULL,'https://ist.rit.edu/assets/img/people/bmtski.jpg','Associate Professor','cit wmc','GOL 2673',NULL,'585-475-2859','bmtski@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('rpvvks','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Ronald Vullo','Web Design and Development','https://ist.rit.edu/assets/img/people/rpvvks.jpg','Associate Professor','cit ist wmc','GOL 2519','http://ist.rit.edu/~rpv/','585-475-7281','rpv@mail.rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('emwics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Elissa Weeden',NULL,'https://ist.rit.edu/assets/img/people/emwics.jpg','Associate Professor','cit ist hcc hci','GOL 2635',NULL,'585-475-6733','emwics@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('qyuvks','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Qi Yu','Graduate Program Director','https://ist.rit.edu/assets/img/people/qyuvks.jpg','Associate Professor','cit ist nsa hci hi','GOL 2113','http://www.ist.rit.edu/~qyu/','585-475-6929','qyuvks@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sjzics','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Steve Zilora','Department Chair','https://ist.rit.edu/assets/img/people/sjzics.jpg','Professor','wmc cit hcc hci nsa ist hi','GOL 2109','http://ist.rit.edu/~sjz','585-475-7643','sjzics@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('jma6658','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Julian Arya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jma6658@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('axb4069','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Andrew Berson',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'axb4069@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('wkc6735','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Winston Chang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'wkc6735@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('bdc5435','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Brandon Connors',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bdc5435@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('see2797','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Samuel Evans',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'see2797@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('alk2993','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Andrew Kukielka',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alk2993@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('vk4534','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Vignesh Kumar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vk4534@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('kxl3544','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Kevin Lozano',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'kxl3544@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dxm2269','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Dishant Mishra',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dxm2269@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('djm7955','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Sylvia Mosquea Garcia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'djm7955@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('arp6333','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Ellie Parobek',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'arp6333@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('llr4395','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Lorenzo Romero',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'llr4395@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('lgs9654','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Luke Schwarting',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'lgs9654@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('rms1252','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Rachael Simmonds',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rms1252@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dxt4298','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Dominico Tran',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dxt4298@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('cet2576','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Clare Truell',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cet2576@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('ra7918','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Rixhers Ajazi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ra7918@mail.rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('ksc2650','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Kemoy Campbell',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ksc2650@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('cfc1182','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Cameron Casselman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cfc1182@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('clc8254','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Conner Catanese',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'clc8254@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dpc3140','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Daniel Chang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dpc3140@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('mc4107','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Mikhail Chebotar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mc4107@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('atc1512','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Andrew Costanzo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'atc1512@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('txd5857','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Tenzin Dhondup',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'txd5857@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('zpe4421','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Zachary Easley',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'zpe4421@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('ajg2473','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Andrew Grubbs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ajg2473@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('aj4693','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Anna Jacobsen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aj4693@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('axk3897','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Aaron Kelly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'axk3897@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('mxl4543','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Mei Ling Liu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mxl4543@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('axm6392','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Amina Mahmood',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'axm6392@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('bxm5989','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Brandon Mok',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bxm5989@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dwmdis','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Dale Moore',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dwmdis@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('jo8390','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Jacob OConnor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jo8390@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('nsp6459','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Nicholas Porillo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nsp6459@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('axr1623','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Abid Raja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'axr1623@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dxs8115','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Demetri Sakellaropoulos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dxs8115@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('als6301','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Abbey Sands',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'als6301@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('cas8738','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Charles Shaner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cas8738@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('brt4557','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Benjamin Thorn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'brt4557@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('kmv7239','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Kevin Voltz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'kmv7239@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('acy8525','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Alexander Yu Huang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'acy8525@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('moa3971','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Mohammed Owaidh H Aljohani',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'moa3971@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sa9635','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Shatha Naqa Alotaibi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sa9635@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('axa5735','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Abeer Ali H Alshehri',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'axa5735@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('pa1001','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Pallavi Arora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pa1001@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('ppd1073','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Prajakta Prashant Deshpande',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ppd1073@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('rjl9447','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Ryan Leonard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rjl9447@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('lpn2762','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Lekha Pramodkumar Nahar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'lpn2762@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('mpn3885','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Mayuresh Pradeep Naik',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mpn3885@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('vxp9202','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Vismay Ashok Pandit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vxp9202@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sp5100','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Sulagna Patra',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sp5100@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sxr3463','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','Shashank Prasanna Reddy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sxr3463@rit.edu',2);


SET FOREIGN_KEY_CHECKS=1;