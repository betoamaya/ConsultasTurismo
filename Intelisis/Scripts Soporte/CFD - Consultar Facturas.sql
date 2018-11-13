SELECT c2.ID,
		c2.Mov,
       c2.MovID,
       c2.Estatus,
       (CASE
            WHEN c.Documento IS NOT NULL THEN
                'CONCLUIDO'
            ELSE
                ISNULL(c.Documento, 'Error')
        END
       ) AS CFDFlexEstatus,
       CFDXML = CAST(c.Documento AS VARCHAR(MAX)),
       c.noCertificado,
       c.Sello,
       c.SelloSAT,
       c.TFDCadenaOriginal,
       c.UUID,
       c.FechaTimbrado,
       c.noCertificadoSAT
FROM dbo.CFD AS c
    INNER JOIN dbo.Cxc AS c2
        ON c.ModuloID = c2.ID
           AND c2.MovID = c.MovID
WHERE c.MovID IN ( '754', '752' )
      AND c2.Usuario IN ( 'SITTI', 'JPADRON' );


SELECT d.ID, d.Mov, d.MovID, d.Estatus FROM dbo.Dinero AS d WHERE d.OrigenTipo = 'CXC' AND d.Origen = 'Cobro TransInd' and d.OrigenID IN ('752', '754')




