update smn_banco.smn_plantilla_movimiento_bancario_det set pmd_estatus='CN' 
where smn_plantilla_movimiento_bancario_det_id=${fld:detalle_id};

update smn_banco.smn_movimiento_bancario set mov_estatus_proceso='CN'
where smn_movimiento_bancario_id=${fld:mov_id};

insert into smn_banco.smn_rel_plant_mov_bancario(
  smn_rel_plant_mov_bancario_id,
  smn_plantilla_movimiento_bancario_det_id,
  smn_movimiento_bancario_id,
  rpm_idioma,
  rpm_usuario,
  rpm_fecha_registro,
  rpm_hora
)
VALUES(
nextval('smn_banco.seq_smn_rel_plant_mov_bancario'),
${fld:detalle_id},
${fld:mov_id},
'${def:locale}',
'${def:user}',
{d '${def:date}'},
'${def:time}'
);

