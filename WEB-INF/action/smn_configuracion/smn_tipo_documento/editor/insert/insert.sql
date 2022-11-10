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
	${seq:currval@smn_banco.seq_smn_tipo_documento},
	${fld:tdo_codigo},
	${fld:tdo_descripcion},
	${fld:tdo_estatus},
	${fld:tdo_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
