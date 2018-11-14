/*Factura de Credito*/
EXEC dbo.Interfaz_VentasInsertar @Empresa = 'TUN',                      -- char(5)
                                 @Mov = 'CFDI SIN VIAJE GRAV',            -- char(20)
                                 @FechaEmision = '2018-11-13T16:07:00', -- smalldatetime
                                 @Concepto = 'VIAJE ESPECIAL GRAVADO',        -- varchar(50)
                                 @Moneda = 'Pesos',                     -- char(10)
                                 @TipoCambio = 1.0,                     -- float
                                 @Usuario = 'SITTI',                    -- char(10)
                                 @Referencia = ' - ',                   -- varchar(50)
                                 @Codigo = 'Prueba-00019-CRED',         -- varchar(30)
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
--913155	TVE138586	CONCLUIDO	CONCLUIDO		99CFA5FD-BB7C-43B7-BA76-1CF5B41D67DC	2018-11-06 11:59:58.000
--913156	TVE138587	CONCLUIDO	CONCLUIDO		4198207E-40A3-4C2B-AE33-DCC0044CF75F	2018-11-06 12:20:21.000
--913158	TVE138590	CONCLUIDO	CONCLUIDO		7CCAB00F-5D1D-4E1A-AE5A-9A888E30977C	2018-11-08 09:10:19.000
--913168	TVE138602	CONCLUIDO	CONCLUIDO		592BCEDF-6C4B-4ABE-99F1-21F1A434C844	2018-11-13 17:56:27.000
/*============================================*/

GO
/*204 - El comprobante no se puede cancelar*/
UPDATE dbo.CFD
SET UUID = 'E329DD15-7D0B-44E9-A204-51A7443D1FBE'
WHERE MovID = 'TVE138582';

/*211 - La cancelación está en proceso*/
UPDATE dbo.CFD
SET UUID = 'C5E58106-6C1E-41C9-A211-FB8BAD1CABB0'
WHERE MovID = 'TVE138590';

/*OK*/
UPDATE dbo.CFD
SET UUID = '4198207E-40A3-4C2B-AE33-DCC0044CF75F'
WHERE MovID = 'TVE138587';

GO

/*Aplicando Nota de Cargo para disminuir el saldo REALIZANDO la cancelacion del cfdi*/
EXEC dbo.Interfaz_CxcInsertar @Empresa = 'TUN',                                                                                     -- char(5)
                              @Mov = 'CANCELACION TURISMO',                                                                         -- char(20)
                              @FechaEmision = '2018-11-13T00:00:00',                                                                -- smalldatetime
                              @Concepto = 'CANCELACION VE GRAVADO',                                                               -- varchar(50)
                              @Moneda = 'Pesos',                                                                                    -- char(10)
                              @TipoCambio = 1.0,                                                                                    -- float
                              @Usuario = 'SITTI',                                                                                   -- char(10)
                              @Codigo = 'Prueba-00010-NOTAR',                                                                       -- varchar(30)
                              @Referencia = 'BONIFICACIÓN A CONVENIO 000877G-R',                                                    -- varchar(50)
                              @Cliente = '8365',                                                                                    -- char(10)
                              @Sucursal = 1,                                                                                        -- int
                              @Vencimiento = '2018-11-13T00:00:00',                                                                 -- smalldatetime
                              @Importe = 862.0689,                                                                                  -- money
                              @Impuestos = 137.9310,                                                                                -- money
                              @CentroDeCostos = 'P1101',                                                                            -- varchar(20)
                              @TipoPago = 'NO IDENTIFICADO',                                                                        -- varchar(50)
                              @CtaDinero = '',                                                                                      -- char(10)
                              @Observaciones = '',                                                                                  -- varchar(100)
                              @Comentarios = '',                                                                                    -- varchar(max)
                              @Partidas = '<row><fila Aplica="CFDI SIN VIAJE GRAV" AplicaID="TVE138602" Importe="999.9999" /></row>'; -- varchar(max)
--Resultado
/*============================================*/
--ID		MovID		Estatus		CFDFlexEstatus	
---------------------------------------------------
--427923	180			CONCLUIDO	NULL
--427933	NULL		SINAFECTAR	<Cancelacion><Fila CodigoError="211" DescrError="La cancelación está en proceso."/></Cancelacion>
--427933	182			CONCLUIDO	NULL

--427950	NULL	SINAFECTAR	<Cancelacion><Fila CodigoError="211" DescError="La cancelación está en proceso."/></Cancelacion>
--427950	NULL	SINAFECTAR	<Cancelacion><Fila CodigoError="213" DescError="La solicitud de cancelación fue rechazada por el receptor."/></Cancelacion>

--427984	186	CONCLUIDO
/*============================================*/



