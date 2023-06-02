/*Part 1*/
CREATE TABLE CAR (
VIN CHAR(17) NOT NULL PRIMARY KEY,
Manufacturer CHAR(10) NOT NULL,
Model CHAR(10) NOT NULL,
Style CHAR(6) NOT NULL,
Registration CHAR(3) NOT NULL,
Color CHAR(6) NOT NULL);

INSERT INTO CAR (VIN, Manufacturer, Model, Style, Registration, Color)
VALUES ('1HGBE23JXMN132459', 'Toyota', 'Camry', 'XSE', 'CDN', 'Black');
INSERT INTO CAR (VIN, Manufacturer, Model, Style, Registration, Color)
VALUES ('1G1YE13J8P6243412', 'Ford', 'Escape', 'Hybrid', 'GB', 'Silver');
INSERT INTO CAR (VIN, Manufacturer, Model, Style, Registration, Color)
VALUES ('1HGCM1223MN132459', 'Hyundai', 'Elantra', 'N', 'ROK', 'White');

select * from car;

/*Part 2*/
CREATE TABLE COW1 (
EarTag INT NOT NULL PRIMARY KEY,
CowName CHAR(10) NOT NULL,
CowDOB DATE NOT NULL,
Breed CHAR(10) NOT NULL);

INSERT INTO COW1 (EarTag, CowName, CowDOB, Breed)
VALUES (1, 'Joseph', '01-02-1999', 'Caracu');
INSERT INTO COW1 (EarTag, CowName, CowDOB, Breed)
VALUES (2, 'Tina', '11-22-1982', 'Tuli');
INSERT INTO COW1 (EarTag, CowName, CowDOB, Breed)
VALUES (3, 'Jane', '03-14-1978', 'Wagyu');

select * from cow1;

/*Part 3*/
CREATE TABLE UNIVERSITY (
UniversityID INT NOT NULL PRIMARY KEY,
UniversityName CHAR(40) NOT NULL,
UniversityCity CHAR(10) NOT NULL,
UniversityMascot CHAR(20) NOT NULL);

CREATE TABLE STUDENT (
SSN CHAR(11) NOT NULL PRIMARY KEY,
StudentFullName CHAR(20) NOT NULL,
StudentStreetAd CHAR(20) NOT NULL,
StudentCity CHAR(20) NOT NULL,
StudentState CHAR(2) NOT NULL,
StudentZip CHAR(5) NOT NULL,
UniversityID INT NOT NULL,
CONSTRAINT fk_university_student FOREIGN KEY (UniversityID) REFERENCES UNIVERSITY (UniversityID));

INSERT INTO UNIVERSITY (UniversityID, UniversityName, UniversityCity, UniversityMascot)
VALUES (1, 'Duke University', 'Durham', 'Blue Devil');
INSERT INTO UNIVERSITY (UniversityID, UniversityName, UniversityCity, UniversityMascot)
VALUES (2, 'Rice University', 'Houston', 'Sammy the Owl');
INSERT INTO UNIVERSITY (UniversityID, UniversityName, UniversityCity, UniversityMascot)
VALUES (3, 'New York University', 'New York', 'Bobcat');

INSERT INTO STUDENT (SSN, StudentFullName, StudentStreetAd, StudentCity,
StudentState, StudentZip, UniversityID)
VALUES ('214-12-3212', 'Jeff Hill', '2200 NE Westwood DR', 'Pullman', 'WA',
'99163', 2);
INSERT INTO STUDENT (SSN, StudentFullName, StudentStreetAd, StudentCity,
StudentState, StudentZip, UniversityID)
VALUES ('113-42-1348', 'Jimmy Hilton', '3000 184th St', 'Lynnwood', 'WA',
'98037', 1);
INSERT INTO STUDENT (SSN, StudentFullName, StudentStreetAd, StudentCity,
StudentState, StudentZip, UniversityID)
VALUES ('134-23-4882', 'Elsa Kim', '2195 Broadway', 'Walnut Creek', 'CA',
'94596', 3);

select * from university;
select * from student;
