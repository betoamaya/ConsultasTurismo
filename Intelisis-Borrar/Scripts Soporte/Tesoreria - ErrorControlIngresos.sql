/*Buscando los parametros del error en log*/

SELECT *
FROM dbo.Interfaz_Logs AS il
WHERE il.SP = 'Interfaz_tesoreriaDepositarDetalle'
ORDER BY il.Fecha DESC;

/*Parametros
<Parametros>
  <Empresa>TUN  </Empresa>
  <FechaDeCorte>2018-10-31T00:00:00</FechaDeCorte>
  <Concepto>VIAJES ESPECIALES</Concepto>
  <Moneda>Pesos     </Moneda>
  <TipoCambio>1.000000000000000e+000</TipoCambio>
  <Usuario>SITTI     </Usuario>
  <Referencia>1810310P13010196</Referencia>
  <CtaDinero>BBV-67    </CtaDinero>
  <Importe>7650.0000</Importe>
  <CentroDeCostos>P1301     </CentroDeCostos>
  <Observaciones># Bolsa :</Observaciones>
  <Comentarios>Corte registrado el: martes, 6 de noviembre de 2018 a las 05:51:23 p. m.</Comentarios>
  <Partidas><row><fila IdIntelisis="464508" MovID="1611"/></row></Partidas>
</Parametros>
*/

--Error al aplicar el movimiento de depósito de Intelisis: Error30230, Mensaje = 
/*Buscar mensaje de error*/

SELECT *
FROM dbo.MensajeLista AS ml
WHERE ml.Mensaje = '30230';

/*30230	No corresponde la aplicación con el importe del Movimiento	ERROR	0*/

/*Revisando el saldo que genero esa factura*/

SELECT c.Importe + c.Impuestos,
       *
FROM dbo.Cxc AS c
WHERE c.ID = 464508;

--7650.00	464508	TUN  	Cobro Otros Ingresos	1611

SELECT din.ID,
       din.MovID,
       din.Saldo,
       din.Observaciones,
       din.Referencia,
       din.Cliente,
       din.Estatus
FROM dbo.MovFlujo mf
    INNER JOIN dbo.Dinero din
        ON mf.DID = din.ID
WHERE mf.DModulo = 'DIN'
      AND mf.OModulo IN ( 'CXC', 'VTAS' )
      AND mf.OID = 464508
      AND mf.OMovID = '1611';
--Resultado
--===========================================================================
--ID		MovID	Saldo	Observaciones	Referencia	Cliente	Estatus
--1674208	1543599	NULL	NULL			GPO KIA		NULL	CONCLUIDO
--===========================================================================

/* Buscar si fue concluido por la interfaz*/
SELECT *
FROM dbo.Interfaz_Logs AS il
WHERE il.SP = 'Interfaz_tesoreriaDepositarDetalle'
      AND CAST(il.Parametros AS VARCHAR(MAX)) LIKE '%1810310P13010196%'
      AND il.Fecha
      BETWEEN GETDATE() - 2 AND GETDATE()
ORDER BY il.Fecha DESC;

/******NO FUE CONCUIDA POR INTERFAZ***********/

SELECT d.ID, d.Mov, d.MovID, d.FechaEmision, d.Estatus, d.Importe, d.Impuestos, d.Usuario, d.OrigenTipo, d.Origen, d.OrigenID FROM dbo.Dinero AS d WHERE d.Mov = 'Deposito' AND d.MovID = '1369055'

/*
====================================================================================================================================
ID		Mov			MovID	FechaEmision			Estatus		Importe	Impuestos	Usuario	OrigenTipo	Origen				OrigenID
1674212	Deposito    1369055	2018-10-31 00:00:00.000	CONCLUIDO	7650.00	0.00		JPADRON	DIN			Solicitud Deposito	1543599
====================================================================================================================================
*/