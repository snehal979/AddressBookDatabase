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
INSERT INTO AddressBookTable(firstname,lastnames,address,city,state,zip,phonenumber,email,type)VALUES('Vaibhav','Bansod','Plotno12','Sindewahi','Maha','234523','9877688788','snehal@gmail','Friend')

--Uc12 ER Diagram for Address Book Service DB
DROP TABLE AddressBookTable
/*Key attribute – Uniquely Identified the Entity e.g.Id
• Composite attribute – is a combination of other attributes e.g. employee address
• Multivalued attribute – hold multiple values like the phone number
• Derived attribute – value is dynamic and derived from another attribute e.g.
*/
--1.PersonalDatails Table, 
-- 2.AddressType Table, 

--PersonalDetails TABLE
CREATE TABLE PersonDetail(
Id INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(150) NOT NULL,
Gender VARCHAR(10) NOT NULL,
Mobile VARCHAR(10) DEFAULT('1234567890'),
Email VARCHAR(20)
);
------------Data insert----------------
INSERT INTO PersonDetail(Name,Gender,Mobile,Email)VALUES('Snehal','Female','9593573967','SNEHAL@HS');
INSERT INTO PersonDetail(Name,Gender,Mobile,Email)VALUES('Mayur','Male','9593573968','mayu@g');
INSERT INTO PersonDetail(Name,Gender,Mobile,Email)VALUES('Raju','Male','9593553967','raju@gg');
INSERT INTO PersonDetail(Name,Gender,Mobile,Email)VALUES('Lata','Female','8593573967','lata@hh');
INSERT INTO PersonDetail(Name,Gender,Mobile,Email)VALUES('Vaibhav','Male','7593573967','vaibhav@gg');
SELECT * FROM PersonDetail
-------AddressType Table, ------
CREATE TABLE Addresss(
AddressN VARCHAR(50),
City VARCHAR(18) NOT NULL,
State VARCHAR(19) NOT NULL,
Zip VARCHAR(6),
Id INT FOREIGN KEY REFERENCES PersonDetail(Id)
);
INSERT INTO Addresss VALUES('Plot3','Sindewahi','Maha','454661',1);
INSERT INTO Addresss VALUES('Plot4','Nagpur','Maha','454661',2);
INSERT INTO Addresss VALUES('Plot5','Ramdegi','UP','454661',3);
INSERT INTO Addresss VALUES('Plot7','Sindewahi','UP','454661',4);
INSERT INTO Addresss VALUES('Plot3','Mule','Maha','454661',5);

SELECT * FROM PersonDetail
INNER JOIN Addresss ON PersonDetail.Id = Addresss.Id;
