                -- step one, drop tables that don't yet exist


DROP TABLE ClassEnrollment;
DROP TABLE Classes;
DROP TABLE Engineers;
DROP TABLE Faculty;

                -- step two, creating tables

/* Create Engineer Table */
CREATE TABLE Engineers
(
EID             NUMBER      not null,
Lastname        VARCHAR2    (50),
Firstname       VARCHAR2    (50),
Email           VARCHAR2    (100),
Graddate        NUMBER,
PRIMARY KEY (EID)
);
/* Create Faculty Table */
CREATE TABLE Faculty
(
FID             NUMBER      not null,
Lastname        VARCHAR2    (50),
Firstname       VARCHAR2    (50),
Email           VARCHAR2    (100),
Hiredate        NUMBER,
PRIMARY KEY (FID)
);
/* Create Classes Table */
CREATE TABLE Classes
(
CID             NUMBER      not null,
Subject         VARCHAR2    (50),
Catalognbr      NUMBER,
Title           VARCHAR2    (100),
PRIMARY KEY (CID)
);
/* Create ClassEnrollment Table */
CREATE TABLE ClassEnrollment
(
EnID            NUMBER      not null,
EID_fk          NUMBER      REFERENCES  Engineers(EID),
FID_fk          NUMBER      REFERENCES  Faculty(FID),
CID_fk          NUMBER      REFERENCES  Classes(CID),
PRIMARY KEY (EnID)
);

                -- step three adding data
                
/* INSERT ALL data into tables */

INSERT ALL
    /* insert Engineers data into Engineers table */
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Br', 'Fun', 'FB@student.umuc.edu ', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Gr', 'Sat', 'SG@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Hn', 'Boy', 'BH@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Bg', 'Yep', 'YB@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Fd', 'Tap', 'TF@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Gr', 'Get', 'GG@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Te', 'Sum', 'ST@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Yo', 'Put', 'PY@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Pd', 'Fly', 'FP@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Sd', 'Dog', 'DS@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Sq', 'Cat', 'CS@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Tn', 'Fat', 'FT@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Es', 'Hat', 'HE@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Wq', 'Mat', 'MW@student.umuc.edu', 20201215)
    INTO Engineers (Lastname, Firstname, Email, Graddate) VALUES ('Be', 'Bat', 'BB@student.umuc.edu', 20201215)
    /* insert Faculty data into Faculty table */
    INTO Faculty (Lastname, Firstname, Email, Hiredate) VALUES ('Gy', 'Rock', 'RG@faculty.umuc.edu ', 20201215)
    INTO Faculty (Lastname, Firstname, Email, Hiredate) VALUES ('Hk', 'Star', 'SH@faculty.umuc.edu', 20201215)
    INTO Faculty (Lastname, Firstname, Email, Hiredate) VALUES ('Hp', 'Weed', 'WP@faculty.umuc.edu', 20201215)
    /* insert Classes data into Classes table */
    INTO Classes (Subject, Catalognbr, Title) VALUES ('SDEV', '350', 'Database Security')
    INTO Classes (Subject, Catalognbr, Title) VALUES ('CMIS', '242', 'Intermediate Programming in Java')
    INTO Classes (Subject, Catalognbr, Title) VALUES ('CSIA', '300', 'Cybersecurity for leaders and managers')
    /* insert ClassEnrollment data into ClassEnrollment table */
    INTO ClassEnrollment (EnID) VALUES (1)
    INTO ClassEnrollment (EnID) VALUES (2)
    INTO ClassEnrollment (EnID) VALUES (3)
    INTO ClassEnrollment (EnID) VALUES (4)
    INTO ClassEnrollment (EnID) VALUES (5)
    INTO ClassEnrollment (EnID) VALUES (6)
    INTO ClassEnrollment (EnID) VALUES (7)
    INTO ClassEnrollment (EnID) VALUES (8)
    INTO ClassEnrollment (EnID) VALUES (9)
    INTO ClassEnrollment (EnID) VALUES (10)
    INTO ClassEnrollment (EnID) VALUES (11)
    INTO ClassEnrollment (EnID) VALUES (12)
    INTO ClassEnrollment (EnID) VALUES (13)
    INTO ClassEnrollment (EnID) VALUES (14)
    INTO ClassEnrollment (EnID) VALUES (15)
SELECT * FROM dual;    
    
                -- step four, ordering tables by descending PK
                
/* Select each table and order by descending order of primary keys */
SELECT * FROM ClassEnrollment ORDER BY EnID DESC;
SELECT * FROM Classes ORDER BY CID DESC;
SELECT * FROM Engineers ORDER BY EID DESC;
SELECT * FROM Faculty ORDER BY FID DESC;

                -- step five, update selected columns
                
/* update Faculty */
UPDATE Faculty SET Lastname = 'Friendship' WHERE FID = 2;
/* update Engineer */
UPDATE Engineers SET Firstname = 'Amadeus' WHERE EID = 10;
/* update Classes */
UPDATE Classes SET Subject = 'IoT Cyber' WHERE CID = 1;
/* CHECK UPDATES WITH SELECTION STATEMENTS */
SELECT Lastname FROM Faculty WHERE FID = 2;
SELECT Firstname FROM Engineers WHERE EID = 10;
SELECT Subject FROM Classes WHERE CID = 1;

                -- step six, delete lowest value from ClassEnrollments
/* delete lowest EnID */
DELETE ClassEnrollment WHERE EnID = 1;
/* verify lowest EnID was deleted */
SELECT * FROM ClassEnrollment ORDER BY EnID ASC;

                -- step seven, create a view of tables column data
/* Create views for selected data */
CREATE VIEW Eng_List AS SELECT Lastname, Firstname FROM Engineers;
CREATE VIEW Fac_List AS SELECT Lastname, Email FROM Faculty;
CREATE VIEW Cla_List AS SELECT Subject, Title FROM Classes;
/* verify view creation */
SELECT * FROM Eng_List;
SELECT * FROM Fac_List;
SELECT * FROM Cla_List;



