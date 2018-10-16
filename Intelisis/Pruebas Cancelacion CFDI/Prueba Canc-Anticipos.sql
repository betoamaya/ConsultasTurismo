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
                              @Codigo = 'PRUEBA-000001-ANTI',
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
--427689	TVE138510	PENDIENTE	CONCLUIDO		7F62287C-A488-4ECD-8776-6BAD109271CC	2018-10-16 11:42:19.000
/*============================================*/
/***204 - El comprobante no se puede cancelar***/
SELECT *
FROM dbo.CFD AS c
WHERE c.MovID = 'TVE138510';
UPDATE dbo.CFD
SET UUID = 'E329DD15-7D0B-44E9-A204-51A7443D1FBE'
WHERE MovID = 'TVE138510';


/***CANCELAR****/
DECLARE @Id INT,
        @MovId VARCHAR(20),
        @Estatus VARCHAR(15),
        @Importe MONEY;
EXEC dbo.Interfaz_AnticiposCancelar @IDIntelisis = 427689,           -- int
                                    @MovIdIntelisis = 'TVE138510',       -- varchar(20)
                                    @Usuario = 'SITTI',              -- char(10)
                                    @Id = @Id OUTPUT,           -- int
                                    @MovId = @MovId OUTPUT,     -- varchar(20)
                                    @Estatus = @Estatus OUTPUT, -- varchar(15)
                                    @Importe = @Importe OUTPUT  -- money

SELECT @Id,
        @MovId,
        @Estatus,
        @Importe;

/*
Resultado de Validacion General: 
Cancelando el movimiento: 427689
Termino ***
Retorno SPAfectar: 71650 <IntelisisCFDI><Error></Error><Descripcion>[Servidor de pruebas] Ocurrió un error al procesar la solicitud. IdError: testing-5052b787-adfa-4134-95d2-3b917f483264</Descripcion></IntelisisCFDI >
Codigo de Resultado: 71650 Error al timbrar el CFDI <IntelisisCFDI><Error></Error><Descripcion>[Servidor de pruebas] Ocurrió un error al procesar la solicitud. IdError: testing-5052b787-adfa-4134-95d2-3b917f483264</Descripcion></IntelisisCFDI >
Mensaje 50000, nivel 16, estado 1, procedimiento Interfaz_AnticiposCancelar, línea 129 [línea de inicio de lote 74]
Error al aplicar el movimiento de Intelisis: Error = 71650, Mensaje = Error al timbrar el CFDI <IntelisisCFDI><Error></Error><Descripcion>[Servidor de pruebas] Ocurrió un error al procesar la solicitud. IdError: testing-5052b787-adfa-4134-95d2-3b917f483264</Descripcion></IntelisisCFDI >, el movimiento no fue cancelado. Intente nuevamente.

(1 fila afectada)

*/
