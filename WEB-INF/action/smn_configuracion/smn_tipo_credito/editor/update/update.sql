UPDATE smn_banco.smn_tipo_credito SET
	tcr_codigo=${fld:tcr_codigo},
	tcr_descripcion=${fld:tcr_descripcion},
	tcr_metodo_calculo=${fld:tcr_metodo_calculo},
	tcr_estatus=${fld:tcr_estatus},
	tcr_vigencia=${fld:tcr_vigencia},
	tcr_idioma='${def:locale }',
	tcr_usuario='${def:user}',
	tcr_fecha_registro={d '${def:date}'},
	tcr_hora='${def:time}'

WHERE
	smn_tipo_credito_id=${fld:id}

