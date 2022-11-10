INSERT INTO smn_banco.smn_movimiento_detalle 
(
	smn_movimiento_detalle_id,
	smn_movimiento_bancario_id,
	smn_concepto_id,
	dmo_tipo_movimiento,
	dmo_monto_ml,
	smn_tasa_rf,
	smn_moneda_rf,
	dmo_monto_ma,
	dmo_idioma,
	dmo_usuario,
	dmo_fecha_registro,
	dmo_hora
)
VALUES
(
	${seq:nextval@smn_banco.seq_smn_movimiento_detalle },
	${fld:smn_movimiento_bancario_id},
	${fld:smn_concepto_id},
	${fld:dmo_tipo_movimiento},
	${fld:dmo_monto_ml},
	${fld:smn_tasa_rf},
	${fld:smn_moneda_rf},
	${fld:dmo_monto_ma},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
