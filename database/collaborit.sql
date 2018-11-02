DROP DATABASE IF EXISTS collaborit;
CREATE DATABASE collaborit;

USE collaborit;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
id int AUTO_INCREMENT,
username VARCHAR(20) NOT NULL,
name VARCHAR(50) NOT NULL,
role INT NOT NULL,
password VARCHAR(100) NOT NULL,
tagline VARCHAR(150),
title VARCHAR(40),
interestArea VARCHAR(50),
office VARCHAR(20),
email VARCHAR(40),
CONSTRAINT pk_users PRIMARY KEY(id)
);

DROP TABLE IF EXISTS project;
CREATE TABLE project(
id int AUTO_INCREMENT,
projectName VARCHAR(20) NOT NULL,
projectLead VARCHAR(20) NOT NULL,
projectDescription VARCHAR(20) NOT NULL,
CONSTRAINT pk_project PRIMARY KEY(id)
);

DROP TABLE IF EXISTS projectUser;
CREATE TABLE projectUser(
projectId int NOT NULL,
userId int NOT NULL,
CONSTRAINT pk_projectUser PRIMARY KEY(projectId, userId),
CONSTRAINT fk_projectUser_userId FOREIGN KEY(userId) REFERENCES users(userId),
CONSTRAINT fk_projectUser_projectId FOREIGN KEY(projectId) REFERENCES users(projectId)
);