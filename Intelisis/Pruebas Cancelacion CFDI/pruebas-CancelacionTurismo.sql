/*Factura de Credito*/
EXEC dbo.Interfaz_VentasInsertar @Empresa = 'TUN',                      -- char(5)
                                 @Mov = 'Factura TranspInd',            -- char(20)
                                 @FechaEmision = '2018-10-30T16:07:00', -- smalldatetime
                                 @Concepto = 'T.INDUSTRIAL 15%',        -- varchar(50)
                                 @Moneda = 'Pesos',                     -- char(10)
                                 @TipoCambio = 1.0,                     -- float
                                 @Usuario = 'SITTI',                    -- char(10)
                                 @Referencia = ' - ',                   -- varchar(50)
                                 @Codigo = 'Prueba-00011-CRED',         -- varchar(30)
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
--913125	TVE138553	CONCLUIDO	CONCLUIDO		83BC4C23-6995-4547-AEB5-5720C10330B9	2018-10-31 08:17:31.000
/*============================================*/

/*Aplicando Nota de Cargo para Cancelar la Factura*/
EXEC dbo.Interfaz_CxcInsertar @Empresa = 'TUN',                                                                                      -- char(5)
                              @Mov = 'CANCELACION TURISMO',                                                                          -- char(20)
                              @FechaEmision = '2018-10-26T00:00:00',                                                                 -- smalldatetime
                              @Concepto = 'CANC. INGRESO T.IND. 15%',                                                                -- varchar(50)
                              @Moneda = 'Pesos',                                                                                     -- char(10)
                              @TipoCambio = 1.0,                                                                                     -- float
                              @Usuario = 'SITTI',                                                                                    -- char(10)
                              @Codigo = 'Prueba-00001-NOTAR',                                                                        -- varchar(30)
                              @Referencia = 'BONIFICACIÓN A CONVENIO 000877G-R',                                                     -- varchar(50)
                              @Cliente = '8365',                                                                                     -- char(10)
                              @Sucursal = 1,                                                                                         -- int
                              @Vencimiento = '2018-10-26T00:00:00',                                                                  -- smalldatetime
                              @Importe = 862.0689,                                                                                   -- money
                              @Impuestos = 137.9310,                                                                                 -- money
                              @CentroDeCostos = 'P1101',                                                                             -- varchar(20)
                              @TipoPago = 'NO IDENTIFICADO',                                                                         -- varchar(50)
                              @CtaDinero = '',                                                                                       -- char(10)
                              @Observaciones = '',                                                                                   -- varchar(100)
                              @Comentarios = '',                                                                                     -- varchar(max)
                              @Partidas = '<row><fila Aplica="Factura TranspInd" AplicaID="TVE138553" Importe="999.9999" /></row>'; -- varchar(max)

--Importe de aplicación no valido. El importe de aplicación indicado es menor al importe del movimiento. Por favor, indique un Concepto valido para esta combinación de movimiento y usuario.

--Resultado
/*============================================*/
--ID		MovID		Estatus		CFDFlexEstatus	
---------------------------------------------------
--427878	178			CONCLUIDO	
/*============================================*/
