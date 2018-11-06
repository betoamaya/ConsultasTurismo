/*Factura de Credito*/
EXEC dbo.Interfaz_VentasInsertar @Empresa = 'TUN',                      -- char(5)
                                 @Mov = 'Factura TranspInd',            -- char(20)
                                 @FechaEmision = '2018-11-06T16:07:00', -- smalldatetime
                                 @Concepto = 'T.INDUSTRIAL 15%',        -- varchar(50)
                                 @Moneda = 'Pesos',                     -- char(10)
                                 @TipoCambio = 1.0,                     -- float
                                 @Usuario = 'SITTI',                    -- char(10)
                                 @Referencia = ' - ',                   -- varchar(50)
                                 @Codigo = 'Prueba-00015-CRED',         -- varchar(30)
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
--913154	TVE138585	CONCLUIDO	CONCLUIDO		8702B0EC-522C-4F14-BF54-E208C684E881	2018-11-06 10:02:20.000
/*============================================*/

/*204 - El comprobante no se puede cancelar*/
UPDATE dbo.CFD
SET UUID = 'E329DD15-7D0B-44E9-A204-51A7443D1FBE'
WHERE MovID = 'TVE138585';

/*211 - La cancelación está en proceso*/
UPDATE dbo.CFD
SET UUID = 'C5E58106-6C1E-41C9-A211-FB8BAD1CABB0'
WHERE MovID = 'TVE138515';

/*OK*/
UPDATE dbo.CFD
SET UUID = '434CC1AD-DD62-47AE-90D4-37FC9EA54F46'
WHERE MovID = 'TVE138515';

GO

/* C A N C E L A C I O N     C F D I */
DECLARE @Ok INT,
        @OkRef VARCHAR(255),
        @EstatusCancelacion VARCHAR(10);
EXEC dbo.spCFDCancelacionEstatus @Empresa = 'TUN',                                    -- varchar(5)
                                 @Modulo = 'VTAS',                                     -- varchar(5)
                                 @ModuloID = 913154,                                    -- int
                                 @Ok = @Ok OUTPUT,                                 -- int
                                 @OkRef = @OkRef OUTPUT,                           -- varchar(255)
                                 @EstatusCancelacion = @EstatusCancelacion OUTPUT; -- varchar(10)

SELECT @Ok,
       @OkRef,
       @EstatusCancelacion;

--Resultado
/*============================================*/
--@Ok		@OkRef								@EstatusCancelacion
-----------------------------------------------------------------------------------------------------------------------
--204		El CFDI no aplica para cancelación.	204
/*============================================*/

EXEC dbo.Interfaz_CxcInsertar @Empresa = 'TUN',                                                                                     -- char(5)
                              @Mov = 'CANCELACION TURISMO',                                                                         -- char(20)
                              @FechaEmision = '2018-11-06T00:00:00',                                                                -- smalldatetime
                              @Concepto = 'CANC. INGRESO T.IND. 15%',                                                               -- varchar(50)
                              @Moneda = 'Pesos',                                                                                    -- char(10)
                              @TipoCambio = 1.0,                                                                                    -- float
                              @Usuario = 'SITTI',                                                                                   -- char(10)
                              @Codigo = 'Prueba-00006-NOTAR',                                                                       -- varchar(30)
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
                              @Partidas = '<row><fila Aplica="Factura TranspInd" AplicaID="TVE138585" Importe="999.9999" /></row>'; -- varchar(max)

/*============================================*/
--ID		MovID		Estatus		CFDFlexEstatus	
---------------------------------------------------
--427931	181			CONCLUIDO
/*============================================*/