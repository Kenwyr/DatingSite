use master;
if exists(select * from sys.databases where name = 'Dating')
begin
   drop database Dating
   print 'Vi dropper databasen Dating - findes i forvejen.'
end
else 
begin
   print 'DB Datng findes ikke, vil blive oprettet.'
end
go
create database Dating
go
use Dating
go
create table PostNR(
PostNR integer primary key,
Bynavn nvarchar(50)
)
create table Bruger(
BrugerID integer primary key,
Fornavn nvarchar(50),
Efternavn nvarchar(50),
Fødselsdato datetime,
Oprettelsesdato datetime,
Køn bit,
SextOrientering integer,
Højde int,
Vægt decimal(3,1),
Brugernavn nvarchar(50),
Passw nvarchar(50),
Email nvarchar(60),
PostNr int foreign key references PostNR(PostNR)
)
go

create table Profil (
ProfilID integer primary key foreign key references Bruger(BrugerID),
Profiltekst nvarchar(max),
Profilbillede varbinary(max)
)
go

create table DirectMessage(
DmID integer primary key,
Emne nvarchar(1000),
Besked nvarchar(max),
AfsendtTid datetime,
AfsenderID integer foreign key references Bruger(BrugerID),
ModtagerID integer foreign key references Bruger(BrugerID),
LæstStatus bit
)
go

create table Likes(
LikerID integer foreign key references Bruger(BrugerID),
LikedID integer foreign key references Bruger(BrugerID),
constraint UC_LikerLiked unique (LikerID, LikedID)
)
go
print 'DB Dating oprettet.'