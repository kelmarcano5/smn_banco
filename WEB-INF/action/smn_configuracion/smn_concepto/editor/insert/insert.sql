INSERT INTO smn_banco.smn_concepto
(
	smn_concepto_id,
	con_codigo,
	con_descripcion,
	con_tabla,
	con_campo,
	con_estatus,
	con_vigencia,
	con_idioma,
	con_usuario,
	con_fecha_registro,
	con_hora
)
VALUES
(
	${seq:currval@smn_banco.seq_smn_concepto},
	${fld:con_codigo},
	${fld:con_descripcion},
	${fld:con_tabla},
	${fld:con_campo},
	${fld:con_estatus},
	${fld:con_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
