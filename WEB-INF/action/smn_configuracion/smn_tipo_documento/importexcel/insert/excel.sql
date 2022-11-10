INSERT INTO smn_banco.smn_tipo_documento
(
	smn_tipo_documento_id,
	tdo_codigo,
	tdo_descripcion,
	tdo_estatus,
	tdo_vigencia,
	tdo_idioma,
	tdo_usuario,
	tdo_fecha_registro,
	tdo_hora
)
VALUES
(
	${seq:nextval@smn_banco.seq_smn_tipo_documento},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
