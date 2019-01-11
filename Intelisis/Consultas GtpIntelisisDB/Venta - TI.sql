/***Generar Facturas de Transporte Industrial***/
EXEC dbo.Interfaz_VentasInsertar @Empresa = 'TUN',                      -- char(5)
                                 @Mov = 'Factura TranspInd',            -- char(20)
                                 @FechaEmision = '2019-01-07 13:12:00', -- smalldatetime
                                 @Concepto = 'T.INDUSTRIAL 8%',         -- varchar(50)
                                 @Moneda = 'Pesos',                     -- char(10)
                                 @TipoCambio = 1.0,                     -- float
                                 @Usuario = 'SITTI',                    -- char(10)
                                 @Referencia = ' - ',                   -- varchar(50)
                                 @Codigo = 'PRUEBA-00050-CRED',         -- varchar(30)
                                 @Cliente = '35821',                    -- char(10)
                                 @Sucursal = 0,                         -- int
                                 @Vencimiento = '2019-01-08 15:27:39',  -- smalldatetime
                                 @Importe = 900.00,                     -- money
                                 @Impuestos = 72.00,                    -- money
                                 @CentroDeCostos = 'P1001',             -- varchar(20)
                                 @TipoPago = 'NO IDENTIFICADO',         -- varchar(50)
                                 @Observaciones = NULL,                 -- varchar(100)
                                 @Comentarios = NULL,                   -- varchar(max)
                                 @PartidasVtas = NULL,                  -- varchar(max)
                                 @MovRelacionados = NULL;

--1113393 | Error de produccion |PRUEBA-00048-CRED
SELECT * FROM dbo.Venta AS v WHERE v.ID in (913194, 913195, 913198, 913197, 913206, 913209)
SELECT * FROM dbo.VentaD AS vd WHERE vd.ID IN (913194, 913195, 913198, 913197, 913206, 913209)

--Retorno SPAfectar: 71650 <IntelisisCFDI><Error></Error><Descripcion>El CFDI no tiene una estructura XML correcta. Folio: 138617. Serie: TVE. El comprobante debe tener al menos un concepto. </Descripcion></IntelisisCFDI >

EXEC dbo.Interfaz_VentasInsertar @Empresa = 'TUN',                      -- char(5)
                                 @Mov = 'Factura TranspInd',            -- char(20)
                                 @FechaEmision = '2019-01-03 13:12:00', -- smalldatetime
                                 @Concepto = 'T.INDUSTRIAL 15%',         -- varchar(50)
                                 @Moneda = 'Pesos',                     -- char(10)
                                 @TipoCambio = 1.0,                     -- float
                                 @Usuario = 'SITTI',                    -- char(10)
                                 @Referencia = ' - ',                   -- varchar(50)
                                 @Codigo = 'PRUEBA-00051-CRED',         -- varchar(30)
                                 @Cliente = '35821',                    -- char(10)
                                 @Sucursal = 0,                         -- int
                                 @Vencimiento = '2019-01-04 15:27:39',  -- smalldatetime
                                 @Importe = 862.0689,                     -- money
                                 @Impuestos = 137.9311,                    -- money
                                 @CentroDeCostos = 'P1001',             -- varchar(20)
                                 @TipoPago = 'NO IDENTIFICADO',         -- varchar(50)
                                 @Observaciones = NULL,                 -- varchar(100)
                                 @Comentarios = NULL,                   -- varchar(max)
                                 @PartidasVtas = NULL,                  -- varchar(max)
                                 @MovRelacionados = NULL;

								 --913197	TVE138616
								 --913207	TVE138629	CONCLUIDO	CONCLUIDO
								 --913208	TVE138630	CONCLUIDO	CONCLUIDO
