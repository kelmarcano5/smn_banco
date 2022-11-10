UPDATE smn_banco.smn_plantilla_movimiento_bancario_det SET
	smn_plantilla_movimiento_bancario_id=${fld:smn_plantilla_movimiento_bancario_id},
	pmd_fecha=${fld:pmd_fecha},
	pmd_numero_referencia_bancaria=${fld:pmd_numero_referencia_bancaria},
	smn_equivalencia_doc_bancario_id=${fld:smn_equivalencia_doc_bancario_id},
	smn_tipo_documento_id=${fld:smn_tipo_documento_id},
	pmd_descripcion=${fld:pmd_descripcion},
	pmd_monto=${fld:pmd_monto},
	smn_tasa_rf=${fld:smn_tasa_rf},
	smn_moneda_rf=${fld:smn_moneda_rf},
	pmd_monto_ma=${fld:pmd_monto_ma},
	pmd_estatus=${fld:pmd_estatus},
	pmd_fecha_registro=${fld:pmd_fecha_registro},
	smn_cliente_rf=${fld:smn_cliente_rf}

WHERE
	smn_plantilla_movimiento_bancario_det_id=${fld:id}

