UPDATE smn_banco.smn_tipo_documento SET
	tdo_codigo=${fld:tdo_codigo},
	tdo_descripcion=${fld:tdo_descripcion},
	tdo_estatus=${fld:tdo_estatus},
	tdo_vigencia=${fld:tdo_vigencia},
	tdo_idioma='${def:locale}',
	tdo_usuario='${def:user}',
	tdo_fecha_registro={d '${def:date}'},
	tdo_hora='${def:time}'

WHERE
	smn_tipo_documento_id=${fld:id}

