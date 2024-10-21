CREATE DATABASE IF NOT EXISTS photoshare;
USE photoshare;
DROP TABLE IF EXISTS Pictures CASCADE;
DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS Albums CASCADE;
DROP TABLE IF EXISTS Comments CASCADE;
DROP TABLE IF EXISTS Likes CASCADE;
DROP TABLE IF EXISTS Tags CASCADE; 
DROP TABLE IF EXISTS Tagged CASCADE; 
DROP TABLE IF EXISTS Friendship CASCADE;

CREATE TABLE Users
(
	user_id INT NOT NULL auto_increment,
    gender VARCHAR(6),
	email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(40) NOT NULL,
    dob DATE NOT NULL,
    hometown VARCHAR(40),
    fname VARCHAR(40) NOT NULL,
    lname VARCHAR(40) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE Albums
(
	album_id INT auto_increment,
    Name VARCHAR(40) NOT NULL,
    date_of_creation DATETIME DEFAULT current_timestamp,
    user_id INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Pictures
(
  picture_id INT AUTO_INCREMENT,
  user_id INT,
  caption VARCHAR(200),
  imgdata longblob ,
  album_id INT NOT NULL,
  PRIMARY KEY (picture_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (album_id) REFERENCES Albums(album_id) ON DELETE CASCADE
);

CREATE TABLE Comments
(
	comment_id INT NOT NULL auto_increment,
    text TEXT NOT NULL,
    date DATETIME DEFAULT current_timestamp,
    user_id INT NOT NULL,
    picture_id INT NOT NULL,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (picture_id) REFERENCES Pictures(picture_id) ON DELETE CASCADE
);

CREATE TABLE Likes
(
	user_id INT NOT NULL,
    picture_id INT NOT NULL,
    PRIMARY KEY (picture_id, user_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (picture_id) REFERENCES Pictures(picture_id) ON DELETE CASCADE
);

CREATE TABLE Tags
(
	tag_id INT,
    name VARCHAR(100),
    PRIMARY KEY (tag_id)
);

CREATE TABLE Tagged
(
	picture_id INT,
    tag_id INT,
    PRIMARY KEY (picture_id, tag_id),
    FOREIGN KEY (picture_id) REFERENCES Pictures(picture_id),
    FOREIGN KEY (tag_id) REFERENCES Tags(tag_id)
);

CREATE TABLE Friendship
(
	UID1 INT NOT NULL,
    UID2 INT NOT NULL,
    CHECK (UID1 <> UID2),
	PRIMARY KEY (UID1, UID2),
    FOREIGN KEY (UID1) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (UID2) REFERENCES Users(user_id) ON DELETE CASCADE
);

