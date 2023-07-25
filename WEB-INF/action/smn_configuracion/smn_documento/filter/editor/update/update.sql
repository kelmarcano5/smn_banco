UPDATE smn_banco.smn_documento SET
	smn_documento_general_rf=${fld:smn_documento_general_rf},
	smn_tipo_documento_id=${fld:smn_tipo_documento_id},
	doc_codigo=${fld:doc_codigo},
	doc_descripcion=${fld:doc_descripcion},
	doc_tipo_movimiento=${fld:doc_tipo_movimiento},
	doc_maneja_moneda_alterna=${fld:doc_maneja_moneda_alterna},
	doc_transferencia=${fld:doc_transferencia},
	smn_documento_origen_id=${fld:smn_documento_origen_id},
	smn_documento_destino_id=${fld:smn_documento_destino_id},
	doc_estatus=${fld:doc_estatus},
	doc_vigencia=${fld:doc_vigencia},
	doc_idioma='${def:locale}',
	doc_usuario='${def:user}',
	doc_fecha_registro={d '${def:date}'},
	doc_hora='${def:time}',
	smn_formas_pago_rf=${fld:smn_forma_pago_id},
	doc_es_cobranza=${fld:doc_es_cobranza}

WHERE
	smn_documento_id=${fld:id}

