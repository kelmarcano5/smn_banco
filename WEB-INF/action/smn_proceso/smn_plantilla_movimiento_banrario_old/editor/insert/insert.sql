INSERT INTO smn_banco.smn_plantilla_movimiento_bancario
(
	smn_plantilla_movimiento_bancario_id,
	smn_entidad_rf,
	smn_sucursal_rf,
	smn_banco_rf,
	smn_cuenta_bancaria_rf,
	pmb_fecha_movimiento,
	pmb_estatus,
	pmb_idioma,
	pmb_usuario,
	pmb_fecha_registro,
	pmb_hora
)
VALUES
(
	${seq:currval@smn_banco.seq_smn_plantilla_movimiento_bancario},
	${fld:smn_entidad_rf},
	${fld:smn_sucursal_rf},
	${fld:smn_banco_rf},
	${fld:smn_cuenta_bancaria_rf},
	${fld:pmb_fecha_movimiento},
	${fld:pmb_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);
