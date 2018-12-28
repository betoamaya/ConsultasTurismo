/*Creación de la Factura de Venta*/

GO
DECLARE @ID INT,
        @MovID VARCHAR(MAX),
        @Estatus CHAR(15),
        @CFDFlexEstatus VARCHAR(15),
        @CFDxml VARCHAR(MAX),
        @noCertificado VARCHAR(MAX),
        @Sello VARCHAR(MAX),
        @SelloSAT VARCHAR(MAX),
        @TFDCadenaOriginal VARCHAR(MAX),
        @UUID VARCHAR(MAX),
        @FechaTimbrado VARCHAR(MAX),
        @noCertificadoSAT VARCHAR(MAX);
EXEC dbo.Interfaz_VentasInsertar @Empresa = 'TUN',                                                   -- char(5)
                                 @Mov = 'Fact Otros Ing Cont',                                       -- char(20)
                                 @FechaEmision = '2018-10-17 19:52:43',                              -- smalldatetime
                                 @Concepto = 'ENTRADAS A PARQUES',                                   -- varchar(50)
                                 @Moneda = 'Pesos',                                                  -- char(10)
                                 @TipoCambio = 1.0,                                                  -- float
                                 @Usuario = 'SITTI',                                                 -- char(10)
                                 @Referencia = 'Servicios Complementarios - TAMPICO|CSAROBT0608201', -- varchar(50)
                                 @Codigo = 'Prueba-00004-CRED',                                      -- varchar(30)
                                 @Cliente = '47620',                                                 -- char(10)
                                 @Sucursal = 3,                                                      -- int
                                 @Vencimiento = '2018-10-18 19:52:43',                               -- smalldatetime
                                 @Importe = 800.00,                                                  -- money
                                 @Impuestos = 128.00,                                                -- money
                                 @CentroDeCostos = 'P1001',                                          -- varchar(20)
                                 @TipoPago = 'Transferencia',                                        -- varchar(50)
                                 @Observaciones = NULL,                                              -- varchar(100)
                                 @Comentarios = NULL,                                                -- varchar(max)
                                 @PartidasVtas = NULL,                                               -- varchar(max)
                                 @MovRelacionados = NULL,                                            -- varchar(max)
                                 @ID = @ID OUTPUT,                                                   -- int
                                 @MovID = @MovID OUTPUT,                                             -- varchar(max)
                                 @Estatus = @Estatus OUTPUT,                                         -- char(15)
                                 @CFDFlexEstatus = @CFDFlexEstatus OUTPUT,                           -- varchar(15)
                                 @CFDxml = @CFDxml OUTPUT,                                           -- varchar(max)
                                 @noCertificado = @noCertificado OUTPUT,                             -- varchar(max)
                                 @Sello = @Sello OUTPUT,                                             -- varchar(max)
                                 @SelloSAT = @SelloSAT OUTPUT,                                       -- varchar(max)
                                 @TFDCadenaOriginal = @TFDCadenaOriginal OUTPUT,                     -- varchar(max)
                                 @UUID = @UUID OUTPUT,                                               -- varchar(max)
                                 @FechaTimbrado = @FechaTimbrado OUTPUT,                             -- varchar(max)
                                 @noCertificadoSAT = @noCertificadoSAT OUTPUT;                       -- varchar(max)

SELECT @ID,
       @MovID,
       @Estatus,
       @CFDFlexEstatus,
       @CFDxml,
       @noCertificado,
       @Sello,
       @SelloSAT,
       @TFDCadenaOriginal,
       @UUID,
       @FechaTimbrado,
       @noCertificadoSAT;

/*============================================*/
--Resultado
--ID		MovID		Estatus		CFDFlexEstatus	UUID									FechaTimbrado
--913086	TVE138516	CONCLUIDO	CONCLUIDO		7571AADF-0337-493A-87AC-CAA029EF31BB	2018-10-17 07:58:23.000
/*============================================*/
GO

/*204 - El comprobante no se puede cancelar*/
UPDATE dbo.CFD
SET UUID = 'E329DD15-7D0B-44E9-A204-51A7443D1FBE'
WHERE MovID = 'TVE138516';

/*211 - La cancelación está en proceso*/
UPDATE dbo.CFD
SET UUID = 'C5E58106-6C1E-41C9-A211-FB8BAD1CABB0'
WHERE MovID = 'TVE138516';

/*OK*/
UPDATE dbo.CFD
SET UUID = '19B6792B-B8BB-4A02-9E49-AB3F028C9D66'
WHERE MovID = 'TVE138516';

/*Cancelación de Cobro*/
GO
DECLARE @iError INT,
        @sError VARCHAR(MAX),
        @MovId VARCHAR(20),
        @Estatus VARCHAR(15),
        @Importe MONEY;
EXEC dbo.Interfaz_VentasCancelar @IDIntelisis = 913086,         -- int
                                 @MovIdIntelisis = 'TVE138516', -- varchar(20)
                                 @Usuario = 'SITTI',            -- char(10)
                                 @iError = @iError OUTPUT,      -- int
                                 @sError = @sError OUTPUT,      -- varchar(max)
                                 @MovId = @MovId OUTPUT,        -- varchar(20)
                                 @Estatus = @Estatus OUTPUT,    -- varchar(15)
                                 @Importe = @Importe OUTPUT;    -- money

SELECT @iError AS iError,
       @sError AS sError,
       @MovId AS MovID,
       @Estatus AS Estatus,
       @Importe AS Importe;

--======================================
--iError	sError								MovID		Estatus		Importe
--204		El CFDI no aplica para cancelación.	TVE138516	CONCLUIDO	800.00
--211		La cancelación está en proceso.		TVE138516	CONCLUIDO	800.00
--0			CANCELADO							TVE138516	CANCELADO	800.00
--======================================
