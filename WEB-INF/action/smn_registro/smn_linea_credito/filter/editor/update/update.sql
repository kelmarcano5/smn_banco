UPDATE smn_banco.smn_linea_credito SET
	lcr_codigo=${fld:lcr_codigo},
	lcr_descripcion=${fld:lcr_descripcion},
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_entidad_financiera_id=${fld:smn_entidad_financiera_id},
	smn_cuenta_bancaria_rf=${fld:smn_cuenta_bancaria_rf},
	lcr_monto_linea_ml=${fld:lcr_monto_linea_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	smn_tasa_rf=${fld:smn_tasa_rf},
	lcr_monto_linea_ma=${fld:lcr_monto_linea_ma},
	lcr_saldo_disponible=${fld:lcr_saldo_disponible},
	lcr_estatus=${fld:lcr_estatus},
	lcr_vigencia=${fld:lcr_vigencia},
	lcr_idioma='${def:locale}',
	lcr_usuario='${def:user}',
	lcr_fecha_registro={d '${def:date}'},
	lcr_hora='${def:time}'

WHERE
	smn_linea_credito_id=${fld:id}

