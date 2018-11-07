/*Actualizar Fecha Renglon*/
SELECT gd.*
FROM dbo.Gasto AS g
    INNER JOIN dbo.GastoD AS gd
        ON gd.ID = g.ID
WHERE g.Mov = 'Solicitud Gasto'
      AND g.MovID = '575402'
      AND g.Usuario = 'SITTI';

GO
BEGIN TRAN;
UPDATE dbo.GastoD
SET Fecha = '2018-10-08 00:00:00.000'
WHERE ID = 226412
      AND Renglon IN (38912,43008);

UPDATE dbo.GastoD
SET Fecha = '2018-10-05 00:00:00.000'
WHERE ID = 226412
      AND Renglon IN (40960,45056);
/*
COMMIT;
ROLLBACK;
*/
