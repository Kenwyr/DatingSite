USE MASTER
GO

IF EXISTS (SELECT * FROM sys.databases WHERE NAME = 'Dating')
BEGIN
   DROP DATABASE Dating
   PRINT 'Vi dropper databasen Dating - findes i forvejen.'
END
ELSE 
BEGIN
   PRINT 'Databasen Datng findes ikke, vil blive oprettet.'
END
GO

CREATE DATABASE Dating
GO

USE Dating
GO

CREATE TABLE PostNR(
PostNR INT PRIMARY KEY NOT NULL,
Bynavn NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE Bruger(
BrugerID INT IDENTITY(1, 1) PRIMARY KEY,
Fornavn NVARCHAR(50) NOT NULL,
Efternavn NVARCHAR(50) NOT NULL,
Fødselsdato DATE NOT NULL,
Oprettelsesdato DATETIME NOT NULL,
Køn INT NOT NULL,
SexOrientering INT NOT NULL,
Højde INT NOT NULL,
Vægt INT NOT NULL,
Brugernavn NVARCHAR(50) NOT NULL,
Passw NVARCHAR(50) NOT NULL,
Email NVARCHAR(60) NOT NULL,
PostNR int foreign key references PostNR(PostNR) NOT NULL,
DeletedUser BIT NOT NULL
)
GO

CREATE TABLE Profil (
ProfilID INT PRIMARY KEY FOREIGN KEY (ProfilID) REFERENCES Bruger(BrugerID),
Profiltekst NVARCHAR(MAX),
Profilbillede VARBINARY(MAX)
)
go

CREATE TABLE DirectMessage(
DmID INT PRIMARY KEY,
Emne NVARCHAR(500),
Besked NVARCHAR(MAX) NOT NULL,
AfsendtTid DATETIME NOT NULL,
AfsenderID INT FOREIGN KEY (AfsenderID) REFERENCES Bruger(BrugerID) NOT NULL,
ModtagerID INT FOREIGN KEY (ModtagerID) REFERENCES Bruger(BrugerID) NOT NULL,
LæstStatus BIT NOT NULL
)
GO

CREATE TABLE Likes(
LikerID INT FOREIGN KEY (LikerID) REFERENCES Bruger(BrugerID) NOT NULL,
LikedID INT FOREIGN KEY (LikedID) REFERENCES Bruger(BrugerID) NOT NULL,
CONSTRAINT UC_LikerLiked UNIQUE (LikerID, LikedID)
)
GO

PRINT 'Databasen Dating og tabeller oprettet.'

BULK INSERT PostNR
FROM 'C:\Users\Tec\Documents\GitHub\DatingSite\SQL\Postnummer.csv'
WITH
(
    CODEPAGE = '65001',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

PRINT 'Postnumre og Bynavne indsat i PostNR tabel'