/*Factura de Credito*/
EXEC dbo.Interfaz_VentasInsertar @Empresa = 'TUN',                      -- char(5)
                                 @Mov = 'Factura TranspInd',            -- char(20)
                                 @FechaEmision = '2018-11-06T16:07:00', -- smalldatetime
                                 @Concepto = 'T.INDUSTRIAL 15%',        -- varchar(50)
                                 @Moneda = 'Pesos',                     -- char(10)
                                 @TipoCambio = 1.0,                     -- float
                                 @Usuario = 'SITTI',                    -- char(10)
                                 @Referencia = ' - ',                   -- varchar(50)
                                 @Codigo = 'Prueba-00014-CRED',         -- varchar(30)
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
--913153	TVE138582	CONCLUIDO	CONCLUIDO		5E2396ED-1FB8-4546-8C67-134969060248	2018-11-06 08:46:05.000
/*============================================*/

GO
/*204 - El comprobante no se puede cancelar*/
UPDATE dbo.CFD
SET UUID = 'E329DD15-7D0B-44E9-A204-51A7443D1FBE'
WHERE MovID = 'TVE138582';

/*211 - La cancelación está en proceso*/
UPDATE dbo.CFD
SET UUID = 'C5E58106-6C1E-41C9-A211-FB8BAD1CABB0'
WHERE MovID = 'TVE138515';

/*OK*/
UPDATE dbo.CFD
SET UUID = '434CC1AD-DD62-47AE-90D4-37FC9EA54F46'
WHERE MovID = 'TVE138515';

GO

/*Aplicando Nota de Cargo para disminuir el saldo REALIZANDO la cancelacion del cfdi*/
EXEC dbo.Interfaz_CxcInsertar @Empresa = 'TUN',                                                                                     -- char(5)
                              @Mov = 'CANCELACION TURISMO',                                                                         -- char(20)
                              @FechaEmision = '2018-11-06T00:00:00',                                                                -- smalldatetime
                              @Concepto = 'CANC. INGRESO T.IND. 15%',                                                               -- varchar(50)
                              @Moneda = 'Pesos',                                                                                    -- char(10)
                              @TipoCambio = 1.0,                                                                                    -- float
                              @Usuario = 'SITTI',                                                                                   -- char(10)
                              @Codigo = 'Prueba-00005-NOTAR',                                                                       -- varchar(30)
                              @Referencia = 'BONIFICACIÓN A CONVENIO 000877G-R',                                                    -- varchar(50)
                              @Cliente = '8365',                                                                                    -- char(10)
                              @Sucursal = 1,                                                                                        -- int
                              @Vencimiento = '2018-11-06T00:00:00',                                                                 -- smalldatetime
                              @Importe = 862.0689,                                                                                  -- money
                              @Impuestos = 137.9310,                                                                                -- money
                              @CentroDeCostos = 'P1101',                                                                            -- varchar(20)
                              @TipoPago = 'NO IDENTIFICADO',                                                                        -- varchar(50)
                              @CtaDinero = '',                                                                                      -- char(10)
                              @Observaciones = '',                                                                                  -- varchar(100)
                              @Comentarios = '',                                                                                    -- varchar(max)
                              @Partidas = '<row><fila Aplica="Factura TranspInd" AplicaID="TVE138582" Importe="999.9999" /></row>'; -- varchar(max)
--Resultado
/*============================================*/
--ID		MovID		Estatus		CFDFlexEstatus	
---------------------------------------------------
--427923	180			CONCLUIDO	NULL
/*============================================*/
