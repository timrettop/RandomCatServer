-- schema to create database for DockFlask

-- Create database
CREATE DATABASE IF NOT EXISTS flask;

-- Create user
CREATE USER IF NOT EXISTS 'flaskdev'@'%';
ALTER USER 'flask'@'%'
IDENTIFIED BY 'flaskdb' ;
GRANT Insert ON flask.* TO 'flaskdev'@'%';
GRANT Select ON flask.* TO 'flaskdev'@'%';
FLUSH PRIVILEGES;

CREATE TABLE flask.CatPicture (
	PicID INT(11) NOT NULL AUTO_INCREMENT,
	Picture VARCHAR(256) NOT NULL,
	PRIMARY KEY('PicID')
);


