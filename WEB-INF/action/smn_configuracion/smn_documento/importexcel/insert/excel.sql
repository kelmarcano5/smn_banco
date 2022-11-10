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
	doc_hora
)
VALUES
(
	${seq:nextval@smn_banco.seq_smn_documento},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
