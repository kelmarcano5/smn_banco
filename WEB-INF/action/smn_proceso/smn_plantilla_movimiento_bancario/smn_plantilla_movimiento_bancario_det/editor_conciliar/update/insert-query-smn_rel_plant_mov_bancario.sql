INSERT INTO smn_banco.smn_rel_plant_mov_bancario
(
	smn_rel_plant_mov_bancario_id,
  	smn_plantilla_movimiento_bancario_det_id,
  	smn_movimiento_bancario_id,
  	rpm_idioma,
  	rpm_usuario,
  	rpm_fecha_registro,
  	rpm_hora
)
VALUES 
(
	${seq:nextval@smn_banco.seq_smn_rel_plant_mov_bancario},
	${fld:id},
	${fld:smn_movimiento_bancario_id},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);
