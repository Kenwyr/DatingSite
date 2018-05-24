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