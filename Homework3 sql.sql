/*part a*/
DROP TABLE PUBLISHER;
DROP TABLE BOOK;
DROP TABLE AUTHOR_BOOK;
DROP TABLE AUTHOR;

CREATE TABLE PUBLISHER (
PublisherID INT NOT NULL,
PublisherName VARCHAR(40) NOT NULL,
CONSTRAINT pk_publisher PRIMARY KEY (PublisherID));

CREATE TABLE AUTHOR (
AuthorID INT NOT NULL,
AuthorFirst VARCHAR(20) NOT NULL,
AuthorLast VARCHAR(20) NOT NULL,
CONSTRAINT pk_author PRIMARY KEY (AuthorID));

CREATE TABLE BOOK (
BookID INT NOT NULL,
BookTitle CHAR(40) NOT NULL,
ISBN CHAR(13) NOT NULL,
PublishedDate DATE NOT NULL,
BookGenre VARCHAR(30) NOT NULL,
BookPageNum INT NOT NULL,
PublisherID INT NOT NULL,
CONSTRAINT pk_book PRIMARY KEY (BookID),
CONSTRAINT fk_book_publisher FOREIGN KEY (PublisherID)
	REFERENCES PUBLISHER (PublisherID));

CREATE TABLE AUTHOR_BOOK (
BookID INT NOT NULL,
AuthorID INT NOT NULL,
CONSTRAINT pk_author_book PRIMARY KEY (BookID, AuthorID),
CONSTRAINT fk_book_b FOREIGN KEY (BookID)
	REFERENCES BOOK (BookID),
CONSTRAINT fk_book_a FOREIGN KEY (AuthorID)
	REFERENCES AUTHOR (AuthorID));

INSERT INTO PUBLISHER (PublisherID, PublisherName)
VALUES (1, 'Penguin Random House');
INSERT INTO PUBLISHER (PublisherID, PublisherName)
VALUES (2, 'Macmillan');
INSERT INTO PUBLISHER (PublisherID, PublisherName)
VALUES (3, 'HarperCollins');

INSERT INTO AUTHOR (AuthorID, AuthorFirst, AuthorLast)
VALUES (1, 'Ellison', 'Ralph');
INSERT INTO AUTHOR (AuthorID, AuthorFirst, AuthorLast)
VALUES (2, 'Siegel', 'Matt');
INSERT INTO AUTHOR (AuthorID, AuthorFirst, AuthorLast)
VALUES (3, 'Michaelides', 'Alex');

INSERT INTO BOOK (BookID, BookTitle, ISBN, PublishedDate, BookGenre, BookPageNum, PublisherID)
VALUES (1, 'Invisible Man','9780699601395', '04/14/1952', 'Bildungsroman', 581, 1);
INSERT INTO BOOK (BookID, BookTitle, ISBN, PublishedDate, BookGenre, BookPageNum, PublisherID)
VALUES (2, 'The Secret History of Food', '9780062973214', '08/31/2021', 'Cookbook', 288, 3);
INSERT INTO BOOK (BookID, BookTitle, ISBN, PublishedDate, BookGenre, BookPageNum, PublisherID)
VALUES (3, 'The Maidens', '9781250304452', '06/15/2021', 'Psychological Thriller', 352, 2);

INSERT INTO AUTHOR_BOOK (BookID, AuthorID)
VALUES (1, 1);
INSERT INTO AUTHOR_BOOK (BookID, AuthorID)
VALUES (2, 2);
INSERT INTO AUTHOR_BOOK (BookID, AuthorID)
VALUES (3, 3);

select * from PUBLISHER;
select * from AUTHOR;
select * from BOOK;
select * from AUTHOR_BOOK;

/*part b*/
DROP TABLE PROFESSOR;
DROP TABLE SUBJECT;
DROP TABLE COURSE;
DROP TABLE OFFERING;

CREATE TABLE PROFESSOR (
ProfessorID INT NOT NULL PRIMARY KEY,
ProfessorFirst VARCHAR(20) NOT NULL,
ProfessorLast VARCHAR(20) NOT NULL,
ProfessorEmail CHAR(40) NOT NULL,
ProfessorBuildingName VARCHAR(20) NOT NULL,
ProfessorBuildingFloor VARCHAR(10) NOT NULL,
ProfessorRoomNum INT NOT NULL);


CREATE TABLE SUBJECT (
SubjectID INT NOT NULL,
SubjectName VARCHAR(20) NOT NULL,
ProfessorID INT NOT NULL,
CONSTRAINT pk_subject PRIMARY KEY (SubjectID),
CONSTRAINT fk_professor_subject FOREIGN KEY (ProfessorID)
	REFERENCES PROFESSOR (ProfessorID));

CREATE TABLE COURSE (
CourseID INT NOT NULL,
CourseName CHAR(20) NOT NULL,
SubjectID INT NOT NULL,
CONSTRAINT pk_course PRIMARY KEY (CourseID),
CONSTRAINT fk_subject_course FOREIGN KEY (SubjectID)
	REFERENCES SUBJECT (SubjectID));

CREATE TABLE OFFERING (
CourseID INT NOT NULL,
ProfessorID INT NOT NULL,
Year CHAR(4) NOT NULL,
Semester VARCHAR(6) NOT NULL,
MeetingBuilding VARCHAR(20) NOT NULL,
MeetingRoomNum INT NOT NULL,
MeetingTime CHAR(40) NOT NULL,
MeetingDay VARCHAR(6) NOT NULL,
CONSTRAINT pk_offering PRIMARY KEY (CourseID, ProfessorID),
CONSTRAINT fk_course_offering FOREIGN KEY (CourseID)
	REFERENCES COURSE (CourseID),
CONSTRAINT fk_professor_offering FOREIGN KEY (ProfessorID)
	REFERENCES PROFESSOR (ProfessorID));

INSERT INTO PROFESSOR (ProfessorID, ProfessorFirst, ProfessorLast, ProfessorEmail,
ProfessorBuildingName, ProfessorBuildingFloor, ProfessorRoomNum)
VALUES (1, 'Crown', 'Jay', 'jay12@gmail.com', 'Elison Hall', 'Third', '305');
INSERT INTO PROFESSOR (ProfessorID, ProfessorFirst, ProfessorLast, ProfessorEmail,
ProfessorBuildingName, ProfessorBuildingFloor, ProfessorRoomNum)
VALUES (2, 'Alina', 'Chris', 'ca5567@gmail.com', 'Glison Hall', 'Second', '201');
INSERT INTO PROFESSOR (ProfessorID, ProfessorFirst, ProfessorLast, ProfessorEmail,
ProfessorBuildingName, ProfessorBuildingFloor, ProfessorRoomNum)
VALUES (3, 'Kaylynn', 'Joseph', 'kay99@gmail.com', 'Norill Hall', 'Fifth', '505');

INSERT INTO SUBJECT (SubjectID, SubjectName, ProfessorID)
VALUES (1, 'Accounting', 1);
INSERT INTO SUBJECT (SubjectID, SubjectName, ProfessorID)
VALUES (2, 'Architecture', 2);
INSERT INTO SUBJECT (SubjectID, SubjectName, ProfessorID)
VALUES (3, 'Economics', 3);

INSERT INTO COURSE (CourseID, CourseName, SubjectID)
VALUES (1, 'ACCTG 230', 1);
INSERT INTO COURSE (CourseID, CourseName, SubjectID)
VALUES (2, 'ARCH 220', 2);
INSERT INTO COURSE (CourseID, CourseName, SubjectID)
VALUES (3, 'EconS 302', 3);
INSERT INTO COURSE (CourseID, CourseName, SubjectID)
VALUES (4, 'EconS 497', 3);
INSERT INTO COURSE (CourseID, CourseName, SubjectID)
VALUES (5, 'ARCH 105', 2);


INSERT INTO OFFERING (CourseID, ProfessorID, Year, Semester, MeetingBuilding, MeetingRoomNum, MeetingTime, MeetingDay)
VALUES (1, 1, '2015', 'Spring', 'Crimal Hall', 104, '09:00 ~ 10:00', 'TuTh');
INSERT INTO OFFERING (CourseID, ProfessorID, Year, Semester, MeetingBuilding, MeetingRoomNum, MeetingTime, MeetingDay)
VALUES (2, 2, '2016', 'Fall', 'Hollan Hall', 303, '10:00 ~ 11:00', 'TuTh');
INSERT INTO OFFERING (CourseID, ProfessorID, Year, Semester, MeetingBuilding, MeetingRoomNum, MeetingTime, MeetingDay)
VALUES (3, 3, '2018', 'Spring', 'Nail Hall', 401, '13:00 ~ 14:30', 'MoWeFr');
INSERT INTO OFFERING (CourseID, ProfessorID, Year, Semester, MeetingBuilding, MeetingRoomNum, MeetingTime, MeetingDay)
VALUES (4, 3, '2018', 'Spring', 'Nail Hall', 507, '18:00 ~ 19:00', 'TuTh');
INSERT INTO OFFERING (CourseID, ProfessorID, Year, Semester, MeetingBuilding, MeetingRoomNum, MeetingTime, MeetingDay)
VALUES (5, 2, '2016', 'Fall', 'Hollan Hall', 103, '15:00 ~ 16:00', 'MoWeFr');

select * from PROFESSOR;
select * from SUBJECT;
select * from COURSE;
select * from OFFERING;