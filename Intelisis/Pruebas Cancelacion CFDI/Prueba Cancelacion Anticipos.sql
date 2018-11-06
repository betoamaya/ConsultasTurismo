/*Crear Factura de Anticipos*/

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
EXEC dbo.Interfaz_CxcInsertar @Empresa = 'TUN',                               -- char(5)
                              @Mov = 'CFD Anticipo',                          -- char(20)
                              @FechaEmision = '2018-10-16 00:00:00',          -- smalldatetime
                              @Concepto = 'ANTICIPO CFDI GRAVADO VE',         -- varchar(50)
                              @Moneda = 'Pesos',                              -- char(10)
                              @TipoCambio = 1.0,
                              @Usuario = 'SITTI',
                              @Codigo = 'PRUEBA-000005-ANTI',
                              @Referencia = 'VIAJES COBRADOS X ANT. PAG. 004995G-C',
                              @Cliente = '74730',
                              @Sucursal = 0,
                              @Vencimiento = '2018-10-16 00:00:00',
                              @Importe = 800.00,
                              @Impuestos = 128.00,
                              @CentroDeCostos = 'P1101',
                              @TipoPago = 'Deposito Efectivo',
                              @CtaDinero = 'BBV-67',
                              @Observaciones = 'PAGADO',
                              @Comentarios = 'TAMAN - CUAUHTEMOC|CJORTGC11062018133218',
                              @Partidas = NULL,                               -- varchar(max)
                              @ID = @ID OUTPUT,                               -- int
                              @MovID = @MovID OUTPUT,                         -- varchar(max)
                              @Estatus = @Estatus OUTPUT,                     -- char(15)
                              @CFDFlexEstatus = @CFDFlexEstatus OUTPUT,       -- varchar(15)
                              @CFDXml = @CFDXml OUTPUT,                       -- varchar(max)
                              @noCertificado = @noCertificado OUTPUT,         -- varchar(max)
                              @Sello = @Sello OUTPUT,                         -- varchar(max)
                              @SelloSAT = @SelloSAT OUTPUT,                   -- varchar(max)
                              @TFDCadenaOriginal = @TFDCadenaOriginal OUTPUT, -- varchar(max)
                              @UUID = @UUID OUTPUT,                           -- varchar(max)
                              @FechaTimbrado = @FechaTimbrado OUTPUT,         -- varchar(max)
                              @noCertificadoSAT = @noCertificadoSAT OUTPUT;   -- varchar(max)

SELECT @ID AS ID,
       @MovID AS MovID,
       @Estatus AS Estatus,
       @CFDFlexEstatus AS CFDFlexEstatus,
                                        --@CFDXml,
                                        --@noCertificado,
                                        --@Sello,
                                        --@SelloSAT,
                                        --@TFDCadenaOriginal,
       @UUID AS UUID,
       @FechaTimbrado AS FechaTimbrado; --,
--@noCertificadoSAT;

/*============================================*/
--Resultado
--ID		MovID		Estatus		CFDFlexEstatus	UUID									FechaTimbrado
--427707	TVE138515	PENDIENTE      	CONCLUIDO	434CC1AD-DD62-47AE-90D4-37FC9EA54F46	Oct 16 2018  5:46PM
--427924	TVE138583	PENDIENTE      	CONCLUIDO	48BEA580-6595-4F33-A4ED-B415D51C9A06	Nov  6 2018  9:22AM
--427926	TVE138584	PENDIENTE      	CONCLUIDO	5C67D2EE-E35E-46F4-837C-8835EBB361CC	Nov  6 2018  9:25AM
/*============================================*/

GO
/*204 - El comprobante no se puede cancelar*/
UPDATE dbo.CFD
SET UUID = 'E329DD15-7D0B-44E9-A204-51A7443D1FBE'
WHERE MovID = 'TVE138584';

/*211 - La cancelación está en proceso*/
UPDATE dbo.CFD
SET UUID = 'C5E58106-6C1E-41C9-A211-FB8BAD1CABB0'
WHERE MovID = 'TVE138515';

/*OK*/
UPDATE dbo.CFD
SET UUID = '434CC1AD-DD62-47AE-90D4-37FC9EA54F46'
WHERE MovID = 'TVE138515';

/*Cancelación de Anticipo*/
GO 

DECLARE @iError INT,
        @sError VARCHAR(MAX),
        @MovId VARCHAR(20),
        @Estatus VARCHAR(15),
        @Importe MONEY;
EXEC dbo.Interfaz_AnticiposCancelar @IDIntelisis = 427926,           -- int
                                    @MovIdIntelisis = 'TVE138584',       -- varchar(20)
                                    @Usuario = 'SITTI',              -- char(10)
                                    @iError = @iError OUTPUT,   -- int
                                    @sError = @sError OUTPUT,   -- varchar(max)
                                    @MovId = @MovId OUTPUT,     -- varchar(20)
                                    @Estatus = @Estatus OUTPUT, -- varchar(15)
                                    @Importe = @Importe OUTPUT  -- money

SELECT @iError AS iError,
        @sError AS sError,
        @MovId AS MovID,
        @Estatus AS Estatus,
        @Importe AS Importe;

--======================================
--iError	sError								MovID		Estatus		Importe
--204		El CFDI no aplica para cancelación.	TVE138515	PENDIENTE	800.00
--211		La cancelación está en proceso.		TVE138515	PENDIENTE	800.00
--0			CANCELADO							TVE138515	CANCELADO	800.00
--0			CANCELADO							TVE138583	CANCELADO	800.00
--204		El CFDI no aplica para cancelación.	TVE138584	PENDIENTE	800.00
--======================================
