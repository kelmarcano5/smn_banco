UPDATE smn_banco.smn_linea_credito
SET lcr_estatus = (CASE WHEN (lcr_estatus = 'AC') THEN 'IN'
			ELSE 'AC'
 END),
 	lcr_idioma='${def:locale}', 
	lcr_usuario='${def:user}',
	lcr_fecha_registro={d '${def:date}'},
	lcr_hora='${def:time}'
WHERE smn_linea_credito_id = ${fld:id}