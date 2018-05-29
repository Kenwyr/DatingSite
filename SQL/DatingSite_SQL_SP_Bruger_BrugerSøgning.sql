USE Dating
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Bruger_BrugerS�gning
@Fornavn NVARCHAR(50),
@Efternavn NVARCHAR(50),
@AlderStart DATE,
@AlderEnd DATE,
@K�n INT,
@SexOrientering INT,
@H�jdeStart INT,
@H�jdeEnd INT,
@V�gtStart DECIMAL,
@V�gtEnd DECIMAL,
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
	AND F�dselsdato BETWEEN @AlderStart AND @AlderEnd
	AND K�n = @K�n
	AND SexOrientering = @SexOrientering
	AND H�jde BETWEEN @H�jdeStart AND @H�jdeEnd
	AND V�GT BETWEEN @V�gtStart AND @V�gtEnd
	AND Brugernavn = @Brugernavn
	AND Email = @Email
	AND PostNR BETWEEN @PostNRStart AND @PostNREnd
END
GO
