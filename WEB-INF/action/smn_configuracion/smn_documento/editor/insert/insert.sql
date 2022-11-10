INSERT INTO smn_banco.smn_documento
(
	smn_documento_id,
	smn_documento_general_rf,
	smn_tipo_documento_id,
	doc_codigo,
	doc_descripcion,
	doc_tipo_movimiento,
	doc_maneja_moneda_alterna,
	doc_transferencia,
	smn_documento_origen_id,
	smn_documento_destino_id,
	doc_estatus,
	doc_vigencia,
	doc_idioma,
	doc_usuario,
	doc_fecha_registro,
	doc_hora,
	smn_forma_pago_rf
)
VALUES
(
	${seq:currval@smn_banco.seq_smn_documento},
	${fld:smn_documento_general_rf},
	${fld:smn_tipo_documento_id},
	${fld:doc_codigo},
	${fld:doc_descripcion},
	${fld:doc_tipo_movimiento},
	${fld:doc_maneja_moneda_alterna},
	${fld:doc_transferencia},
	${fld:smn_documento_origen_id},
	${fld:smn_documento_destino_id},
	${fld:doc_estatus},
	${fld:doc_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_forma_pago_id}
)
