UPDATE smn_banco.smn_concepto SET
	con_codigo=${fld:con_codigo},
	con_descripcion=${fld:con_descripcion},
	con_tabla=${fld:con_tabla},
	con_campo=${fld:con_campo},
	con_estatus=${fld:con_estatus},
	con_vigencia=${fld:con_vigencia},
	con_idioma='${def:locale}',
	con_usuario='${def:user}',
	con_fecha_registro={d '${def:date}'},
	con_hora='${def:time}'

WHERE
	smn_concepto_id=${fld:id}

	
	