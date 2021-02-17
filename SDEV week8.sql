/**
 * Developer: Richard Brown
 * Date: 15 Dec 2019
 * SDEV 300 7980 - SQL script for Lab5
**/

/** Customer table creation **/
CREATE TABLE Customers
(
CustomerID                      INTEGER   not null,
CustomerLastName                VARCHAR2  (40),
CustomerFirstName               VARCHAR2  (40),
CustomerEmail                   VARCHAR2  (80),
CustomerPhone                   NUMBER    (12),
CustomerCellPhone               NUMBER    (12),
PRIMARY KEY (CustomerID)
);

/** Projections2020 table creation **/
CREATE TABLE Projections2020
(
CustomerID                      INTEGER   not null,
QuarterlyPurchaseAmount         NUMBER    (10,2),
QuarterlyProfiAmount            NUMBER    (10,2),
Confidence                      NUMBER    (4,2),
CONSTRAINT Projections2020_FK1 FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID)
);

/** Sales2019 table creation **/
CREATE TABLE Sales2019
(
CustomerID                      INTEGER   not null,
TransactionDate                 Date      not null,
SalesAmount                     NUMBER    (10,2),
ProfitAmount                    NUMBER    (10,2),
CONSTRAINT Sales2019_FK1 FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID)
);
/**
 *  create ROLE with parameters set
**/
CREATE ROLE Lab5_RoleRichardBrown NOT IDENTIFIED;
/** 
 *  The following are GRANT statements for the Lab5_RoleRichardBrown.  Each section
 *	is specific to a table
**/
GRANT CREATE SESSION to Lab5_RoleRichardBrown;

GRANT INSERT ON Admin.Projections2020 to Lab5_RoleRichardBrown;
GRANT SELECT ON Admin.Projections2020 to Lab5_RoleRichardBrown;
GRANT UPDATE ON Admin.Projections2020 to Lab5_RoleRichardBrown;
GRANT DELETE ON Admin.Projections2020 to Lab5_RoleRichardBrown;

GRANT INSERT ON Admin.Sales2019 to Lab5_RoleRichardBrown;
GRANT SELECT ON Admin.Sales2019 to Lab5_RoleRichardBrown;
GRANT UPDATE ON Admin.Sales2019 to Lab5_RoleRichardBrown;
GRANT DELETE ON Admin.Sales2019 to Lab5_RoleRichardBrown;

GRANT INSERT ON Admin.Customers to Lab5_RoleRichardBrown;
GRANT SELECT ON Admin.Customers to Lab5_RoleRichardBrown;
GRANT UPDATE ON Admin.Customers to Lab5_RoleRichardBrown;
GRANT DELETE ON Admin.Customers to Lab5_RoleRichardBrown;
/**
 * user creation with unique password and roll granted
**/
CREATE USER Lab5_1RichardBrown IDENTIFIED BY "QWErtQWErt123!@#"  
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
ACCOUNT unlock;
GRANT Lab5_RoleRichardBrown TO Lab5_1RichardBrown;
/**
 * user creation with unique password and roll granted
**/
CREATE USER Lab5_2RichardBrown IDENTIFIED BY "QWErtQWErt234@#$"  
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
ACCOUNT unlock;
GRANT Lab5_RoleRichardBrown TO Lab5_2RichardBrown;
/**
 * user creation with unique password and roll granted
**/
CREATE USER Lab5_3RichardBrown IDENTIFIED BY "QWErtQWErt345#$%"  
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
ACCOUNT unlock;
GRANT Lab5_RoleRichardBrown TO Lab5_3RichardBrown;
/**
 *  INSERT data into Customers table
**/
INSERT INTO Customers (CustomerID , CustomerLastName , CustomerFirstName , CustomerEmail , CustomerPhone , CustomerCellPhone)
        VALUES (69 , 'Berard' , 'Erin' , 'EBerard69@email.com' , 4015559876 , 4104284076);
        
INSERT INTO Customers (CustomerID , CustomerLastName , CustomerFirstName , CustomerEmail , CustomerPhone , CustomerCellPhone)
        VALUES (420 , 'Jones' , 'Heather' , 'HJones420@email.com' , 9872341222 , 9874938845);
        
INSERT INTO Customers (CustomerID , CustomerLastName , CustomerFirstName , CustomerEmail , CustomerPhone , CustomerCellPhone)
        VALUES (99 , 'Smith' , 'Michael' ,'MSmith99@email.com' , 5623598745 , 2456985623);
/**
 * INSERT data into Projections2020 table
**/
INSERT INTO Projections2020 (CustomerID , QuarterlyPurchaseAmount , QuarterlyProfiAmount , Confidence) 
        VALUES (69 , 1620.00 , 12.25 , 0.95);

INSERT INTO Projections2020 (CustomerID , QuarterlyPurchaseAmount , QuarterlyProfiAmount , Confidence) 
        VALUES (420 , 1234.56 , 23.15 , 0.75);
        
INSERT INTO Projections2020 (CustomerID , QuarterlyPurchaseAmount , QuarterlyProfiAmount , Confidence) 
        VALUES (99 , 23500.00 , 321.00 , 0.99);
/**
 * INSERT data into Sales2019 table
**/
INSERT INTO Sales2019 (CustomerID , TransactionDate , SalesAmount , ProfitAmount)
        VALUES (69 , '2019-12-12' , 4200.00 , 1234.00);

INSERT INTO Sales2019 (CustomerID , TransactionDate , SalesAmount , ProfitAmount)
        VALUES (420 , '2019-12-10' , 562.56 , 34.44);

INSERT INTO Sales2019 (CustomerID , TransactionDate , SalesAmount , ProfitAmount)
        VALUES (99 , '2019-11-29' , 103265.00 , 25645.00);
        
			/*******  	THIS BEGINS THE AUDITING SECTION		*******/
			
SHOW PARAMETER AUDIT_TRAIL;
/**
 * Audit statements for tables (Customers , Projections2020 , Sales2019)
**/
AUDIT INSERT , SELECT , UPDATE , DELETE ON Customers;
AUDIT INSERT , SELECT , UPDATE , DELETE ON Projections2020;
AUDIT INSERT , SELECT , UPDATE , DELETE ON Sales2019;
/**
 * using Lab5_1RichardBrown to insert, delete, and select from several different tables.
 * The SELECT statement was used more time than show since SQL is a script language, re-running
 * the same line of script achieved the same function as typing same statement each time used.  
**/
INSERT INTO Admin.projections2020 (customerID , quarterlypurchaseamount , quarterlyprofiamount , confidence) 
        VALUES (111111 , 76.3 , 12.2 , 0.25);
        
INSERT INTO Admin.projections2020 (customerID , quarterlypurchaseamount , quarterlyprofiamount , confidence) 
        VALUES (1 , 19384.34 , 2234.32 , 0.81);
        
INSERT INTO Admin.sales2019 (customerID , transactiondate , salesamount , profitamount)
        VALUES (111111 , TO_DATE('2019-12-15 18:51:38', 'YYYY-MM-DD HH24:MI:SS'), 23.44 , 12.2);
        
INSERT INTO Admin.sales2019 (customerID , transactiondate , salesamount , profitamount)
        VALUES (1 , TO_DATE('2019-12-01 18:51:38', 'YYYY-MM-DD HH24:MI:SS') , 292.44 , 1.2);

DELETE FROM Admin.projections2020 WHERE customerid = 69;

DELETE FROM Admin.projections2020 WHERE customerid = 99;

SELECT * FROM Admin.projections2020;

SELECT * FROM Admin.customers;

SELECT * FROM Admin.sales2019;

DELETE FROM Admin.sales2019 WHERE customerID = 1000;

DELETE FROM Admin.customers WHERE customerID = 99;
/**
 * using Lab5_2RichardBrown to insert, delete, and select from several different tables
 * The SELECT statement was used more time than show since SQL is a script language, re-running
 * the same line of script achieved the same function as typing same statement each time used.  
**/
INSERT INTO Admin.customers (customerID , customerlastname , customerfirstname, customeremail , customerphone , customercellphone)
        VALUES (1000 , 'YOU' , 'HEY' , 'heyyou@email.com' , 1234567899 , 9876543211); 

INSERT INTO Admin.customers (customerID , customerlastname , customerfirstname, customeremail , customerphone , customercellphone)
        VALUES (2000 , 'ANDYOU' , 'ME' , 'meandyou@email.com' , 5435436543 , 5675672345); 

DELETE FROM Admin.customers WHERE customerid = 18;

INSERT INTO Admin.customers (customerID , customerlastname , customerfirstname, customeremail , customerphone , customercellphone)
        VALUES (001 , 'potatohead' , 'mr' , 'mrpotatohead@email.com' , 6542451498 , 1476542389); 

INSERT INTO Admin.customers (customerID , customerlastname , customerfirstname, customeremail , customerphone , customercellphone)
        VALUES (111111 , 'asdf' , 'asdf' , 'asdfasdf@email.com' , 5435436543 , 5675672345); 
        
DELETE FROM Admin.customers WHERE customerid = 12;

SELECT * FROM Admin.customers;

INSERT INTO Admin.projections2020 (customerID , quarterlypurchaseamount , quarterlyprofiamount , confidence) 
        VALUES (1000 , 1234.56 , 543.23 , 0.75);
        
INSERT INTO Admin.projections2020 (customerID , quarterlypurchaseamount , quarterlyprofiamount , confidence) 
        VALUES (2000 , 12452.56 , 12222.23 , 0.99);

SELECT * FROM Admin.projections2020;
/**
 * using Lab5_3RichardBrown to insert, delete, and select from several different tables
 * The SELECT statement was used more time than show since SQL is a script language, re-running
 * the same line of script achieved the same function as typing same statement each time used.  
**/
INSERT INTO Admin.projections2020 (customerID , quarterlypurchaseamount , quarterlyprofiamount , confidence) 
        VALUES (0034 , 321.23 , 223.43 , 0.00);
        
INSERT INTO Admin.projections2020 (customerID , quarterlypurchaseamount , quarterlyprofiamount , confidence) 
        VALUES (0035 , 34234.56 , 3456.30 , 0.86);
        
INSERT INTO Admin.projections2020 (customerID , quarterlypurchaseamount , quarterlyprofiamount , confidence) 
        VALUES (0036 , 123323.43 , 534.32 , 0.10);

INSERT INTO Customers (CustomerID , CustomerLastName , CustomerFirstName , CustomerEmail , CustomerPhone , CustomerCellPhone)
        VALUES (99 , 'Smith' , 'Michael' ,'MSmith99@email.com' , 5623598745 , 2456985623);

INSERT INTO Sales2019 (CustomerID , TransactionDate , SalesAmount , ProfitAmount)
        VALUES (99 , '2019-11-29' , 103265.00 , 25645.00);

INSERT INTO Admin.sales2019 (customerID , transactiondate , salesamount , profitamount)
        VALUES (99 , TO_DATE('2019-12-01 18:51:38', 'YYYY-MM-DD HH24:MI:SS') , 29322.34 , 12.29);

SELECT * FROM Admin.customers;

SELECT * FROM Admin.projections2020;

SELECT * FROM Admin.sales2019;

DELETE FROM Admin.sales2019 WHERE customerID = 111111;

DELETE FROM Admin.sales2019 WHERE customerID = 69;

/**
 *  THE FOLLOWING STATEMENT WAS SCRIPTED ONCE BUT EXECUTED MANY TIMES TO TRACK
 *	AND ANALYZE THE AUDIT DATA
**/
SELECT * FROM dba_audit_trail;
