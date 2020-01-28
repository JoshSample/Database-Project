DROP TABLE Artists CASCADE CONSTRAINTS;
DROP TABLE Songs CASCADE CONSTRAINTS;
DROP TABLE Charts CASCADE CONSTRAINTS;
DROP TABLE Podcast CASCADE CONSTRAINTS;
DROP TABLE Albums CASCADE CONSTRAINTS;
DROP TABLE Concert_Tickets CASCADE CONSTRAINTS;
DROP TABLE Chart_type CASCADE CONSTRAINTS;
DROP TABLE Podcast_eps CASCADE CONSTRAINTS;
DROP TABLE Top_Podcast CASCADE CONSTRAINTS;
DROP TABLE Song_charts CASCADE CONSTRAINTS;
DROP TABLE Album_songs CASCADE CONSTRAINTS;
DROP TABLE Performed_by CASCADE CONSTRAINTS;
DROP TABLE Artist_creates CASCADE CONSTRAINTS;


CREATE TABLE Artists(
Artist_name         VARCHAR2(50) CONSTRAINT Artists_Artist_name_NN NOT NULL,
Related_artists     VARCHAR2(50),
Monthly_listeners   NUMBER(10),
CONSTRAINT Artists_Artist_name_PK PRIMARY KEY (Artist_name));

CREATE TABLE Songs(
Song_name           VARCHAR2(60) CONSTRAINT Songs_Song_name_NN NOT NULL,
Song_length         CHAR(6),
Genre               VARCHAR2(15),
Number_of_plays     NUMBER(10),
CONSTRAINT Songs_Song_name_PK PRIMARY KEY (Song_name));

CREATE TABLE Charts(
Chart_title         VARCHAR2(40) CONSTRAINT Charts_Chart_title_NN NOT NULL,
CONSTRAINT Charts_Chart_title_PK PRIMARY KEY (Chart_title));

CREATE TABLE Podcast(
Podcast_name        VARCHAR2(50) CONSTRAINT Podcast_Podcast_name_NN NOT NULL,
Creator             VARCHAR2(50),
Genre               VARCHAR2(30),
CONSTRAINT Podcast_Podcast_name_PK PRIMARY KEY (Podcast_name));

CREATE TABLE Albums(
Record_label        VARCHAR2(40) CONSTRAINT Albums_Record_label_NN NOT NULL,
Album_name          VARCHAR2(40) CONSTRAINT Albums_Album_name_NN NOT NULL,
Song_count          NUMBER(3),
Runtime             CHAR(7),
CONSTRAINT Albums_PK PRIMARY KEY (Record_label, Album_name));

CREATE TABLE Concert_Tickets(
Line_up             VARCHAR2(60),
Locale              VARCHAR2(50),
Price               NUMBER(5, 2),
C_date              DATE,
Offered_by          VARCHAR2(50) CONSTRAINT Concert_Tickets_Offered_by_NN NOT NULL);

CREATE TABLE Podcast_eps(
Podcast_name        VARCHAR2(50) CONSTRAINT Podcast_eps_Podcast_name_NN NOT NULL,
Episode_title       VARCHAR2(100),
Episode_length      CHAR(7),
Release_date        DATE);

CREATE TABLE Chart_type(
Chart_title         VARCHAR2(40) CONSTRAINT Chart_type_Chart_title_NN NOT NULL,
C_type                VARCHAR2(50) CONSTRAINT Chart_type_C_type_NN NOT NULL);

CREATE TABLE Top_Podcast(
Chart_title         VARCHAR2(30) CONSTRAINT Top_Podcast_Chart_title_NN NOT NULL,
Podcast_name        VARCHAR2(50) CONSTRAINT Top_Podcast_Podcast_name_NN NOT NULL);

CREATE TABLE Song_charts(
Chart_title         VARCHAR2(30) CONSTRAINT Song_charts_Chart_title_NN NOT NULL,
Song_name           VARCHAR2(60) CONSTRAINT Song_charts_Song_name_NN NOT NULL);

CREATE TABLE Album_songs(
Song_name           VARCHAR2(60) CONSTRAINT Album_songs_Song_name_NN NOT NULL,
Record_label        VARCHAR2(40) CONSTRAINT Album_songs_Record_label_NN NOT NULL,
Album_name          VARCHAR2(40) CONSTRAINT Album_songs_Album_name_NN NOT NULL);

CREATE TABLE Performed_by(
Song_name           VARCHAR2(60) CONSTRAINT Performed_by_Song_name_NN NOT NULL,
Artist_name         VARCHAR2(50) CONSTRAINT Performed_by_Artist_name_NN NOT NULL);

CREATE TABLE Artist_creates(
Artist_name         VARCHAR2(50) CONSTRAINT Artist_creates_Artist_name_NN NOT NULL,
Record_label        VARCHAR2(40) CONSTRAINT Artist_creates_Record_label_NN NOT NULL,
Album_name          VARCHAR2(40) CONSTRAINT Artist_creates_Album_name_NN NOT NULL,
Age                 NUMBER(3));



ALTER TABLE Concert_Tickets
ADD CONSTRAINT Concert_Tickets_Offered_by_FK FOREIGN KEY (Offered_by)
REFERENCES Artists(Artist_name);

ALTER TABLE Podcast_eps
ADD CONSTRAINT Podcast_eps_Podcast_name_FK FOREIGN KEY (Podcast_name)
REFERENCES Podcast(Podcast_name);

ALTER TABLE Chart_type
ADD CONSTRAINT Chart_type_Chart_title_FK FOREIGN KEY (Chart_title)
REFERENCES Charts(Chart_title);

ALTER TABLE Top_Podcast
ADD CONSTRAINT Top_Podcast_Chart_title_FK FOREIGN KEY (Chart_title)
REFERENCES Charts(Chart_title);

ALTER TABLE Top_Podcast
ADD CONSTRAINT Top_Podcast_Podcast_name_FK FOREIGN KEY (Podcast_name)
REFERENCES Podcast(Podcast_name);

ALTER TABLE Song_charts
ADD CONSTRAINT Song_charts_Chart_title_FK FOREIGN KEY (Chart_title)
REFERENCES Charts(Chart_title);

ALTER TABLE Song_charts
ADD CONSTRAINT Song_charts_Song_name_FK FOREIGN KEY (Song_name)
REFERENCES Songs(Song_name);

ALTER TABLE Album_songs
ADD CONSTRAINT Album_songs_Song_name_FK FOREIGN KEY (Song_name)
REFERENCES Songs(Song_name);

ALTER TABLE Album_songs
ADD CONSTRAINT Album_songs_Record_label_Album_name_FK FOREIGN KEY (Record_label, Album_name)
REFERENCES Albums(Record_label, Album_name);

ALTER TABLE Performed_by
ADD CONSTRAINT Performed_by_Song_name_FK FOREIGN KEY (Song_name)
REFERENCES Songs(Song_name);

ALTER TABLE Performed_by
ADD CONSTRAINT Performed_by_Artist_name_FK FOREIGN KEY (Artist_name)
REFERENCES Artists(Artist_name);

ALTER TABLE Artist_creates
ADD CONSTRAINT Artist_creates_Artist_name_FK FOREIGN KEY (Artist_name)
REFERENCES Artists(Artist_name);

ALTER TABLE Artist_creates
ADD CONSTRAINT Artist_creates_Record_label_Album_name_FK FOREIGN KEY (Record_label, Album_name)
REFERENCES Albums(Record_label, Album_name);

ALTER TABLE Performed_by
DISABLE CONSTRAINT Performed_by_Artist_name_FK;

ALTER TABLE Performed_by
DISABLE CONSTRAINT Performed_by_Song_name_FK;

ALTER TABLE Artist_creates
DISABLE CONSTRAINT Artist_creates_Record_label_Album_name_FK;

ALTER TABLE Artist_creates
DISABLE CONSTRAINT Artist_creates_Artist_name_FK;

ALTER TABLE Album_songs
DISABLE CONSTRAINT Album_songs_Song_name_FK;

ALTER TABLE Album_songs
DISABLE CONSTRAINT Album_songs_Record_label_Album_name_FK;