 drop database if exists ESOL;
 CREATE DATABASE ESOL;
 use ESOL;
 
 create table Users(
 UserName varchar(10),
 Password varchar(10),
 ID varchar(10) primary key
 );
 
  insert into Users(UserName,Password,ID)
 Values ("Admin","Admin","Admin");
  insert into Users(UserName,Password,ID)
 Values ("user1","user1","User1");
 
 create table Book(
 HaveSeen Bit(1) DEFAULT 0,
  DateAdded Date,
 FirstName varchar(15),
 LastName varchar(15),
 NumPeople int ,
 Car varchar(4) ,
 phone varchar (10),
 Email varchar(30),
 DAddress varchar (10),
 DAInfo varchar (30),
 MOArrival varchar (10),
 ADate Date,
 ATime varchar (10),
 IDBook int primary key  AUTO_INCREMENT ,
 ID varchar(10) ,
 CONSTRAINT FK_ID FOREIGN KEY (ID) REFERENCES Users(ID)
  )auto_increment=100;
   
 insert into Book(DateAdded,FirstName,LastName,NumPeople,Car,phone,Email,DAddress,DAInfo,MOArrival,ADate,ATime,ID)
 Values("2018/1/5","vasilis","christodooulakis","5","VAN","5678","","SYNTAGMA","","HIGH SPEAD","2018/1/5","20:00","User1");
 insert into Book(DateAdded,FirstName,LastName,NumPeople,Car,phone,Email,DAddress,DAInfo,MOArrival,ADate,ATime,ID)
 Values ("2018/2/7","minos","clakis","1","TAXI","5678","","GLYFADA","","BLUE STAR","2018/1/5","10:00","User1");
 insert into Book(DateAdded,FirstName,LastName,NumPeople,Car,phone,Email,DAddress,DAInfo,MOArrival,ADate,ATime,ID)
 Values ("2018/1/2","vis","christods","5","VAN","5678","","AIRPORT","","HIGH SPEAD","2018/1/5","21:00","Admin");
 insert into Book(DateAdded,FirstName,LastName,NumPeople,Car,phone,Email,DAddress,DAInfo,MOArrival,ADate,ATime,ID)
 Values ("2018/1/8","lis","cooulakis","2","TAXI","5678","","SYNTAGMA","","HIGH SPEAD","2018/1/5","23:15","User1");
 insert into Book(DateAdded,FirstName,LastName,NumPeople,Car,phone,Email,DAddress,DAInfo,MOArrival,ADate,ATime,ID)
 Values ("2018/2/5","vasis","ckis","8","VAN","5678","","SYNTAGMA","","HIGH SPEAD","2018/1/5","20:00","User1");
 insert into Book(DateAdded,FirstName,LastName,NumPeople,Car,phone,Email,DAddress,DAInfo,MOArrival,ADate,ATime,ID)
 Values ("2018/2/9","mos","cis","1","TAXI","5678","","GLYFADA","","BLUE STAR","2018/1/5","10:00","User1");
 insert into Book(DateAdded,FirstName,LastName,NumPeople,Car,phone,Email,DAddress,DAInfo,MOArrival,ADate,ATime,ID)
 Values ("2018/2/5","vs","s","5","VAN","5678","","AIRPORT","","HIGH SPEAD","2018/1/5","21:00","Admin");
 insert into Book(DateAdded,FirstName,LastName,NumPeople,Car,phone,Email,DAddress,DAInfo,MOArrival,ADate,ATime,ID)
 Values ("2018/1/15","is","cokis","2","TAXI","5678","","SYNTAGMA","","HIGH SPEAD","2018/1/5","23:15","User1");
 
CREATE table DAddress(
ID  int PRIMARY key AUTO_INCREMENT,
location varchar(15)
);
 
insert into DAddress(location) values ("AIRPORT"); 
insert into DAddress(location) values ("SYNTAGMA");
insert into DAddress(location) values ("GLYFADA");
insert into DAddress(location) values ("KIFISIA"); 

create table MOArrival(
id int PRIMARY KEY AUTO_INCREMENT,
location varchar(15) 
);

insert into MOArrival(location) values ("HIGH SPEED");
insert into MOArrival(location) values ("BLUE STAR");


create table Drivers(
ID int PRIMARY key AUTO_INCREMENT,
FirstName varchar(15),
LastName varchar(15)
);

Insert into Drivers(FirstName,LastName) values ("Kwstas","Anagnosto");
Insert into Drivers(FirstName,LastName) values ("vasilis","kost");

create table DeleteBook(
 HaveSeen Bit(1) DEFAULT 0,
  DateAdded Date,
 ADate Date,
 DAddress varchar(10),
 Car varchar(4),
 IDBook int primary key  ,
 ID varchar(10) ,
 Driver int,
 CONSTRAINT FK_IDD FOREIGN KEY (ID) REFERENCES Users(ID)
 CONSTRAINT FK_DrivD FOREIGN KEY (Driver) REFERENCES Drivers(ID)
 )
  
 /*Drop database esol
 
select UserName,Password from Users where UserName="aaaa" and Password="aaaaa";
select * from Book;
select * from users;
Drop database windowapp

INSERT INTO Book (HaveSeen,FirstName,LastName,NumPeople,phone,Email,DAddress,MOArrival,ADate,ATime,ID) VALUES (1,"a","a","a","a","a","a","a","a","a","Admin");

select HaveSeen AS ,IDBook AS RID,FirstName AS FirstName,LastName AS LastName,NumPeople AS People,phone AS Phone,Email AS EMAIL,DAddress AS Destination_Ad,MOArrival,ADate as Arrival_D,ATime as Arrival_T,ID from Book where ID=@id ORDER BY HaveSeen ASC;
select HaveSeen AS S,IDBook AS RID from Book
update Book
set HaveSeen=1
where IDBook=*/