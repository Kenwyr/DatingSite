USE Dating
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Bruger_OpretBruger
@Fornavn NVARCHAR(50),
@Efternavn NVARCHAR(50),
@Fødselsdato DATETIME,
@Oprettelsesdato DATETIME,
@Køn BIT,
@SexOrientering INT,
@Højde INT,
@Vægt DECIMAL(4,1),
@Brugernavn NVARCHAR(50),
@Passw NVARCHAR(50),
@Email NVARCHAR(60),
@PostNR INT

AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Bruger VALUES (@Fornavn, @Efternavn, @Fødselsdato, CURRENT_TIMESTAMP, @Køn, @SexOrientering, @Højde, @Vægt, @Brugernavn, @Passw, @Email, @PostNR)
END
GO
