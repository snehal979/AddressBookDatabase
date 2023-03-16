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

--Uc5 Delect the contact by name
DELETE FROM AddressBookTable WHERE firstname = 'Snehu';

--Uc 6 retrive person belong to city or state
SELECT * FROM AddressBookTable WHERE city='Nagpur';
SELECT * FROM AddressBookTable WHERE state='Maha';

--Uc7 size of table by city or state
SELECT COUNT(*) FROM AddressBookTable WHERE city LIKE'Nagpur';
SELECT COUNT(*) FROM AddressBookTable WHERE state LIKE'UP';

--UC8 retrieve data sorted alphabetically by city Ascending order for given city
SELECT * FROM AddressBookTable WHERE city='Nagpur' ORDER BY firstname ASC;
--UC8 retrieve data sorted alphabetically by city descending order
SELECT * FROM AddressBookTable WHERE city='Nagpur' ORDER BY firstname DESC;

--UC9 Ability to identify each Address Book with name and Type. 
ALTER TABLE AddressBookTable ADD type VARCHAR(10);  
UPDATE AddressBookTable SET type ='Family' WHERE firstname ='Snehal';
UPDATE AddressBookTable SET type ='Friend' WHERE firstname ='Raju';

UPDATE AddressBookTable SET type ='Profession' WHERE firstname ='Mayur';

UPDATE AddressBookTable SET type ='Other' WHERE firstname ='Lata';

--Uc10 Ability to get number of contact persons
SELECT type,COUNT(type) AS NumberOfContactPersons FROM AddressBookTable GROUP BY type;

--Uc11 Ability to add person to both Friend and Family
INSERT INTO AddressBookTable(firstname,lastnames,address,city,state,zip,phonenumber,email,type)VALUES('Vaibhav','Bansod','Plotno12','Sindewahi','Maha','234523','9877688788','snehal@gmail','Family');
INSERT INTO AddressBookTable(firstname,lastnames,address,city,state,zip,phonenumber,email,type)VALUES('Vaibhav','Bansod','Plotno12','Sindewahi','Maha','234523','9877688788','snehal@gmail','Friend');