/***Generar Facturas de Transporte Industrial***/
EXEC dbo.Interfaz_VentasInsertar @Empresa = 'TUN',                      -- char(5)
                                 @Mov = 'Factura TranspInd',            -- char(20)
                                 @FechaEmision = '2018-01-03 13:12:00', -- smalldatetime
                                 @Concepto = 'T.INDUSTRIAL 8%',         -- varchar(50)
                                 @Moneda = 'Pesos',                     -- char(10)
                                 @TipoCambio = 1.0,                     -- float
                                 @Usuario = 'SITTI',                    -- char(10)
                                 @Referencia = ' - ',                   -- varchar(50)
                                 @Codigo = 'PRUEBA-00040-CRED',         -- varchar(30)
                                 @Cliente = '35821',                    -- char(10)
                                 @Sucursal = 0,                         -- int
                                 @Vencimiento = '2019-01-04 15:27:39',  -- smalldatetime
                                 @Importe = 900.00,                     -- money
                                 @Impuestos = 72.00,                    -- money
                                 @CentroDeCostos = 'P1001',             -- varchar(20)
                                 @TipoPago = 'NO IDENTIFICADO',         -- varchar(50)
                                 @Observaciones = NULL,                 -- varchar(100)
                                 @Comentarios = NULL,                   -- varchar(max)
                                 @PartidasVtas = NULL,                  -- varchar(max)
                                 @MovRelacionados = NULL;

SELECT * FROM dbo.Venta AS v WHERE v.ID = 913194
SELECT * FROM dbo.VentaD AS vd WHERE vd.ID = 913194