/*Factura de Credito*/
EXEC dbo.Interfaz_VentasInsertar @Empresa = 'TUN',                      -- char(5)
                                 @Mov = 'Factura TranspInd',            -- char(20)
                                 @FechaEmision = '2018-10-30T16:07:00', -- smalldatetime
                                 @Concepto = 'T.INDUSTRIAL 15%',        -- varchar(50)
                                 @Moneda = 'Pesos',                     -- char(10)
                                 @TipoCambio = 1.0,                     -- float
                                 @Usuario = 'SITTI',                    -- char(10)
                                 @Referencia = ' - ',                   -- varchar(50)
                                 @Codigo = 'Prueba-00012-CRED',         -- varchar(30)
                                 @Cliente = '8365',                     -- char(10)
                                 @Sucursal = 1,                         -- int
                                 @Vencimiento = '2018-12-29T16:07:00',  -- smalldatetime
                                 @Importe = 862.0689,                   -- money
                                 @Impuestos = 137.9310,                 -- money
                                 @CentroDeCostos = 'P1012',             -- varchar(20)
                                 @TipoPago = 'NO IDENTIFICADO',         -- varchar(50)
                                 @Observaciones = '',                   -- varchar(100)
                                 @Comentarios = ' - ',                  -- varchar(max)
                                 @PartidasVtas = '',                    -- varchar(max)
                                 @MovRelacionados = '';                 -- varchar(max)
--Resultado
/*============================================*/
--ID		MovID		Estatus		CFDFlexEstatus	UUID									FechaTimbrado
-----------------------------------------------------------------------------------------------------------------------
--913127	TVE138555	CONCLUIDO	CONCLUIDO		BFEEDC84-24AA-4FB8-82BF-15912FF5B98A	2018-10-31 09:06:49.000
/*============================================*/


/*Aplicando Nota de Cargo para disminuir el saldo sin solictar la cancelacion del cfdi*/
EXEC dbo.Interfaz_CxcInsertar @Empresa = 'TUN',                                                                                     -- char(5)
                              @Mov = 'REF CANCELACION TUR',                                                                         -- char(20)
                              @FechaEmision = '2018-10-26T00:00:00',                                                                -- smalldatetime
                              @Concepto = 'CANC. INGRESO T.IND. 15%',                                                               -- varchar(50)
                              @Moneda = 'Pesos',                                                                                    -- char(10)
                              @TipoCambio = 1.0,                                                                                    -- float
                              @Usuario = 'SITTI',                                                                                   -- char(10)
                              @Codigo = 'Prueba-00003-NOTAR',                                                                       -- varchar(30)
                              @Referencia = 'BONIFICACIÓN A CONVENIO 000877G-R',                                                    -- varchar(50)
                              @Cliente = '8365',                                                                                    -- char(10)
                              @Sucursal = 1,                                                                                        -- int
                              @Vencimiento = '2018-10-26T00:00:00',                                                                 -- smalldatetime
                              @Importe = 862.0689,                                                                                  -- money
                              @Impuestos = 137.9310,                                                                                -- money
                              @CentroDeCostos = 'P1101',                                                                            -- varchar(20)
                              @TipoPago = 'NO IDENTIFICADO',                                                                        -- varchar(50)
                              @CtaDinero = '',                                                                                      -- char(10)
                              @Observaciones = '',                                                                                  -- varchar(100)
                              @Comentarios = '',                                                                                    -- varchar(max)
                              @Partidas = '<row><fila Aplica="Factura TranspInd" AplicaID="TVE138555" Importe="999.9999" /></row>'; -- varchar(max)
--Resultado
/*============================================*/
--ID		MovID		Estatus		CFDFlexEstatus	
---------------------------------------------------
--427882	1			CONCLUIDO	NULL
/*============================================*/

/*Nueva Factura*/

EXEC dbo.Interfaz_VentasInsertar @Empresa = 'TUN',                                     -- char(5)
                                 @Mov = 'Factura TranspInd',                           -- char(20)
                                 @FechaEmision = '2018-10-30T16:07:00',                -- smalldatetime
                                 @Concepto = 'T.INDUSTRIAL 15%',                       -- varchar(50)
                                 @Moneda = 'Pesos',                                    -- char(10)
                                 @TipoCambio = 1.0,                                    -- float
                                 @Usuario = 'SITTI',                                   -- char(10)
                                 @Referencia = ' - ',                                  -- varchar(50)
                                 @Codigo = 'Prueba-00013-CRED',                        -- varchar(30)
                                 @Cliente = '8365',                                    -- char(10)
                                 @Sucursal = 1,                                        -- int
                                 @Vencimiento = '2018-12-29T16:07:00',                 -- smalldatetime
                                 @Importe = 800,                                       -- money
                                 @Impuestos = 128,                                     -- money
                                 @CentroDeCostos = 'P1012',                            -- varchar(20)
                                 @TipoPago = 'NO IDENTIFICADO',                        -- varchar(50)
                                 @Observaciones = '',                                  -- varchar(100)
                                 @Comentarios = ' - ',                                 -- varchar(max)
                                 @PartidasVtas = '',                                   -- varchar(max)
                                 @MovRelacionados = '<row><fila ID="913127" /></row>'; -- varchar(max)
--Resultado
/*============================================*/
--ID		MovID		Estatus		CFDFlexEstatus	UUID									FechaTimbrado
-----------------------------------------------------------------------------------------------------------------------
--913128	TVE138556	CONCLUIDO	CONCLUIDO		8221463A-D429-403E-8560-F2F03C34549F	2018-10-31 09:47:28.000
/*============================================*/
