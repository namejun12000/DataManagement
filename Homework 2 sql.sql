/*Part a*/
DROP TABLE STUDENT;
DROP TABLE CLASS;
DROP TABLE INSTRUCTOR;
DROP TABLE ENROLLMENT;

CREATE TABLE STUDENT (
StudentID INT NOT NULL PRIMARY KEY,
StudentFirst VARCHAR(20) NOT NULL,
StudentLast VARCHAR(20) NOT NULL,
StudentGender VARCHAR(6) NOT NULL,
StudnetDOB DATE NOT NULL);

CREATE TABLE INSTRUCTOR (
InstructorID INT NOT NULL PRIMARY KEY,
InstructorFirst VARCHAR(20) NOT NULL,
InstructorLast VARCHAR(20) NOT NULL,
InstructorEmail CHAR(20) NOT NULL);

CREATE TABLE CLASS (
ClassID INT NOT NULL,
Title CHAR(20) NOT NULL,
InstructorID INT NOT NULL,
CONSTRAINT pk_class PRIMARY KEY (ClassID),
CONSTRAINT fk_instructor_class FOREIGN KEY (InstructorID)
	REFERENCES INSTRUCTOR (InstructorID));

CREATE TABLE ENROLLMENT (
EnrollmentID INT NOT NULL,
StudentID INT NOT NULL,
ClassID INT NOT NULL,
Semester VARCHAR(20) NOT NULL,
Year CHAR(4) NOT NULL,
CONSTRAINT pk_enrollment PRIMARY KEY (EnrollmentID),
CONSTRAINT fk_student_enrollment FOREIGN KEY (StudentID)
	REFERENCES STUDENT (StudentID),
CONSTRAINT fk_class_enrollment FOREIGN KEY (ClassID)
	REFERENCES CLASS (ClassID));

INSERT INTO STUDENT (StudentID, StudentFirst, StudentLast, StudentGender, StudnetDOB)
VALUES (1, 'Chris', 'Young', 'Male', '03-14-1996');
INSERT INTO STUDENT (StudentID, StudentFirst, StudentLast, StudentGender, StudnetDOB)
VALUES (2, 'Rouis', 'Jane', 'Female', '01-11-1998');
INSERT INTO STUDENT (StudentID, StudentFirst, StudentLast, StudentGender, StudnetDOB)
VALUES (3, 'Olive', 'James', 'Male', '06-25-1993');

INSERT INTO INSTRUCTOR (InstructorID, InstructorFirst, InstructorLast, InstructorEmail)
VALUES (1, 'Chark', 'Lee', 'char12@gmail.com');
INSERT INTO INSTRUCTOR (InstructorID, InstructorFirst, InstructorLast, InstructorEmail)
VALUES (2, 'Jayo', 'Christina', 'jayo5672@gmail.com');
INSERT INTO INSTRUCTOR (InstructorID, InstructorFirst, InstructorLast, InstructorEmail)
VALUES (3, 'Steven', 'John', 'manner33@gmail.com');

INSERT INTO CLASS (ClassID, Title, InstructorID)
VALUES (1, 'ECON 201', 2);
INSERT INTO CLASS (ClassID, Title, InstructorID)
VALUES (2, 'MATH 435', 3);
INSERT INTO CLASS (ClassID, Title, InstructorID)
VALUES (3, 'ENGLISH 401', 1);

INSERT INTO ENROLLMENT (EnrollmentID, StudentID, ClassID, Semester, Year)
VALUES (1, 1, 1, 'Spring', '2016');
INSERT INTO ENROLLMENT (EnrollmentID, StudentID, ClassID, Semester, Year)
VALUES (2, 2, 3, 'Fall', '2018');
INSERT INTO ENROLLMENT (EnrollmentID, StudentID, ClassID, Semester, Year)
VALUES (3, 3, 2, 'Spring', '2019');
INSERT INTO ENROLLMENT (EnrollmentID, StudentID, ClassID, Semester, Year)
VALUES (4, 1, 1, 'Spring', '2019');

select * from STUDENT;
select * from INSTRUCTOR;
select * from CLASS;
select * from ENROLLMENT;

/*Part b*/
DROP TABLE PRESIDENT;
DROP TABLE PARTY;
DROP TABLE PRESIDENT_PARTY;
DROP TABLE TERM;

CREATE TABLE PRESIDENT (
PresidentID INT NOT NULL PRIMARY KEY,
PresidentFirst VARCHAR(20) NOT NULL,
PresidentLast VARCHAR(20) NOT NULL,
PresidentCity VARCHAR(20) NOT NULL,
PresidentState VARCHAR(20) NOT NULL,
PresidentGender VARCHAR(6) NOT NULL,
PresidentDOB DATE NOT NULL);

CREATE TABLE PARTY (
PartyID INT NOT NULL PRIMARY KEY,
PartyName VARCHAR(15) NOT NULL);

CREATE TABLE PRESIDENT_PARTY (
PartyID INT NOT NULL,
PresidentID INT NOT NULL,
PartyChange VARCHAR(40) NOT NULL,
CONSTRAINT pk_party PRIMARY KEY (PartyID, PresidentID),
CONSTRAINT fk_party_each_president FOREIGN KEY (PartyID)
	REFERENCES PARTY (PartyID),
CONSTRAINT fk_party_president FOREIGN KEY (PresidentID)
	REFERENCES PRESIDENT (PresidentID));

CREATE TABLE TERM (
TermID INT NOT NULL,
PresidentID INT NOT NULL,
TermStart DATE NOT NULL,
TermEnd DATE NOT NULL,
CONSTRAINT pk_term PRIMARY KEY (TermID),
CONSTRAINT fk_term_president FOREIGN KEY (PresidentID)
	REFERENCES PRESIDENT (PresidentID));

INSERT INTO PRESIDENT (PresidentID, PresidentFirst, PresidentLast, PresidentCity,
PresidentState, PresidentGender, PresidentDOB)
VALUES (1, 'Grover', 'Clevelad', 'Caldwell', 'NJ', 'Male', '03-18-1837');
INSERT INTO PRESIDENT (PresidentID, PresidentFirst, PresidentLast, PresidentCity,
PresidentState, PresidentGender, PresidentDOB)
VALUES (2, 'Benjamin', 'Harrison', 'North Bend', 'OH', 'Male', '08-20-1833');
INSERT INTO PRESIDENT (PresidentID, PresidentFirst, PresidentLast, PresidentCity,
PresidentState, PresidentGender, PresidentDOB)
VALUES (3, 'Calvin', 'Coolidge', 'Plymouth', 'VT', 'Male', '07-04-1872');

INSERT INTO PARTY (PartyID, PartyName)
VALUES (1, 'Republican');
INSERT INTO PARTY (PartyID, PartyName)
VALUES (2, 'Democratic');
INSERT INTO PARTY (PartyID, PartyName)
VALUES (3, 'Whig');

INSERT INTO PRESIDENT_PARTY (PartyID, PresidentID, PartyChange)
VALUES (2, 1, 'Democrat his entire career'); 
INSERT INTO PRESIDENT_PARTY (PartyID, PresidentID, PartyChange)
VALUES (1, 2, 'Whig until 01-01-1856'); 
INSERT INTO PRESIDENT_PARTY (PartyID, PresidentID, PartyChange)
VALUES (1, 3, 'Repulic his entire career'); 

INSERT INTO TERM (TermID, PresidentID, TermStart, TermEnd)
VALUES (22, 1, '03-04-1885', '03-04-1889');
INSERT INTO TERM (TermID, PresidentID, TermStart, TermEnd)
VALUES (23, 2, '03-04-1889', '03-04-1893');
INSERT INTO TERM (TermID, PresidentID, TermStart, TermEnd)
VALUES (30, 3, '08-02-1923', '03-04-1929');

select * from PRESIDENT;
select * from PARTY;
select * from PRESIDENT_PARTY;
select * from TERM;