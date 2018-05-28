USE Dating
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Bruger_BrugerSøgning
@Fornavn NVARCHAR(50),
@Efternavn NVARCHAR(50),
@AlderStart DATE,
@AlderEnd DATE,
@Køn INT,
@SexOrientering INT,
@HøjdeStart INT,
@HøjdeEnd INT,
@VægtStart DECIMAL,
@VægtEnd DECIMAL,
@Brugernavn NVARCHAR(50),
@Email NVARCHAR(50),
@PostNRStart INT,
@PostNREnd INT

AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Bruger
	WHERE Fornavn LIKE '%' +  @Fornavn + '%'
	AND Efternavn LIKE '%' + @Efternavn + '%'
	AND Fødselsdato BETWEEN @AlderStart AND @AlderEnd
	AND Køn = @Køn
	AND SexOrientering = @SexOrientering
	AND Højde BETWEEN @HøjdeStart AND @HøjdeEnd
	AND VÆGT BETWEEN @VægtStart AND @VægtEnd
	AND Brugernavn = @Brugernavn
	AND Email = @Email
	AND PostNR BETWEEN @PostNRStart AND @PostNREnd
END
GO
