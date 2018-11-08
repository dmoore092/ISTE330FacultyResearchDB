-- DROP DATABASE IF EXISTS collaborit;
-- CREATE DATABASE collaborit;

USE iste330t01;

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
projectLead VARCHAR(150) NOT NULL,
projectDescription VARCHAR(5000) NOT NULL,
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
