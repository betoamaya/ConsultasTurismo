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
--913126	TVE138554	CONCLUIDO	CONCLUIDO		42C673DB-D11D-4FCB-934D-59D951E9E86A	2018-10-31 08:35:14.000
/*============================================*/

/*204 - El comprobante no se puede cancelar*/
UPDATE dbo.CFD
SET UUID = 'E329DD15-7D0B-44E9-A204-51A7443D1FBE'
WHERE MovID = 'TVE138554';

/*211 - La cancelación está en proceso*/
UPDATE dbo.CFD
SET UUID = 'C5E58106-6C1E-41C9-A211-FB8BAD1CABB0'
WHERE MovID = 'TVE138515';

/*Aplicando Nota de Cargo para Cancelar la Factura*/
EXEC dbo.Interfaz_CxcInsertar @Empresa = 'TUN',                                                                                      -- char(5)
                              @Mov = 'CANCELACION TURISMO',                                                                          -- char(20)
                              @FechaEmision = '2018-10-26T00:00:00',                                                                 -- smalldatetime
                              @Concepto = 'CANC. INGRESO T.IND. 15%',                                                                -- varchar(50)
                              @Moneda = 'Pesos',                                                                                     -- char(10)
                              @TipoCambio = 1.0,                                                                                     -- float
                              @Usuario = 'SITTI',                                                                                    -- char(10)
                              @Codigo = 'Prueba-00002-NOTAR',                                                                        -- varchar(30)
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
                              @Partidas = '<row><fila Aplica="Factura TranspInd" AplicaID="TVE138554" Importe="999.9999" /></row>'; -- varchar(max)

--Importe de aplicación no valido. El importe de aplicación indicado es menor al importe del movimiento. Por favor, indique un Concepto valido para esta combinación de movimiento y usuario.

--Resultado
/*============================================*/
--ID		MovID		Estatus		CFDFlexEstatus	
---------------------------------------------------
--427878	178			CONCLUIDO	NULL
--427880	179			CONCLUIDO	NULL
/*============================================*/
