UPDATE smn_banco.smn_tipo_documento
SET tdo_estatus = (CASE WHEN (tdo_estatus = 'AC') THEN 'IN'
			ELSE 'AC'
 END),
 	tdo_idioma='${def:locale}',
	tdo_usuario='${def:user}',
	tdo_fecha_registro={d '${def:date}'},
	tdo_hora='${def:time}'
WHERE smn_tipo_documento_id = ${fld:id}