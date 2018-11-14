SELECT v.Mov,
       v.MovID,
       v.FechaEmision,
       v.Importe + v.Impuestos AS Saldo,
       v.Referencia,
       v.Cliente,
       v.EnviarA AS 'Sucursal'
FROM dbo.Venta AS v
WHERE v.MovID = 'TVE144844';

SELECT c.Saldo,
		c.Mov,
       c.MovID,
       c.FechaEmision,
       c.Importe + c.Impuestos AS Saldo,
       c.Referencia,
	   c.Estatus,
       c.Cliente,
       c.ClienteEnviarA AS 'Sucursal'
FROM dbo.Cxc AS c 
WHERE c.MovID = 'TVE144844';


---CFDI SIN VIAJE GRAV 	TVE144844	2018-10-31 00:00:00.000	18038.00	001600E-R	27048     	26

EXEC dbo.Interfaz_CxcInsertar @Empresa = 'TUN',                                                                                       -- char(5)
                              @Mov = 'CANCELACION TURISMO',                                                                           -- char(20)
                              @FechaEmision = '2018-11-14T00:00:00',                                                                  -- smalldatetime
                              @Concepto = 'CANCELACION VE GRAVADO',                                                                   -- varchar(50)
                              @Moneda = 'Pesos',                                                                                      -- char(10)
                              @TipoCambio = 1.0,                                                                                      -- float
                              @Usuario = 'SITTI',                                                                                     -- char(10)
                              @Codigo = 'Solicitud-00001-Erika',                                                                      -- varchar(30)
                              @Referencia = 'BONIFICACIÓN A CONVENIO 001600E-R',                                                      -- varchar(50)
                              @Cliente = '27048',                                                                                     -- char(10)
                              @Sucursal = 26,                                                                                         -- int
                              @Vencimiento = '2018-11-14T00:00:00',                                                                   -- smalldatetime
                              @Importe = 15550.00,                                                                                    -- money
                              @Impuestos = 2488.00,                                                                                   -- money
                              @CentroDeCostos = 'P1012',                                                                              -- varchar(20)
                              @TipoPago = 'NO IDENTIFICADO',                                                                          -- varchar(50)
                              @CtaDinero = '',                                                                                        -- char(10)
                              @Observaciones = '',                                                                                    -- varchar(100)
                              @Comentarios = '',                                                                                      -- varchar(max)
                              @Partidas = '<row><fila Aplica="CFDI SIN VIAJE GRAV" AplicaID="TVE144844" Importe="18038.00" /></row>'; -- varchar(max)