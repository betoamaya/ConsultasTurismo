/*Actualizar Fecha Renglon*/
SELECT gd.*
FROM dbo.Gasto AS g
    INNER JOIN dbo.GastoD AS gd
        ON gd.ID = g.ID
WHERE g.Mov = 'Solicitud Gasto'
      AND g.MovID = '581217'
      AND g.Usuario = 'SITTI';

GO
BEGIN TRAN;
UPDATE dbo.GastoD
SET Fecha = '2018-12-09 00:00:00.000'
WHERE ID = 245211
      AND Renglon IN ( 28672 );

UPDATE dbo.GastoD
SET Fecha = '2018-12-11 00:00:00.000'
WHERE ID = 245211
      AND Renglon IN ( 32768 );
/*
COMMIT;
ROLLBACK;
*/