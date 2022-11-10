UPDATE smn_banco.smn_concepto
SET con_estatus = (CASE WHEN (con_estatus = 'AC') THEN 'IN'
			ELSE 'AC'
 END),
 	con_idioma='${def:locale}',
	con_usuario='${def:user}',
	con_fecha_registro={d '${def:date}'},
	con_hora='${def:time}'
WHERE smn_concepto_id = ${fld:id}