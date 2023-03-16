--Uc1 Create database
Create database AddressBookServiceDatabase

--UC2 create table
CREATE TABLE AddressBookTable(
firstname VARCHAR(20) NOT NULL,
lastnames VARCHAR(20)NOT NULL,
address VARCHAR(50),
city VARCHAR(15)NOT NULL,
state VARCHAR(15)NOT NULL,
zip VARCHAR(6),
phonenumber VARCHAR(10),
email VARCHAR(20)NOT NULL
);