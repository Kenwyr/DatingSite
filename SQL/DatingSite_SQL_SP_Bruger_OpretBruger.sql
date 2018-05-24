USE Dating
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Bruger_OpretBruger
@Fornavn NVARCHAR(50),
@Efternavn NVARCHAR(50),
@F�dselsdato DATETIME,
@Oprettelsesdato DATETIME,
@K�n BIT,
@SexOrientering INT,
@H�jde INT,
@V�gt DECIMAL(4,1),
@Brugernavn NVARCHAR(50),
@Passw NVARCHAR(50),
@Email NVARCHAR(60),
@PostNR INT

AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Bruger VALUES (@Fornavn, @Efternavn, @F�dselsdato, CURRENT_TIMESTAMP, @K�n, @SexOrientering, @H�jde, @V�gt, @Brugernavn, @Passw, @Email, @PostNR)
END
GO
