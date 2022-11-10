UPDATE smn_banco.smn_movimiento_bancario SET
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_entidad_financiera_id=${fld:smn_entidad_financiera_id},
	smn_cuenta_bancaria_rf=${fld:smn_cuenta_bancaria_rf},
	-- smn_documentos_generales_rf=${fld:smn_documentos_generales_rf},
	mov_numero_documento=${fld:mov_numero_documento},
	-- smn_modulo_origen_rf=${fld:smn_modulo_origen_rf},
	smn_documento_id=${fld:smn_documento_id},
	-- mov_numero_documento_modulo=${fld:mov_numero_documento_modulo},
	smn_tipo_documento_id=(select smn_tipo_documento_id from smn_banco.smn_documento where smn_documento_id=${fld:smn_documento_id}),
	-- smn_equivalencia_doc_bancario_id=${fld:smn_equivalencia_doc_bancario_id},
	mov_descripcion_movimiento=${fld:mov_descripcion_movimiento},
	mov_beneficiario_pago=${fld:mov_beneficiario_pago},
	mov_tipo_movimiento=${fld:mov_tipo_movimiento},
	mov_monto_ml=${fld:mov_monto_ml},
	smn_moneda_rf=${fld:smn_moneda_rf},
	mov_fecha_documento=${fld:mov_fecha_documento},
	smn_tasa_rf=${fld:smn_tasa_rf},
	-- mov_monto_ma=${fld:mov_monto_ma},
	-- mov_fecha_entrega=${fld:mov_fecha_entrega},
	-- mov_fecha_disponible=${fld:mov_fecha_disponible},
	-- mov_estatus_proceso=${fld:mov_estatus_proceso},
	-- mov_estatus=${fld:mov_estatus},
	mov_idioma='${def:locale}',
	mov_usuario='${def:user}',
	mov_fecha_registro={d '${def:date}'},
	mov_hora='${def:time}'
	
WHERE
	smn_movimiento_bancario_id=${fld:id}

