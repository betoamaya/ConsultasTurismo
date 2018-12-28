SELECT Clave,
       Nombre,
       RazonSocial,
       RFC
FROM GTPINTELISISDB.GPOTRANSPAISDB.dbo.CFDINominaSATInstitucionFin
WHERE Clave = 12
ORDER BY Nombre;


SELECT Cliente,
       Nombre,
       RFC,
       CtaBanco,
       ClaveBanco
FROM dbo.Cte
WHERE Cliente = '79374';

UPDATE dbo.Cte
SET CtaBanco = NULL,
    ClaveBanco = NULL
WHERE Cliente = '79374';
UPDATE dbo.Cte
SET CtaBanco = '0110705799',
    ClaveBanco = 12
WHERE Cliente = '79374';

/* Factura de Credito*/

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
                                 @FechaEmision = '2018-10-15 20:52:01',          -- smalldatetime
                                 @Concepto = 'VIAJE ESPECIAL GRAVADO',           -- varchar(50)
                                 @Moneda = 'Pesos',                              -- char(10)
                                 @TipoCambio = 1.0,                              -- float
                                 @Usuario = 'SITTI',                             -- char(10)
                                 @Referencia = 'Crédito: 005789J-C',             -- varchar(50)
                                 @Codigo = 'prueba-00007-CRED',                  -- varchar(30)
                                 @Cliente = '79374',                             -- char(10)
                                 @Sucursal = 0,                                  -- int
                                 @Vencimiento = '2018-10-16 20:52:01',           -- smalldatetime
                                 @Importe = 862.0689,                            -- money
                                 @Impuestos = 137.9310,                          -- money
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
--912076	TVE138508	CONCLUIDO
--912077	TVE138509	CONCLUIDO
--913105	TVE138542	CONCLUIDO
--913106	TVE138543	CONCLUIDO
--913107	TVE138544	CONCLUIDO
--913119	TVE138552	CONCLUIDO
/*============================================*/

DECLARE @ID1 INT,
        @MovID1 VARCHAR(MAX),
        @Estatus1 CHAR(15),
        @CFDFlexEstatus1 VARCHAR(15),
        @CFDXml1 VARCHAR(MAX),
        @noCertificado1 VARCHAR(MAX),
        @Sello1 VARCHAR(MAX),
        @SelloSAT1 VARCHAR(MAX),
        @TFDCadenaOriginal1 VARCHAR(MAX),
        @UUID1 VARCHAR(MAX),
        @FechaTimbrado1 VARCHAR(MAX),
        @noCertificadoSAT1 VARCHAR(MAX);
EXEC dbo.Interfaz_CxcInsertar @Empresa = 'TUN',                                                                                                                                         -- char(5)
                              @Mov = 'Cobro VE Gravado',                                                                                                                                -- char(20)
                              @FechaEmision = '2018-10-15 21:03:15',                                                                                                                    -- smalldatetime
                              @Concepto = 'VIAJE ESPECIAL GRAVADO',                                                                                                                     -- varchar(50)
                              @Moneda = 'Pesos',                                                                                                                                        -- char(10)
                              @TipoCambio = 1.0,                                                                                                                                        -- float
                              @Usuario = 'SITTI',                                                                                                                                       -- char(10)
                              @Codigo = 'PRUEBA-00006-COBR',                                                                                                                            -- varchar(30)
                              @Referencia = '002829A-R',                                                                                                                                -- varchar(50)
                              @Cliente = '79374',                                                                                                                                       -- char(10)
                              @Sucursal = 0,                                                                                                                                            -- int
                              @Vencimiento = '2018-10-15 21:03:15',                                                                                                                     -- smalldatetime
                              @Importe = 862.0689,                                                                                                                                      -- money
                              @Impuestos = 137.9310,                                                                                                                                    -- money
                              @CentroDeCostos = 'P1001',                                                                                                                                -- varchar(20)
                              @TipoPago = 'Transferencia',                                                                                                                              -- varchar(50)
                              @CtaDinero = 'BBV-68 ',                                                                                                                                   -- char(10)
                              @Observaciones = NULL,                                                                                                                                    -- varchar(100)
                              @Comentarios = 'Matamoros - Tampico|CROSMT051020181704',                                                                                                  -- varchar(max)
                              @Partidas = '<row><fila Aplica="FACT.VE.GRAVADO" AplicaID="TVE138552" Importe="999.9999" EmisorCtaOrd="BBVA BANCOMER" CtaOrdenante="0110705799"/></row>', -- varchar(max)
                              @ID = @ID1 OUTPUT,                                                                                                                                        -- int
                              @MovID = @MovID1 OUTPUT,                                                                                                                                  -- varchar(max)
                              @Estatus = @Estatus1 OUTPUT,                                                                                                                              -- char(15)
                              @CFDFlexEstatus = @CFDFlexEstatus1 OUTPUT,                                                                                                                -- varchar(15)
                              @CFDXml = @CFDXml1 OUTPUT,                                                                                                                                -- varchar(max)
                              @noCertificado = @noCertificado1 OUTPUT,                                                                                                                  -- varchar(max)
                              @Sello = @Sello1 OUTPUT,                                                                                                                                  -- varchar(max)
                              @SelloSAT = @SelloSAT1 OUTPUT,                                                                                                                            -- varchar(max)
                              @TFDCadenaOriginal = @TFDCadenaOriginal1 OUTPUT,                                                                                                          -- varchar(max)
                              @UUID = @UUID1 OUTPUT,                                                                                                                                    -- varchar(max)
                              @FechaTimbrado = @FechaTimbrado1 OUTPUT,                                                                                                                  -- varchar(max)
                              @noCertificadoSAT = @noCertificadoSAT1 OUTPUT;                                                                                                            -- varchar(max)

SELECT @ID1,
       @MovID1,
       @Estatus1,
       @CFDFlexEstatus1,
       @CFDXml1,
       @noCertificado1,
       @Sello1,
       @SelloSAT1,
       @TFDCadenaOriginal1,
       @UUID1,
       @FechaTimbrado1,
       @noCertificadoSAT1;


/*============================================*/
--Resultado
--426691	TVC1293	CONCLUIDO
--426694	TVC1294	CONCLUIDO
--427758	TVC1298	CONCLUIDO
--427761	TVC1299	CONCLUIDO	CONCLUIDO
--427769	TVC1303	CONCLUIDO
--427771	TVC1304	CONCLUIDO
--427819	TVC1311	CONCLUIDO
/*============================================*/

SELECT Saldo,
       *
FROM dbo.Cxc
WHERE MovID = 'TVE138508';

GO
DECLARE @iError INT,
        @sError VARCHAR(MAX),
        @MovId VARCHAR(20),
        @Estatus VARCHAR(15),
        @Importe MONEY;
EXEC dbo.Interfaz_AnticiposCancelar @IDIntelisis = 427771,       -- int
                                    @MovIdIntelisis = 'TVC1304', -- varchar(20)
                                    @Usuario = 'SITTI',          -- char(10)
                                    @iError = @iError OUTPUT,    -- int
                                    @sError = @sError OUTPUT,    -- varchar(max)
                                    @MovId = @MovId OUTPUT,      -- varchar(20)
                                    @Estatus = @Estatus OUTPUT,  -- varchar(15)
                                    @Importe = @Importe OUTPUT;  -- money

SELECT @iError,
       @sError,
       @MovId,
       @Estatus,
       @Importe;
