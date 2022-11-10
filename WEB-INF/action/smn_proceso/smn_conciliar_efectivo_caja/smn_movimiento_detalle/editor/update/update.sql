UPDATE smn_banco.smn_movimiento_detalle  SET
	smn_movimiento_bancario_id=${fld:smn_movimiento_bancario_id},
	smn_concepto_id=${fld:smn_concepto_id},
	dmo_tipo_movimiento=${fld:dmo_tipo_movimiento},
	dmo_monto_ml=${fld:dmo_monto_ml},
	smn_tasa_rf=${fld:smn_tasa_rf},
	smn_moneda_rf=${fld:smn_moneda_rf},
	dmo_monto_ma=${fld:dmo_monto_ma},
	dmo_idioma='${def:locale}',
	dmo_usuario='${def:user}',
	dmo_fecha_registro={d '${def:date}'},
	dmo_hora='${def:time}'

WHERE
	smn_movimiento_detalle_id=${fld:id}

