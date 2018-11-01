
/*=========Pruebas con Cobros============*/
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
EXEC dbo.Interfaz_VentasInsertar @Empresa = 'TUN',                               -- char(5)
                                 @Mov = 'FACT.VE.GRAVADO',                       -- char(20)
                                 @FechaEmision = '2018-10-16 19:52:43',          -- smalldatetime
                                 @Concepto = 'VIAJE ESPECIAL GRAVADO',           -- varchar(50)
                                 @Moneda = 'Pesos',                              -- char(10)
                                 @TipoCambio = 1.0,                              -- float
                                 @Usuario = 'SITTI',                             -- char(10)
                                 @Referencia = 'Crédito: 001217C-R',             -- varchar(50)
                                 @Codigo = 'Prueba-00003-CRED',                  -- varchar(30)
                                 @Cliente = '27048',                             -- char(10)
                                 @Sucursal = 26,                                 -- int
                                 @Vencimiento = '2018-10-17 19:52:43',           -- smalldatetime
                                 @Importe = 800.00,                              -- money
                                 @Impuestos = 128.00,                            -- money
                                 @CentroDeCostos = 'P1001',                      -- varchar(20)
                                 @TipoPago = 'NO IDENTIFICADO',                  -- varchar(50)
                                 @Observaciones = NULL,                          -- varchar(100)
                                 @Comentarios = NULL,                            -- varchar(max)
                                 @PartidasVtas = NULL,                           -- varchar(max)
                                 @MovRelacionados = NULL,                        -- varchar(max)
                                 @ID = @ID OUTPUT,                               -- int
                                 @MovID = @MovID OUTPUT,                         -- varchar(max)
                                 @Estatus = @Estatus OUTPUT,                     -- char(15)
                                 @CFDFlexEstatus = @CFDFlexEstatus OUTPUT,       -- varchar(15)
                                 @CFDxml = @CFDxml OUTPUT,                       -- varchar(max)
                                 @noCertificado = @noCertificado OUTPUT,         -- varchar(max)
                                 @Sello = @Sello OUTPUT,                         -- varchar(max)
                                 @SelloSAT = @SelloSAT OUTPUT,                   -- varchar(max)
                                 @TFDCadenaOriginal = @TFDCadenaOriginal OUTPUT, -- varchar(max)
                                 @UUID = @UUID OUTPUT,                           -- varchar(max)
                                 @FechaTimbrado = @FechaTimbrado OUTPUT,         -- varchar(max)
                                 @noCertificadoSAT = @noCertificadoSAT OUTPUT;   -- varchar(max)

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
--913085	TVE138514	CONCLUIDO	CONCLUIDO		A9E98199-4901-4680-A9B3-63EF0C1B366D	2018-10-16 17:05:11.000
/*============================================*/
GO
/**Factura de Cobro**/
DECLARE @ID INT,
        @MovID VARCHAR(MAX),
        @Estatus CHAR(15),
        @CFDFlexEstatus VARCHAR(15),
        @CFDXml VARCHAR(MAX),
        @noCertificado VARCHAR(MAX),
        @Sello VARCHAR(MAX),
        @SelloSAT VARCHAR(MAX),
        @TFDCadenaOriginal VARCHAR(MAX),
        @UUID VARCHAR(MAX),
        @FechaTimbrado VARCHAR(MAX),
        @noCertificadoSAT VARCHAR(MAX);
EXEC dbo.Interfaz_CxcInsertar @Empresa = 'TUN',                                                                                 -- char(5)
                              @Mov = 'Cobro VE Gravado',                                                                        -- char(20)
                              @FechaEmision = '2018-10-16 22:07:21',                                                            -- smalldatetime
                              @Concepto = 'VIAJE ESPECIAL GRAVADO',                                                             -- varchar(50)
                              @Moneda = 'Pesos',                                                                                -- char(10)
                              @TipoCambio = 1.0,                                                                                -- float
                              @Usuario = 'SITTI',                                                                               -- char(10)
                              @Codigo = 'PRUEBA-00003-COBR',                                                                    -- varchar(30)
                              @Referencia = '002829A-R',                                                                        -- varchar(50)
                              @Cliente = '27048',                                                                               -- char(10)
                              @Sucursal = 26,                                                                                   -- int
                              @Vencimiento = '2018-10-16 22:07:21',                                                             -- smalldatetime
                              @Importe = 800.00,                                                                                -- money
                              @Impuestos = 128.00,                                                                              -- money
                              @CentroDeCostos = 'p1001',                                                                        -- varchar(20)
                              @TipoPago = 'Transferencia',                                                                      -- varchar(50)
                              @CtaDinero = 'BBV-68',                                                                            -- char(10)
                              @Observaciones = NULL,                                                                            -- varchar(100)
                              @Comentarios = NULL,                                                                              -- varchar(max)
                              @Partidas = '<row><fila Aplica="FACT.VE.GRAVADO" AplicaID="TVE138514" Importe="928.00" /></row>', -- varchar(max)
                              @ID = @ID OUTPUT,                                                                                 -- int
                              @MovID = @MovID OUTPUT,                                                                           -- varchar(max)
                              @Estatus = @Estatus OUTPUT,                                                                       -- char(15)
                              @CFDFlexEstatus = @CFDFlexEstatus OUTPUT,                                                         -- varchar(15)
                              @CFDXml = @CFDXml OUTPUT,                                                                         -- varchar(max)
                              @noCertificado = @noCertificado OUTPUT,                                                           -- varchar(max)
                              @Sello = @Sello OUTPUT,                                                                           -- varchar(max)
                              @SelloSAT = @SelloSAT OUTPUT,                                                                     -- varchar(max)
                              @TFDCadenaOriginal = @TFDCadenaOriginal OUTPUT,                                                   -- varchar(max)
                              @UUID = @UUID OUTPUT,                                                                             -- varchar(max)
                              @FechaTimbrado = @FechaTimbrado OUTPUT,                                                           -- varchar(max)
                              @noCertificadoSAT = @noCertificadoSAT OUTPUT;                                                     -- varchar(max)


SELECT @ID,
       @MovID,
       @Estatus,
       @CFDFlexEstatus,
       @CFDXml,
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
--427705	TVC1295		CONCLUIDO	CONCLUIDO		00FBC0A3-0798-4795-81AE-41CED4030217	2018-10-16 17:21:04.000
--427709	TVC1296		CONCLUIDO	CONCLUIDO		19B6792B-B8BB-4A02-9E49-AB3F028C9D66	2018-10-16 17:57:49.000
/*============================================*/
GO
/*204 - El comprobante no se puede cancelar*/
UPDATE dbo.CFD
SET UUID = 'E329DD15-7D0B-44E9-A204-51A7443D1FBE'
WHERE MovID = 'TVC1296';

/*211 - La cancelación está en proceso*/
UPDATE dbo.CFD
SET UUID = 'C5E58106-6C1E-41C9-A211-FB8BAD1CABB0'
WHERE MovID = 'TVC1296';

/*OK*/
UPDATE dbo.CFD
SET UUID = '19B6792B-B8BB-4A02-9E49-AB3F028C9D66'
WHERE MovID = 'TVC1296';


/*Cancelación de Cobro*/
GO

DECLARE @iError INT,
        @sError VARCHAR(MAX),
        @MovId VARCHAR(20),
        @Estatus VARCHAR(15),
        @Importe MONEY;
EXEC dbo.Interfaz_AnticiposCancelar @IDIntelisis = 427709,       -- int
                                    @MovIdIntelisis = 'TVC1296', -- varchar(20)
                                    @Usuario = 'SITTI',          -- char(10)
                                    @iError = @iError OUTPUT,    -- int
                                    @sError = @sError OUTPUT,    -- varchar(max)
                                    @MovId = @MovId OUTPUT,      -- varchar(20)
                                    @Estatus = @Estatus OUTPUT,  -- varchar(15)
                                    @Importe = @Importe OUTPUT;  -- money

SELECT @iError AS iError,
       @sError AS sError,
       @MovId AS MovID,
       @Estatus AS Estatus,
       @Importe AS Importe;

--======================================
--iError	sError								MovID		Estatus		Importe
--204		El CFDI no aplica para cancelación.	TVC1296		CONCLUIDO	800.00
--211		La cancelación está en proceso.		TVC1296		CONCLUIDO	800.00
--0			CANCELADO							TVC1296		CANCELADO	800.00
--======================================
