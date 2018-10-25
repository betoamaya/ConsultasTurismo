/*Actualizar Fecha Renglon*/
SELECT gd.*
FROM dbo.Gasto AS g
    INNER JOIN dbo.GastoD AS gd
        ON gd.ID = g.ID
WHERE g.Mov = 'Solicitud Gasto'
      AND g.MovID = '573160'
      AND g.Usuario = 'SITTI';

GO
BEGIN TRAN;
UPDATE dbo.GastoD
SET Fecha = '2018-10-11 00:00:00.000'
WHERE ID = 218975
      AND Renglon = 4096;
/*
COMMIT;
ROLLBACK;
*/
