create database LawFirmDB;
use LawFirmDB;

create table Clients (
Client_ID varchar(10) primary key,
Name varchar(50),
Contact varchar(50),
Address varchar(20)
);
insert into Clients
VALUES
('C001', 'Alice Johnson', 'alice.j@gmail.com', '123 Main St'),
('C002', 'Brian Smith', 'brian.s@gmail.com', '246 Oak Ave'),
('C003', 'Clara Davis', 'clara.d@gmail.com', '789 Pine Rd'),
('C004', 'James William Lagen', 'james.l@gmail.com', '120 Masaki lGE');
select * from Clients;


create table Cases (
Case_Type char(50),
Status char(10),
Start_Date date,
Client_ID varchar(10) references Clients(Client_ID),
LawyerID varchar(10) references lawyers(LawyerID)
);
insert into Cases
VALUES
('Fraud Investigation', 'OPEN', '2026-01-15', 'C001', 'L001'),
('Contract Dispute', 'CLOSED', '2026-02-10', 'C002', 'L03'),
('Divorce Settlement', 'OPEN', '2026-03-05', 'C003', 'L02'),
('Civil Litigation', 'OPEN', '2026-10-27', 'C004', 'L04');
select * from Cases;

create table Lawyers (
LawyerID varchar(10) primary key,
Name varchar(50),
Specilization char(30),
Phone varchar(20)
);
insert into Lawyers
VALUES
('L01', 'David Brown', 'Criminal Law', '555-1234'),
('L02', 'Emma Wilson', 'Family Law', '555-5678'),
('L03', 'Frank Miller', 'Coporate Law', '555-9012'),
('L04', 'Abel Kagae', 'General Practices', '555-0012');


select * from Clients;
select * from Lawyers;
select * from Cases where Status='OPEN';
select c.Case_Type, c.Status, c.Start_Date 
from Cases c 
join Lawyers l on c.LawyerID = l.LawyerID 
where l.Name = 'Emma Wilson';