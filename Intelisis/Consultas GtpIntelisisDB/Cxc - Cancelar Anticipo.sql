/**********CANCELAR UNA FACTURA**************/

/*Consultar Factura*/

SELECT TOP 100
    c.ID,
    c.Mov,
    c.MovID,
    c.FechaEmision,
    c.Estatus,
    c.CFDFlexEstatus,
    c.Importe,
    c.Impuestos,
    c.Usuario,
    c2.FechaTimbrado,
    c2.UUID,
    c2.FechaCancelacion
FROM dbo.Cxc AS c
    INNER JOIN dbo.CFD AS c2
        ON c2.Modulo = 'CXC'
           AND c.ID = c2.ModuloID
WHERE c.Empresa = 'TUN'
      AND c.Usuario = 'SITTI'
      AND c.Mov = 'CFD Anticipo'
      AND c.MovID = 'TVE138588'
ORDER BY c.FechaEmision DESC;

/*Procedimiento de Cancelación*/
GO

DECLARE @iError INT,
        @sError VARCHAR(MAX),
        @MovId VARCHAR(20),
        @Estatus VARCHAR(15),
        @Importe MONEY;
EXEC dbo.Interfaz_AnticiposCancelar @IDIntelisis = 427938,         -- int
                                    @MovIdIntelisis = 'TVE138588', -- varchar(20)
                                    @Usuario = 'SITTI',            -- char(10)
                                    @iError = @iError OUTPUT,      -- int
                                    @sError = @sError OUTPUT,      -- varchar(max)
                                    @MovId = @MovId OUTPUT,        -- varchar(20)
                                    @Estatus = @Estatus OUTPUT,    -- varchar(15)
                                    @Importe = @Importe OUTPUT;    -- money

SELECT @iError,
       @sError,
       @MovId,
       @Estatus,
       @Importe;