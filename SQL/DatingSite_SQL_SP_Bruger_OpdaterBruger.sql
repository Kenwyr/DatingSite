USE Dating
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Bruger_OpdaterBruger
@BrugerID INT,
@Fornavn NVARCHAR(50),
@Efternavn NVARCHAR(50),
@F�dselsdato DATE,
@K�n INT,
@SexOrientering INT,
@H�jde INT,
@V�gt DECIMAL,
@Brugernavn NVARCHAR(50),
@Passw NVARCHAR(50),
@Email NVARCHAR(60),
@PostNR INT

AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Bruger
	SET Fornavn = @Fornavn, 
	Efternavn = @Efternavn,
	F�dselsdato = @F�dselsdato,
	K�n = @K�n,
	SexOrientering = @SexOrientering,
	H�jde = @H�jde,
	V�gt = @V�gt,
	Brugernavn = @Brugernavn,
	Passw = @Passw,
	Email = @Email,
	PostNR = @PostNR
	WHERE BrugerID = @BrugerID
END
GO
