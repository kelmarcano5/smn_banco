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
	${seq:nextval@smn_banco.seq_smn_concepto},
	?,
	?,
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	'${def:date    }',
	'${def:time    }'
)
