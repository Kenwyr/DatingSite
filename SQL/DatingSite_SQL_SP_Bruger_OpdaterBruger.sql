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
@Fødselsdato DATE,
@Køn INT,
@SexOrientering INT,
@Højde INT,
@Vægt DECIMAL,
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
	Fødselsdato = @Fødselsdato,
	Køn = @Køn,
	SexOrientering = @SexOrientering,
	Højde = @Højde,
	Vægt = @Vægt,
	Brugernavn = @Brugernavn,
	Passw = @Passw,
	Email = @Email,
	PostNR = @PostNR
	WHERE BrugerID = @BrugerID
END
GO
