/*Actualizar Fecha Renglon*/
SELECT gd.*
FROM dbo.Gasto AS g
    INNER JOIN dbo.GastoD AS gd
        ON gd.ID = g.ID
WHERE g.Mov = 'Solicitud Gasto'
      AND g.MovID = '581428'
      AND g.Usuario = 'SITTI';

GO
BEGIN TRAN;
UPDATE dbo.GastoD
SET Fecha = '2018-12-22 00:00:00.000'
WHERE ID = 246158
      AND Renglon IN ( 14336 );
/*
COMMIT;
ROLLBACK;
*/

GO

/*Cambiar fecha de Gasto*/

SELECT *
FROM dbo.Gasto AS g
WHERE g.Mov = 'Solicitud Gasto'
      AND g.MovID = '581336'
      AND g.Usuario = 'SITTI';

BEGIN TRAN;
UPDATE dbo.Gasto
SET FechaEmision = '2018-12-29 00:00:00.000'
WHERE ID = 245695;

/*
COMMIT;
ROLLBACK;
*/