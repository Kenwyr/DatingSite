USE Dating
GO

IF OBJECT_ID('TRG_CreateProfilForUser') IS NOT NULL
DROP TRIGGER TRG_CreateProfilForUser
GO

CREATE TRIGGER TRG_CreateProfilForUser 
ON Bruger
AFTER INSERT
AS

BEGIN
	DECLARE @ID AS INT
	SET @ID = (SELECT BrugerID FROM inserted)
	INSERT INTO Profil (ProfilID)
	VALUES (@ID)
END
GO