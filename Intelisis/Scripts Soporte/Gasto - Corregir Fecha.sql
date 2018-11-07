/*Actualizar Fecha Renglon*/
SELECT gd.*
FROM dbo.Gasto AS g
    INNER JOIN dbo.GastoD AS gd
        ON gd.ID = g.ID
WHERE g.Mov = 'Solicitud Gasto'
      AND g.MovID = '575355'
      AND g.Usuario = 'SITTI';

GO
BEGIN TRAN;
UPDATE dbo.GastoD
SET Fecha = '2018-10-28 00:00:00.000'
WHERE ID = 226303
      AND Renglon = 2048;
/*
COMMIT;
ROLLBACK;
*/
