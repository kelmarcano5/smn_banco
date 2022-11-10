INSERT INTO smn_banco.smn_tipo_credito
(
	smn_tipo_credito_id,
	tcr_codigo,
	tcr_descripcion,
	tcr_metodo_calculo,
	tcr_estatus,
	tcr_vigencia,
	tcr_idioma,
	tcr_usuario,
	tcr_fecha_registro,
	tcr_hora
)
VALUES
(
	${seq:nextval@smn_banco.seq_smn_tipo_credito},
	?,
	?,
	?,
	?,
	?,
	'${def:locale }',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
