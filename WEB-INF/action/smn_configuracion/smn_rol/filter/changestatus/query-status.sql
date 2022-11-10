UPDATE smn_banco.smn_rol
SET rol_estatus = (CASE WHEN (rol_estatus = 'AC') THEN 'IN'
			ELSE 'AC'
 END),
 	rol_idioma='${def:locale}',
	rol_usuario='${def:user}',
	rol_fecha_registro={d '${def:date}'},
	rol_hora='${def:time}'
WHERE smn_rol_id = ${fld:id}