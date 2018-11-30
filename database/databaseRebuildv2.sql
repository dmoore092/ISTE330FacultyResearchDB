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
projectName VARCHAR(150) NOT NULL,
projectLead INT NOT NULL,
projectDescription VARCHAR(500) NOT NULL,
CONSTRAINT pk_project PRIMARY KEY(id),
CONSTRAINT fk_project FOREIGN KEY(projectLead) REFERENCES user(id)
);

DROP TABLE IF EXISTS projectUser;
CREATE TABLE projectUser(
projectId INT NOT NULL,
userId INT NOT NULL,
CONSTRAINT pk_projectUser PRIMARY KEY(projectId, userId),
CONSTRAINT fk_projectUser_userId FOREIGN KEY(userId) REFERENCES user(id),
CONSTRAINT fk_projectUser_projectId FOREIGN KEY(projectId) REFERENCES user(id)
);

-- populate user
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('gpavks', SHA2('a', 256),'Garret Arcoraci',NULL,'https://ist.rit.edu/assets/img/people/gpavks.jpg','Lecturer','cit nsa ist','GOL 2315',NULL,'5854757854','gpavks@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('ciiics', SHA2('a', 256),'Catherine Beaton',NULL,'https://ist.rit.edu/assets/img/people/ciiics.jpg','Associate Professor','hci hcc cit ist','GOL 2621','http://www.ist.rit.edu/~cib','585-281-6162','catherine.beaton@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dsbics', SHA2('a', 256),'Daniel Bogaard','Undergraduate Program Director','https://ist.rit.edu/assets/img/people/dsbics.jpg','Associate Professor','cit hcc wmc ist','GOL 2111','http://people.rit.edu/dsbics','5854755231','dsbics@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('cbbics', SHA2('a', 256),'Charlie Border',NULL,'https://ist.rit.edu/assets/img/people/cbbics.jpg','Associate Professor','cit ist nsa','GOL 2615',NULL,'585-475-7946','cbbics@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sgcics', SHA2('a', 256),'Stephen Cady',NULL,'https://ist.rit.edu/assets/img/people/sgcics.jpg','Visiting Lecturer','ist',NULL,NULL,NULL,NULL,1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('mjfics', SHA2('a', 256),'Michael Floeser',NULL,'https://ist.rit.edu/assets/img/people/mjfics.jpg','Senior Lecturer','ist cit wmc','GOL 2669',NULL,'585-475-7031','Michael.Floeser@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('bdfvks', SHA2('a', 256),'Bryan French','BS WMC Program Coordinator','https://ist.rit.edu/assets/img/people/bdfvks.jpg','Lecturer','cit ist wmc','GOL 2619',NULL,'(585) 475-6511','bdfvks@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('efgics', SHA2('a', 256),'Erik Golen',NULL,'https://ist.rit.edu/assets/img/people/efgics.jpg','Lecturer','nsa ist cit','GOL 2617',NULL,NULL,'efgics@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('jrhicsa', SHA2('a', 256),'James Habermas',NULL,'https://ist.rit.edu/assets/img/people/jrhicsa.jpg','Visiting Lecturer','wmc cit hcc hci nsa ist','GOL 2443',NULL,'475-6369','jrhicsa@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('vlhics', SHA2('a', 256),'Vicki Hanson',NULL,'https://ist.rit.edu/assets/img/people/vlhics.jpg','Professor Emerita','hci hcc','GOL 2645','https://vickihanson.org/','(585)-475-5384','vlh@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('bhhics', SHA2('a', 256),'Bruce Hartpence','Building networks and stuff','https://ist.rit.edu/assets/img/people/bhhics.jpg','Professor','cit ist nsa','GOL 2323','http://www.brucehartpence.com','585-475-7938','Bruce.Hartpence@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('amhgss', SHA2('a', 256),'Andrew Herbert','Dept. of Psychology',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('lwhfac', SHA2('a', 256),'Larry Hill','MS HIT Program Coordinator','https://ist.rit.edu/assets/img/people/lwhfac.jpg','Associate Professor','cit nsa ist hi','GOL 2331',NULL,'585-475-7064','Lawrence.Hill@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('ephics', SHA2('a', 256),'Ed Holden','MS IST Program Coordinator','https://ist.rit.edu/assets/img/people/ephics.jpg','Associate Professor','cit ist hi','GOL 2655','http://www.ist.rit.edu/','585-475-5361','edward.holden@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('mphics', SHA2('a', 256),'Matt Huenerfauth','MS HCI Program Coordinator','https://ist.rit.edu/assets/img/people/mphics.jpg','Professor','hcc hci','GOL 2659','http://huenerfauth.ist.rit.edu','585-475-2459','matt.huenerfauth (AT) rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sjhcco', SHA2('a', 256),'Sarah J. Huibregtse',NULL,'https://ist.rit.edu/assets/img/people/sjhcco.jpg','Visiting Lecturer','ist','GOL 2518','https://www.linkedin.com/in/sjhuibregtse',NULL,'sjhcco@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('jwkics', SHA2('a', 256),'Jai Kang',NULL,'https://ist.rit.edu/assets/img/people/jwkics.jpg','Associate Professor','cit ist hi','GOL 2651','http://www.jkang.com','585-475-5362','jai.kang@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('jalics', SHA2('a', 256),'Jeffrey Lasky','International Programs Coordin','https://ist.rit.edu/assets/img/people/jalics.jpg','Professor','cit ist','GOL 26xx',NULL,'585-475-2284','Jeffrey.Lasky@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('jalvks', SHA2('a', 256),'Jim Leone',NULL,'https://ist.rit.edu/assets/img/people/jalvks.jpg','Professor','cit ist nsa wmc','GOL 2657',NULL,'585-475-6451','jalvks@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('phlics', SHA2('a', 256),'Peter Lutz',NULL,'https://ist.rit.edu/assets/img/people/phlics.jpg','Professor','cit nsa ist','GOL 2345','http://www.ist.rit.edu/~phl','585-475-6162','Peter.Lutz@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('spmics', SHA2('a', 256),'Sharon Mason',NULL,'https://ist.rit.edu/assets/img/people/spmics.jpg','Professor','nsa cit ist','GOL 2319','http://ist.rit.edu/~spm','585-475-6989','Sharon.Mason@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('mjmics', SHA2('a', 256),'Michael McQuaid','BS HCC Program Coordinator','https://ist.rit.edu/assets/img/people/mjmics.jpg','Lecturer','cit ist hci hcc',NULL,NULL,NULL,'mickmcquaid@gmail.com',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('thoics', SHA2('a', 256),'Tae (Tom) Oh','MS NSA Program Coordinator','https://ist.rit.edu/assets/img/people/thoics.jpg','Associate Professor','hci hcc cit nsa ist wmc','GOL 2281','https://ist.rit.edu/~tho','585-475-7642','Tom.Oh@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dkpvcs', SHA2('a', 256),'David Patric',NULL,'https://ist.rit.edu/assets/img/people/dkpvcs.jpg','Visiting Lecturer','ist','GOL-2281',NULL,'585-475-5231','dkpvcs@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sphics', SHA2('a', 256),'Sylvia Perez-Hardy','BS CIT Program Coordinator','https://ist.rit.edu/assets/img/people/sphics.jpg','Associate Professor','cit nsa ist',NULL,NULL,'585-475-7941','sylvia.perez-hardy@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('djpihst', SHA2('a', 256),'Jerry Powell',NULL,'https://ist.rit.edu/assets/img/people/djpihst.jpg','Visiting Assistant Professor','hi','CBT-2161',NULL,'585-475-2487','djpihst@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('nxsvks', SHA2('a', 256),'Nirmala Shenoy',NULL,'https://ist.rit.edu/assets/img/people/nxsvks.jpg','Professor','cit nsa ist',NULL,'http://ist.rit.edu/~nxsvks/',NULL,'nxsvks@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('kssics', SHA2('a', 256),'Kristen Shinohara',NULL,'https://ist.rit.edu/assets/img/people/kssics.jpg','Assistant Professor','hci hcc',NULL,'http://www.kristenshinohara.com',NULL,'kssics@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('aesfaa', SHA2('a', 256),'Adam Smith','Program Chair',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('bmtski', SHA2('a', 256),'Brian Tomaszewski',NULL,'https://ist.rit.edu/assets/img/people/bmtski.jpg','Associate Professor','cit wmc','GOL 2673',NULL,'585-475-2859','bmtski@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('rpvvks', SHA2('a', 256),'Ronald Vullo','Web Design and Development','https://ist.rit.edu/assets/img/people/rpvvks.jpg','Associate Professor','cit ist wmc','GOL 2519','http://ist.rit.edu/~rpv/','585-475-7281','rpv@mail.rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('emwics', SHA2('a', 256),'Elissa Weeden',NULL,'https://ist.rit.edu/assets/img/people/emwics.jpg','Associate Professor','cit ist hcc hci','GOL 2635',NULL,'585-475-6733','emwics@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('qyuvks', SHA2('a', 256),'Qi Yu','Graduate Program Director','https://ist.rit.edu/assets/img/people/qyuvks.jpg','Associate Professor','cit ist nsa hci hi','GOL 2113','http://www.ist.rit.edu/~qyu/','585-475-6929','qyuvks@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sjzics', SHA2('a', 256),'Steve Zilora','Department Chair','https://ist.rit.edu/assets/img/people/sjzics.jpg','Professor','wmc cit hcc hci nsa ist hi','GOL 2109','http://ist.rit.edu/~sjz','585-475-7643','sjzics@rit.edu',1);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('jma6658', SHA2('a', 256),'Julian Arya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jma6658@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('axb4069', SHA2('a', 256),'Andrew Berson',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'axb4069@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('wkc6735', SHA2('a', 256),'Winston Chang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'wkc6735@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('bdc5435', SHA2('a', 256),'Brandon Connors',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bdc5435@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('see2797', SHA2('a', 256),'Samuel Evans',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'see2797@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('alk2993', SHA2('a', 256),'Andrew Kukielka',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alk2993@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('vk4534', SHA2('a', 256),'Vignesh Kumar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vk4534@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('kxl3544', SHA2('a', 256),'Kevin Lozano',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'kxl3544@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dxm2269', SHA2('a', 256),'Dishant Mishra',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dxm2269@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('djm7955', SHA2('a', 256),'Sylvia Mosquea Garcia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'djm7955@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('arp6333', SHA2('a', 256),'Ellie Parobek',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'arp6333@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('llr4395', SHA2('a', 256),'Lorenzo Romero',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'llr4395@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('lgs9654', SHA2('a', 256),'Luke Schwarting',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'lgs9654@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('rms1252', SHA2('a', 256),'Rachael Simmonds',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rms1252@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dxt4298', SHA2('a', 256),'Dominico Tran',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dxt4298@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('cet2576', SHA2('a', 256),'Clare Truell',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cet2576@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('ra7918', SHA2('a', 256),'Rixhers Ajazi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ra7918@mail.rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('ksc2650', SHA2('a', 256),'Kemoy Campbell',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ksc2650@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('cfc1182', SHA2('a', 256),'Cameron Casselman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cfc1182@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('clc8254', SHA2('a', 256),'Conner Catanese',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'clc8254@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dpc3140', SHA2('a', 256),'Daniel Chang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dpc3140@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('mc4107', SHA2('a', 256),'Mikhail Chebotar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mc4107@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('atc1512', SHA2('a', 256),'Andrew Costanzo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'atc1512@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('txd5857', SHA2('a', 256),'Tenzin Dhondup',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'txd5857@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('zpe4421', SHA2('a', 256),'Zachary Easley',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'zpe4421@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('ajg2473', SHA2('a', 256),'Andrew Grubbs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ajg2473@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('aj4693', SHA2('a', 256),'Anna Jacobsen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aj4693@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('axk3897', SHA2('a', 256),'Aaron Kelly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'axk3897@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('mxl4543', SHA2('a', 256),'Mei Ling Liu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mxl4543@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('axm6392', SHA2('a', 256),'Amina Mahmood',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'axm6392@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('bxm5989', SHA2('a', 256),'Brandon Mok',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bxm5989@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dwmdis', SHA2('a', 256),'Dale Moore',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dwmdis@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('jo8390', SHA2('a', 256),'Jacob OConnor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jo8390@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('nsp6459', SHA2('a', 256),'Nicholas Porillo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nsp6459@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('axr1623', SHA2('a', 256),'Abid Raja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'axr1623@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('dxs8115', SHA2('a', 256),'Demetri Sakellaropoulos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dxs8115@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('als6301', SHA2('a', 256),'Abbey Sands',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'als6301@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('cas8738', SHA2('a', 256),'Charles Shaner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cas8738@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('brt4557', SHA2('a', 256),'Benjamin Thorn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'brt4557@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('kmv7239', SHA2('a', 256),'Kevin Voltz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'kmv7239@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('acy8525', SHA2('a', 256),'Alexander Yu Huang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'acy8525@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('moa3971', SHA2('a', 256),'Mohammed Owaidh H Aljohani',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'moa3971@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sa9635', SHA2('a', 256),'Shatha Naqa Alotaibi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sa9635@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('axa5735', SHA2('a', 256),'Abeer Ali H Alshehri',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'axa5735@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('pa1001', SHA2('a', 256),'Pallavi Arora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pa1001@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('ppd1073', SHA2('a', 256),'Prajakta Prashant Deshpande',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ppd1073@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('rjl9447', SHA2('a', 256),'Ryan Leonard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rjl9447@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('lpn2762', SHA2('a', 256),'Lekha Pramodkumar Nahar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'lpn2762@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('mpn3885', SHA2('a', 256),'Mayuresh Pradeep Naik',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mpn3885@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('vxp9202', SHA2('a', 256),'Vismay Ashok Pandit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vxp9202@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sp5100', SHA2('a', 256),'Sulagna Patra',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sp5100@rit.edu',2);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email,role) VALUES ('sxr3463', SHA2('a', 256),'Shashank Prasanna Reddy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sxr3463@rit.edu',2);

-- populate project
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('IT Fluency in non-human primates', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed dapibus ipsum. Vivamus urna diam, consequat vitae turpis vel, ornare fermentum purus');  		
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('How accessiblity influences change in ferret behavior', 2, 'Duis suscipit ac urna at rhoncus. Donec ut dictum justo. Mauris volutpat tempor aliquam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Web 3.0; Where is it?', 3, 'Aliquam blandit, ante vel elementum scelerisque, quam lectus tempor nunc, et mattis diam mauris sit amet ex. Maecenas condimentum, velit non egestas congue, libero nulla commodo est, eget consectetur felis est id lectus.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('faculty tools related to abduction', 4, 'Proin magna diam, rhoncus vel nisi nec, maximus varius diam. Integer elit odio, pellentesque et congue at, sodales et sem.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('SOAP: not just for cleaning anymore', 5, 'Suspendisse lacus diam, aliquet et sapien sit amet, aliquet dictum mauris. Etiam eros eros, suscipit in sagittis eu, iaculis ultrices tellus.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('PHP performance in tomcat data mining', 6, 'Aliquam dictum ac diam id iaculis. Etiam congue, sapien ac viverra congue, justo quam auctor augue');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Web services, how did we get here?', 7, 'ac pretium nunc magna et risus. Fusce non scelerisque ligula. Morbi in cursus nisl. Curabitur ornare lorem dolor, ut fringilla dui fermentum nec. Etiam euismod nunc sed felis ultricies condimentum');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('FITness in informatics', 8, 'Sed hendrerit nibh ut feugiat efficitur.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('IIS in Java', 9, 'Sed bibendum diam sit amet nibh tincidunt, mattis porta leo mollis.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Cognitive Science in data mining', 10, 'Aliquam consectetur quis odio sit amet lobortis. Nullam eu fermentum elit, quis dapibus diam.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('C# and human memory', 11, 'Vestibulum felis velit, pellentesque nec sapien ac, pulvinar congue nibh. Maecenas consequat nisi lorem, a feugiat nisl faucibus vitae. In eu congue enim, nec efficitur dui.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('XML as it relates to course assignments', 12, 'Mauris ac vulputate metus. Morbi in maximus tortor.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Cirriculum education', 13, 'Sed tempus pulvinar nunc at malesuada. ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Databases are like human memory?', 14, 'Nullam sed dictum velit. ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Departmental management and faculty rebellions', 15, 'Quisque rutrum pretium diam et faucibus. Mauris turpis ligula');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('XML and you', 16, 'lobortis id tortor a, sollicitudin convallis mi. ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Java or PHP? Lets see that back end', 17, 'Nam viverra lacus vitae scelerisque bibendum. Etiam ut erat a quam aliquet egestas.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('net neutrality in the big data world', 18, 'In eget interdum sapien');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('SOAP: Actionable analytics', 19, 'vitae bibendum est. ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Run for the hills: AI and Machine learning', 20, 'Proin in rutrum arcu. ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Personalization and voice recognition', 21, 'Proin rutrum eros turpis, ac sodales massa dignissim in');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Chatbots: Not your mommas bots anymore', 22, 'Proin viverra ligula vel volutpat molestie');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('VR/AR/DR/PR and you', 23, 'Aenean ac faucibus nisl, eu congue arcu');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Robotics and the smart factory of the future', 24, 'Vivamus in aliquet mauris');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Internet of things and Quantum Computing', 25, 'eu convallis urna. Sed ac ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Blockchain: Make it so', 26, 'dapibus nunc, sit amet tincidunt ante');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Soup Lines: Technological unemployement and the coming catastrophe', 27, 'Fusce neque augue');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('WebDev in the Ai world', 28, 'consectetur a lorem ac');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('systems administration and the WWW', 29, 'maximus vestibulum sem');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Mobile First design', 30, 'Fusce feugiat vehicula arcu nec porttitor.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Why serverless archetecture is the future', 31, 'dolor sit amet, consectetur adipiscing elit. Ut sed dapibus ipsum. Vivamus');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Digital detox: take a break!', 32, 'diam, consequat vitae turpis vel, ornare ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('microservices and blockchain', 33, 'velit non egestas congue, libero nulla commodo est');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Dark data: who is watching the watchers?', 34, 'eget consectetur felis est id lectus. Proin magna diam, rhoncus');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Chatbots: Not your mommas bots anymore', 35, 'Proin viverra ligula vel volutpat molestie');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('VR/AR/DR/PR and you', 23, 'Aenean ac faucibus nisl, eu congue arcu');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Robotics and the smart factory of the future', 24, 'Vivamus in aliquet mauris');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Internet of things and Quantum Computing', 25, 'eu convallis urna. Sed ac ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Blockchain: Make it so', 26, 'dapibus nunc, sit amet tincidunt ante');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Soup Lines: Technological unemployement and the coming catastrophe', 27, 'Fusce neque augue');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('WebDev in the Ai world', 28, 'consectetur a lorem ac');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('systems administration and the WWW', 29, 'maximus vestibulum sem');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Mobile First design', 30, 'Fusce feugiat vehicula arcu nec porttitor.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Why serverless archetecture is the future', 31, 'dolor sit amet, consectetur adipiscing elit. Ut sed dapibus ipsum. Vivamus');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Digital detox: take a break!', 32, 'diam, consequat vitae turpis vel, ornare ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('microservices and blockchain', 33, 'velit non egestas congue, libero nulla commodo est');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Dark data: who is watching the watchers?', 34, 'eget consectetur felis est id lectus. Proin magna diam, rhoncus');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Cirriculum education', 13, 'Sed tempus pulvinar nunc at malesuada. ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Databases are like human memory?', 14, 'Nullam sed dictum velit. ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Departmental management and faculty rebellions', 15, 'Quisque rutrum pretium diam et faucibus. Mauris turpis ligula');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('XML and you', 16, 'lobortis id tortor a, sollicitudin convallis mi. ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Java or PHP? Lets see that back end', 17, 'Nam viverra lacus vitae scelerisque bibendum. Etiam ut erat a quam aliquet egestas.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('net neutrality in the big data world', 18, 'In eget interdum sapien');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('SOAP: Actionable analytics', 19, 'vitae bibendum est. ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Run for the hills: AI and Machine learning', 20, 'Proin in rutrum arcu. ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Personalization and voice recognition', 21, 'Proin rutrum eros turpis, ac sodales massa dignissim in');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Chatbots: Not your mommas bots anymore', 22, 'Proin viverra ligula vel volutpat molestie');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('VR/AR/DR/PR and you', 23, 'Aenean ac faucibus nisl, eu congue arcu');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Robotics and the smart factory of the future', 24, 'Vivamus in aliquet mauris');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Internet of things and Quantum Computing', 25, 'eu convallis urna. Sed ac ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Blockchain: Make it so', 26, 'dapibus nunc, sit amet tincidunt ante');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Soup Lines: Technological unemployement and the coming catastrophe', 27, 'Fusce neque augue');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('WebDev in the Ai world', 28, 'consectetur a lorem ac');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('systems administration and the WWW', 29, 'maximus vestibulum sem');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Mobile First design', 30, 'Fusce feugiat vehicula arcu nec porttitor.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Why serverless archetecture is the future', 31, 'dolor sit amet, consectetur adipiscing elit. Ut sed dapibus ipsum. Vivamus');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Digital detox: take a break!', 32, 'diam, consequat vitae turpis vel, ornare ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('microservices and blockchain', 33, 'velit non egestas congue, libero nulla commodo est');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Dark data: who is watching the watchers?', 34, 'eget consectetur felis est id lectus. Proin magna diam, rhoncus');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Chatbots: Not your mommas bots anymore', 22, 'Proin viverra ligula vel volutpat molestie');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('VR/AR/DR/PR and you', 23, 'Aenean ac faucibus nisl, eu congue arcu');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Robotics and the smart factory of the future', 24, 'Vivamus in aliquet mauris');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Internet of things and Quantum Computing', 25, 'eu convallis urna. Sed ac ');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Blockchain: Make it so', 26, 'dapibus nunc, sit amet tincidunt ante');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('IT Fluency in non-human primates', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed dapibus ipsum. Vivamus urna diam, consequat vitae turpis vel, ornare fermentum purus');  		
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('How accessiblity influences change in ferret behavior', 2, 'Duis suscipit ac urna at rhoncus. Donec ut dictum justo. Mauris volutpat tempor aliquam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Web 3.0; Where is it?', 3, 'Aliquam blandit, ante vel elementum scelerisque, quam lectus tempor nunc, et mattis diam mauris sit amet ex. Maecenas condimentum, velit non egestas congue, libero nulla commodo est, eget consectetur felis est id lectus.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('faculty tools related to abduction', 4, 'Proin magna diam, rhoncus vel nisi nec, maximus varius diam. Integer elit odio, pellentesque et congue at, sodales et sem.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('SOAP: not just for cleaning anymore', 5, 'Suspendisse lacus diam, aliquet et sapien sit amet, aliquet dictum mauris. Etiam eros eros, suscipit in sagittis eu, iaculis ultrices tellus.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('PHP performance in tomcat data mining', 6, 'Aliquam dictum ac diam id iaculis. Etiam congue, sapien ac viverra congue, justo quam auctor augue');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Web services, how did we get here?', 7, 'ac pretium nunc magna et risus. Fusce non scelerisque ligula. Morbi in cursus nisl. Curabitur ornare lorem dolor, ut fringilla dui fermentum nec. Etiam euismod nunc sed felis ultricies condimentum');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('FITness in informatics', 8, 'Sed hendrerit nibh ut feugiat efficitur.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('IIS in Java', 9, 'Sed bibendum diam sit amet nibh tincidunt, mattis porta leo mollis.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('Cognitive Science in data mining', 10, 'Aliquam consectetur quis odio sit amet lobortis. Nullam eu fermentum elit, quis dapibus diam.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('C# and human memory', 11, 'Vestibulum felis velit, pellentesque nec sapien ac, pulvinar congue nibh. Maecenas consequat nisi lorem, a feugiat nisl faucibus vitae. In eu congue enim, nec efficitur dui.');
INSERT INTO project(projectName, projectLead, projectDescription)VALUES('XML as it relates to course assignments', 12, 'Mauris ac vulputate metus. Morbi in maximus tortor.');

-- populate projectUser
INSERT INTO projectUser(projectId, userId)
SELECT  p.id, u.id
FROM    project p JOIN user u;

SET FOREIGN_KEY_CHECKS=1;
