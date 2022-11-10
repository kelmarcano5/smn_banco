UPDATE smn_banco.smn_credito SET
	smn_linea_credito_id=${fld:smn_linea_credito_id},
	smn_documento_id=${fld:smn_documento_id},
	cre_numero_documento=${fld:cre_numero_documento},
	cre_tipo_credito_id=${fld:cre_tipo_credito_id},
	cre_fecha_solicitud=${fld:cre_fecha_solicitud},
	cre_fecha_esperada_aprobacion=${fld:cre_fecha_esperada_aprobacion},
	cre_fecha_otorgamiento=${fld:cre_fecha_otorgamiento},
	cre_fecha_primera_cuota=${fld:cre_fecha_primera_cuota},
	cre_fecha_ultima_cuota=${fld:cre_fecha_ultima_cuota},
	cre_tasa_interes=${fld:cre_tasa_interes},
	cre_meses_credito=${fld:cre_meses_credito},
	cre_cantidad_cuotas=${fld:cre_cantidad_cuotas},
	cre_monto_solicitado_ml=${fld:cre_monto_solicitado_ml},
	cre_monto_credito_ml=${fld:cre_monto_credito_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	cre_monto_intereses_ml=${fld:cre_monto_intereses_ml},
	cre_monto_comision_ml=${fld:cre_monto_comision_ml},
	cre_monto_solicitado_ma=${fld:cre_monto_solicitado_ma},
	cre_monto_credito_ma=${fld:cre_monto_credito_ma},
	cre_monto_intereses_ma=${fld:cre_monto_intereses_ma},
	cre_monto_comision_ma=${fld:cre_monto_comision_ma},
	cre_estatus_financiero=${fld:cre_estatus_financiero},
	cre_estatus_proceso=${fld:cre_estatus_proceso},
	cre_idioma='${def:locale}',
	cre_usuario='${def:user}',
	cre_fecha_registro={d '${def:date}'},
	cre_hora='${def:time}'

WHERE
	smn_credito_id=${fld:id}

