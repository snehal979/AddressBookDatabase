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

--Uc3 Insert new contact
INSERT INTO AddressBookTable(firstname,lastnames,address,city,state,zip,phonenumber,email)VALUES('Snehu','Bansod','Plotno12','Sindewahi','Maha','234523','9877688788','snehal@gmail'),
('Mayur','Ramtake','Plot no 3','Nagpur','Maha','232424','8787667886','mayur@gmail'),('Lata','Bhakare','Plot no7','Chamorshi','UP','546354','9345678912','lata@gmail'),
('Raju','Borkar','Plotno31','Nagpur','MP','232423','8787567486','raju@gmail'),('Latatai','Bhange','Plotno73','Chamorshi','UP','546351','8345678912','latatai@gmail');

--Display
SELECT * FROM AddressBookTable

--Uc 4 Edit the contact by name
UPDATE AddressBookTable SET state = 'Maharastra' WHERE firstname ='Snehal';