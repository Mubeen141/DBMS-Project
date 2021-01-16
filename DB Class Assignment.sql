create table Properties
(
PropID int Primary Key NOT NULL,
PropAddress Varchar(50),
PropCity Varchar(50),
ProState Varchar(50),
PropZip int,
ScID int
);

insert into Properties(PropID, PropAddress, PropCity, ProState, PropZip, ScID) Values(1, 'Section 2', 'Atlanta', 'North', 1000, 50);
insert into Properties(PropID, PropAddress, PropCity, ProState, PropZip, ScID) Values(2, 'Section 3', 'Kansas', 'East', 2000, 51);
insert into Properties(PropID, PropAddress, PropCity, ProState, PropZip, ScID) Values(3, 'Section 4', 'Washington', 'West', 3000, 52);


create table Schools
(
ScID int Primary Key NOT NULL,
ScStreet Varchar(50),
ScMuniCode int,
DeedBookno int,
DeedPageno int,
PropID int
);

insert into Schools(ScID, ScStreet, ScMuniCode, DeedBookno, DeedPageno, PropID) Values(50, 'Section 2', 100, 5000, 500, 1);
insert into Schools(ScID, ScStreet, ScMuniCode, DeedBookno, DeedPageno, PropID) Values(51, 'Section 3', 200, 5001, 501, 2);
insert into Schools(ScID, ScStreet, ScMuniCode, DeedBookno, DeedPageno, PropID) Values(52, 'Section 4', 300, 5002, 502, 3);

create table Recordss
(
RecordID int Primary Key NOT NULL,
RecordDate Date,
RecordSaleDate Date,
Price int,
SaleID int,
ScID int
);

insert into Recordss(RecordID, RecordDate, RecordSaleDate, Price, SaleID, ScID) Values(81, '12 Jan 20', '21 Feb 20', '30000', 2001, 50);
insert into Recordss(RecordID, RecordDate, RecordSaleDate, Price, SaleID, ScID) Values(82, '13 Jan 20', '22 Feb 20', '25000', 2002, 51);
insert into Recordss(RecordID, RecordDate, RecordSaleDate, Price, SaleID, ScID) Values(83, '14 Jan 20', '23 Feb 20', '10000', 2003, 52);

Alter Table Properties ADD Foreign Key(ScID) References Schools(ScID);
Alter Table Recordss ADD Foreign Key(ScID) References Schools(ScID);
Alter Table Schools ADD Foreign Key(PropID) References Properties(PropID);

select * from Recordss;

INSERT INTO Recordss
(RecordID, RecordDate, RecordSaleDate, Price, SaleID, ScID)
Values(84, '16 Jan 20', '26 Feb 20', '15000', 2004, 52);
select * from Recordss;

DELETE FROM Recordss
WHERE RecordID = 84;
select * from Recordss;

UPDATE Recordss
SET RecordDate = '16 Jan 20'
WHERE RecordID = 83;
select * from Recordss;

SELECT * FROM
Properties 
INNER JOIN Schools ON
    ScID = PropID;