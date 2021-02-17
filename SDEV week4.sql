CREATE PROFILE PRichardBrown LIMIT
    PASSWORD_VERIFY_FUNCTION ora12c_strong_verify_function
    SESSIONS_PER_USER 3
    FAILED_LOGIN_ATTEMPTS 4
    PASSWORD_LIFE_TIME 120
    PASSWORD_GRACE_TIME 1/24
    ;



/* Create First User */
CREATE USER U1RichardBrown IDENTIFIED BY "QWErtQWErt123@#$"  
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE PRichardBrown
ACCOUNT unlock;

/* Create Second User */
CREATE USER U2RichardBrown IDENTIFIED BY "QWErtQWErt234#$%"  
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
PROFILE PRichardBrown
ACCOUNT unlock;

-- QUOTAS for both users
ALTER USER "U1RICHARDBROWN" QUOTA 30M ON "USERS";
ALTER USER "U2RICHARDBROWN" QUOTA 30M ON "USERS";
-- SYSTEM PRIVILEGES for both users
GRANT CREATE SESSION TO "U1RICHARDBROWN" ;
GRANT CREATE SESSION TO "U2RICHARDBROWN" ;
/* ROLE CREATION */
CREATE ROLE Role1RichardBrown NOT IDENTIFIED;
    
GRANT CREATE TABLE to Role1RichardBrown;
GRANT CREATE SESSION to Role1RichardBrown;
-- CREAT first table
CREATE TABLE User1Data
(
FoodID           NUMBER      not null,
FoodType         VARCHAR2    (50),
FoodPrice        NUMBER      not null,
FoodLacation     VARCHAR2    (10),
PRIMARY KEY (FoodID)
);
-- CREATE second table
CREATE TABLE User2Data
(
AutoMID           NUMBER      not null,
AutoMColor        VARCHAR2    (50),
AutoMYear         NUMBER      not null,
AutoMName         VARCHAR2    (100),
PRIMARY KEY (AutoMID)
);

-- insert data into user1data
INSERT INTO User1Data (FoodID , FoodType , FoodPrice , FoodLacation) VALUES (69 , 'Potato' , 0.75 , 'A33');
INSERT INTO User1Data (FoodID , FoodType , FoodPrice , FoodLacation) VALUES (420 , 'Cookie' , 4.20 , 'W12');
INSERT INTO User1Data (FoodID , FoodType , FoodPrice , FoodLacation) VALUES (12 , 'Salmon' , 12.50 , 'S45');
-- insert data into user2data  
INSERT INTO User2Data (AutoMID , AutoMColor , AutoMYear , AutoMName) VALUES (1000 , 'Jet Black' , 1969 , 'Dodge Charger');
INSERT INTO User2Data (AutoMID , AutoMColor , AutoMYear , AutoMName) VALUES (345 , 'Baby Blue' , 1971 , 'Ford Mach 1');
INSERT INTO User2Data (AutoMID , AutoMColor , AutoMYear , AutoMName) VALUES (1001 , 'Gray Qartz' , 2019 , 'Toyota Prius');
-- grant specific role to users
GRANT Role1RichardBrown to U1RICHARDBROWN;
GRANT Role1RichardBrown to U2RICHARDBROWN;
-- grant specific privileges to select users
GRANT SELECT , INSERT ON User1Data TO U1RICHARDBROWN;
GRANT SELECT ON User1Data TO U2RICHARDBROWN;
GRANT SELECT ON User2Data TO U2RICHARDBROWN;

/*
 *  the following section is from U1RichardBrown user test queries
 */
SELECT * FROM ADMIN.user1data;

INSERT INTO ADMIN.user1data (FoodID , FoodType , FoodPrice , FoodLacation) VALUES (7000 , 'Cucumber' , 4.20 , 'C69');

SELECT * FROM ADMIN.user1data;

/*
 *  the following section is from U2RichardBrown user test queries
 */    
SELECT * FROM ADMIN.user1data;

SELECT * FROM ADMIN.user2data;   
 
    
    
    
    