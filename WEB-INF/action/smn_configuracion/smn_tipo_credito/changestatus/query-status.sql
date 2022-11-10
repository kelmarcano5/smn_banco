UPDATE smn_banco.smn_tipo_credito
SET tcr_estatus = (CASE WHEN (tcr_estatus = 'AC') THEN 'IN'
			ELSE 'AC'
 END),
 	tcr_idioma='${def:locale}',
	tcr_usuario='${def:user}',
	tcr_fecha_registro={d '${def:date}'},
	tcr_hora='${def:time}'
WHERE smn_tipo_credito_id = ${fld:id}