SELECT *
FROM dbo.Cxc AS c
WHERE c.Mov = 'Solicitud Deposito'
      AND c.Estatus = 'PENDIENTE'
      AND c.Usuario = 'SITTI';

SELECT *
FROM dbo.Dinero AS d
WHERE d.Mov = 'Solicitud Deposito'
      AND d.MovID IN (
                         SELECT c.MovID
                         FROM dbo.Cxc AS c
                         WHERE c.Mov = 'Solicitud Deposito'
                               AND c.Estatus = 'PENDIENTE'
                               AND c.Usuario = 'SITTI'
                               AND c.Empresa = 'TUN'
                     );


SELECT ID,
       d.Mov,
       d.MovID,
       CONVERT(VARCHAR, d.FechaEmision, 120) AS 'Fecha Emision',
       d.Importe,
       d.OrigenTipo,
       d.Origen,
       d.OrigenID,
       CASE
           WHEN ISNULL(cii.IdCFD, 0) <> 0 THEN
               'Si'
           ELSE
               'No'
       END AS 'Factura en SITTI',
       p.TipoPago,
       p.Monto,
       CONVERT(VARCHAR, p.FechaCancelacion, 120) AS 'Fecha de Cancelacion SITTI'
FROM dbo.Dinero AS d
    LEFT JOIN GTPSITTIDB.sitti.dbo.CFDIntelisisInfo AS cii
        ON d.OrigenID = cii.MovimientoId
    LEFT JOIN GTPSITTIDB.sitti.dbo.Pagos AS p
        ON p.IdCFD = cii.IdCFD
WHERE d.Mov = 'Solicitud Deposito'
      AND d.Estatus = 'PENDIENTE'
      AND d.Usuario = 'SITTI';