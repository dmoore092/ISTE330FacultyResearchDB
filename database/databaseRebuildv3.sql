-- DROP DATABASE IF EXISTS collaborit;
-- CREATE DATABASE collaborit;

USE collaborit;

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
CONSTRAINT pk_users PRIMARY KEY(id)
);

DROP TABLE IF EXISTS student;
CREATE TABLE student(
id INT AUTO_INCREMENT,
username VARCHAR(20) NOT NULL,
password VARCHAR(100) NOT NULL,
name VARCHAR(50) NOT NULL,
email VARCHAR(40),
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
CONSTRAINT fk_projectUser_userId FOREIGN KEY(userId) REFERENCES student(id),
CONSTRAINT fk_projectUser_projectId FOREIGN KEY(projectId) REFERENCES project(id)
);

-- populate user
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('gpavks', SHA2('a', 256),'Garret Arcoraci',NULL,'https://ist.rit.edu/assets/img/people/gpavks.jpg','Lecturer','cit nsa ist','GOL 2315',NULL,'5854757854','gpavks@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('ciiics', SHA2('a', 256),'Catherine Beaton',NULL,'https://ist.rit.edu/assets/img/people/ciiics.jpg','Associate Professor','hci hcc cit ist','GOL 2621','http://www.ist.rit.edu/~cib','585-281-6162','catherine.beaton@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('dsbics', SHA2('a', 256),'Daniel Bogaard','Undergraduate Program Director','https://ist.rit.edu/assets/img/people/dsbics.jpg','Associate Professor','cit hcc wmc ist','GOL 2111','http://people.rit.edu/dsbics','5854755231','dsbics@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('cbbics', SHA2('a', 256),'Charlie Border',NULL,'https://ist.rit.edu/assets/img/people/cbbics.jpg','Associate Professor','cit ist nsa','GOL 2615',NULL,'585-475-7946','cbbics@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('sgcics', SHA2('a', 256),'Stephen Cady',NULL,'https://ist.rit.edu/assets/img/people/sgcics.jpg','Visiting Lecturer','ist',NULL,NULL,NULL,NULL);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('mjfics', SHA2('a', 256),'Michael Floeser',NULL,'https://ist.rit.edu/assets/img/people/mjfics.jpg','Senior Lecturer','ist cit wmc','GOL 2669',NULL,'585-475-7031','Michael.Floeser@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('bdfvks', SHA2('a', 256),'Bryan French','BS WMC Program Coordinator','https://ist.rit.edu/assets/img/people/bdfvks.jpg','Lecturer','cit ist wmc','GOL 2619',NULL,'(585) 475-6511','bdfvks@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('efgics', SHA2('a', 256),'Erik Golen',NULL,'https://ist.rit.edu/assets/img/people/efgics.jpg','Lecturer','nsa ist cit','GOL 2617',NULL,NULL,'efgics@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('jrhicsa', SHA2('a', 256),'James Habermas',NULL,'https://ist.rit.edu/assets/img/people/jrhicsa.jpg','Visiting Lecturer','wmc cit hcc hci nsa ist','GOL 2443',NULL,'475-6369','jrhicsa@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('vlhics', SHA2('a', 256),'Vicki Hanson',NULL,'https://ist.rit.edu/assets/img/people/vlhics.jpg','Professor Emerita','hci hcc','GOL 2645','https://vickihanson.org/','(585)-475-5384','vlh@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('bhhics', SHA2('a', 256),'Bruce Hartpence','Building networks and stuff','https://ist.rit.edu/assets/img/people/bhhics.jpg','Professor','cit ist nsa','GOL 2323','http://www.brucehartpence.com','585-475-7938','Bruce.Hartpence@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('amhgss', SHA2('a', 256),'Andrew Herbert','Dept. of Psychology',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('lwhfac', SHA2('a', 256),'Larry Hill','MS HIT Program Coordinator','https://ist.rit.edu/assets/img/people/lwhfac.jpg','Associate Professor','cit nsa ist hi','GOL 2331',NULL,'585-475-7064','Lawrence.Hill@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('ephics', SHA2('a', 256),'Ed Holden','MS IST Program Coordinator','https://ist.rit.edu/assets/img/people/ephics.jpg','Associate Professor','cit ist hi','GOL 2655','http://www.ist.rit.edu/','585-475-5361','edward.holden@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('mphics', SHA2('a', 256),'Matt Huenerfauth','MS HCI Program Coordinator','https://ist.rit.edu/assets/img/people/mphics.jpg','Professor','hcc hci','GOL 2659','http://huenerfauth.ist.rit.edu','585-475-2459','matt.huenerfauth (AT) rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('sjhcco', SHA2('a', 256),'Sarah J. Huibregtse',NULL,'https://ist.rit.edu/assets/img/people/sjhcco.jpg','Visiting Lecturer','ist','GOL 2518','https://www.linkedin.com/in/sjhuibregtse',NULL,'sjhcco@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('jwkics', SHA2('a', 256),'Jai Kang',NULL,'https://ist.rit.edu/assets/img/people/jwkics.jpg','Associate Professor','cit ist hi','GOL 2651','http://www.jkang.com','585-475-5362','jai.kang@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('jalics', SHA2('a', 256),'Jeffrey Lasky','International Programs Coordin','https://ist.rit.edu/assets/img/people/jalics.jpg','Professor','cit ist','GOL 26xx',NULL,'585-475-2284','Jeffrey.Lasky@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('jalvks', SHA2('a', 256),'Jim Leone',NULL,'https://ist.rit.edu/assets/img/people/jalvks.jpg','Professor','cit ist nsa wmc','GOL 2657',NULL,'585-475-6451','jalvks@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('phlics', SHA2('a', 256),'Peter Lutz',NULL,'https://ist.rit.edu/assets/img/people/phlics.jpg','Professor','cit nsa ist','GOL 2345','http://www.ist.rit.edu/~phl','585-475-6162','Peter.Lutz@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('spmics', SHA2('a', 256),'Sharon Mason',NULL,'https://ist.rit.edu/assets/img/people/spmics.jpg','Professor','nsa cit ist','GOL 2319','http://ist.rit.edu/~spm','585-475-6989','Sharon.Mason@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('mjmics', SHA2('a', 256),'Michael McQuaid','BS HCC Program Coordinator','https://ist.rit.edu/assets/img/people/mjmics.jpg','Lecturer','cit ist hci hcc',NULL,NULL,NULL,'mickmcquaid@gmail.com');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('thoics', SHA2('a', 256),'Tae (Tom) Oh','MS NSA Program Coordinator','https://ist.rit.edu/assets/img/people/thoics.jpg','Associate Professor','hci hcc cit nsa ist wmc','GOL 2281','https://ist.rit.edu/~tho','585-475-7642','Tom.Oh@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('dkpvcs', SHA2('a', 256),'David Patric',NULL,'https://ist.rit.edu/assets/img/people/dkpvcs.jpg','Visiting Lecturer','ist','GOL-2281',NULL,'585-475-5231','dkpvcs@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('sphics', SHA2('a', 256),'Sylvia Perez-Hardy','BS CIT Program Coordinator','https://ist.rit.edu/assets/img/people/sphics.jpg','Associate Professor','cit nsa ist',NULL,NULL,'585-475-7941','sylvia.perez-hardy@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('djpihst', SHA2('a', 256),'Jerry Powell',NULL,'https://ist.rit.edu/assets/img/people/djpihst.jpg','Visiting Assistant Professor','hi','CBT-2161',NULL,'585-475-2487','djpihst@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('nxsvks', SHA2('a', 256),'Nirmala Shenoy',NULL,'https://ist.rit.edu/assets/img/people/nxsvks.jpg','Professor','cit nsa ist',NULL,'http://ist.rit.edu/~nxsvks/',NULL,'nxsvks@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('kssics', SHA2('a', 256),'Kristen Shinohara',NULL,'https://ist.rit.edu/assets/img/people/kssics.jpg','Assistant Professor','hci hcc',NULL,'http://www.kristenshinohara.com',NULL,'kssics@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('aesfaa', SHA2('a', 256),'Adam Smith','Program Chair',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('bmtski', SHA2('a', 256),'Brian Tomaszewski',NULL,'https://ist.rit.edu/assets/img/people/bmtski.jpg','Associate Professor','cit wmc','GOL 2673',NULL,'585-475-2859','bmtski@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('rpvvks', SHA2('a', 256),'Ronald Vullo','Web Design and Development','https://ist.rit.edu/assets/img/people/rpvvks.jpg','Associate Professor','cit ist wmc','GOL 2519','http://ist.rit.edu/~rpv/','585-475-7281','rpv@mail.rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('emwics', SHA2('a', 256),'Elissa Weeden',NULL,'https://ist.rit.edu/assets/img/people/emwics.jpg','Associate Professor','cit ist hcc hci','GOL 2635',NULL,'585-475-6733','emwics@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('qyuvks', SHA2('a', 256),'Qi Yu','Graduate Program Director','https://ist.rit.edu/assets/img/people/qyuvks.jpg','Associate Professor','cit ist nsa hci hi','GOL 2113','http://www.ist.rit.edu/~qyu/','585-475-6929','qyuvks@rit.edu');
INSERT INTO user(username,password,name,tagline,imagePath,title,interestArea,office,website,phone,email) VALUES ('sjzics', SHA2('a', 256),'Steve Zilora','Department Chair','https://ist.rit.edu/assets/img/people/sjzics.jpg','Professor','wmc cit hcc hci nsa ist hi','GOL 2109','http://ist.rit.edu/~sjz','585-475-7643','sjzics@rit.edu');


-- populate student
INSERT INTO student(username,password,name,email) VALUES ('axb4069', SHA2('a', 256),'Andrew Berson','axb4069@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('wkc6735', SHA2('a', 256),'Winston Chang','wkc6735@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('bdc5435', SHA2('a', 256),'Brandon Connors','bdc5435@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('see2797', SHA2('a', 256),'Samuel Evans','see2797@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('alk2993', SHA2('a', 256),'Andrew Kukielka','alk2993@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('vk4534', SHA2('a', 256),'Vignesh Kumar','vk4534@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('kxl3544', SHA2('a', 256),'Kevin Lozano','kxl3544@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('dxm2269', SHA2('a', 256),'Dishant Mishra','dxm2269@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('djm7955', SHA2('a', 256),'Sylvia Mosquea Garcia','djm7955@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('arp6333', SHA2('a', 256),'Ellie Parobek','arp6333@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('llr4395', SHA2('a', 256),'Lorenzo Romero','llr4395@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('lgs9654', SHA2('a', 256),'Luke Schwarting','lgs9654@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('rms1252', SHA2('a', 256),'Rachael Simmonds','rms1252@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('dxt4298', SHA2('a', 256),'Dominico Tran','dxt4298@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('cet2576', SHA2('a', 256),'Clare Truell','cet2576@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('ra7918', SHA2('a', 256),'Rixhers Ajazi','ra7918@mail.rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('ksc2650', SHA2('a', 256),'Kemoy Campbell','ksc2650@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('cfc1182', SHA2('a', 256),'Cameron Casselman','cfc1182@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('clc8254', SHA2('a', 256),'Conner Catanese','clc8254@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('dpc3140', SHA2('a', 256),'Daniel Chang','dpc3140@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('mc4107', SHA2('a', 256),'Mikhail Chebotar','mc4107@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('atc1512', SHA2('a', 256),'Andrew Costanzo','atc1512@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('txd5857', SHA2('a', 256),'Tenzin Dhondup','txd5857@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('zpe4421', SHA2('a', 256),'Zachary Easley','zpe4421@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('ajg2473', SHA2('a', 256),'Andrew Grubbs','ajg2473@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('aj4693', SHA2('a', 256),'Anna Jacobsen','aj4693@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('axk3897', SHA2('a', 256),'Aaron Kelly','axk3897@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('mxl4543', SHA2('a', 256),'Mei Ling Liu','mxl4543@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('axm6392', SHA2('a', 256),'Amina Mahmood','axm6392@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('bxm5989', SHA2('a', 256),'Brandon Mok','bxm5989@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('dwmdis', SHA2('a', 256),'Dale Moore','dwmdis@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('jo8390', SHA2('a', 256),'Jacob OConnor','jo8390@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('nsp6459', SHA2('a', 256),'Nicholas Porillo','nsp6459@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('axr1623', SHA2('a', 256),'Abid Raja','axr1623@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('dxs8115', SHA2('a', 256),'Demetri Sakellaropoulos','dxs8115@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('als6301', SHA2('a', 256),'Abbey Sands','als6301@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('cas8738', SHA2('a', 256),'Charles Shaner','cas8738@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('brt4557', SHA2('a', 256),'Benjamin Thorn','brt4557@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('kmv7239', SHA2('a', 256),'Kevin Voltz','kmv7239@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('acy8525', SHA2('a', 256),'Alexander Yu Huang','acy8525@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('moa3971', SHA2('a', 256),'Mohammed Owaidh H Aljohani','moa3971@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('sa9635', SHA2('a', 256),'Shatha Naqa Alotaibi','sa9635@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('axa5735', SHA2('a', 256),'Abeer Ali H Alshehri','axa5735@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('pa1001', SHA2('a', 256),'Pallavi Arora','pa1001@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('ppd1073', SHA2('a', 256),'Prajakta Prashant Deshpande','ppd1073@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('rjl9447', SHA2('a', 256),'Ryan Leonard','rjl9447@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('lpn2762', SHA2('a', 256),'Lekha Pramodkumar Nahar','lpn2762@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('mpn3885', SHA2('a', 256),'Mayuresh Pradeep Naik','mpn3885@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('vxp9202', SHA2('a', 256),'Vismay Ashok Pandit','vxp9202@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('sp5100', SHA2('a', 256),'Sulagna Patra','sp5100@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('sxr3463', SHA2('a', 256),'Shashank Prasanna Reddy','sxr3463@rit.edu');
INSERT INTO student(username,password,name,email) VALUES ('jma6658', SHA2('a', 256),'Julian Arya','jma6658@rit.edu');


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