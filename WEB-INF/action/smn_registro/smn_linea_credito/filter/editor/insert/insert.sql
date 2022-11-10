INSERT INTO smn_banco.smn_linea_credito
(
	smn_linea_credito_id,
	lcr_codigo,
	lcr_descripcion,
	smn_entidades_rf,
	smn_sucursal_rf,
	smn_entidad_financiera_id,
	smn_cuenta_bancaria_rf,
	lcr_monto_linea_ml,
	smn_moneda_rf,
	smn_tasa_rf,
	lcr_monto_linea_ma,
	lcr_saldo_disponible,
	lcr_estatus,
	lcr_vigencia,
	lcr_idioma,
	lcr_usuario,
	lcr_fecha_registro,
	lcr_hora
)
VALUES
(
	${seq:currval@smn_banco.seq_smn_linea_credito},
	${fld:lcr_codigo},
	${fld:lcr_descripcion},
	${fld:smn_entidades_rf},
	${fld:smn_sucursal_rf},
	${fld:smn_entidad_financiera_id},
	${fld:smn_cuenta_bancaria_rf},
	${fld:lcr_monto_linea_ml},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:lcr_monto_linea_ma},
	${fld:lcr_saldo_disponible},
	${fld:lcr_estatus},
	${fld:lcr_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
