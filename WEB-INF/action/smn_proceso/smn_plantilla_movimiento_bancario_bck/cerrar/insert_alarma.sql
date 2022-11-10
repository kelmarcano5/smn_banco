insert into smn_banco.smn_alarma(
smn_alarma_id,
smn_plantilla_movimiento_bancario_det_id,
ala_accion,
ala_descripcion,
ala_estatus,
ala_idioma,
ala_usuario,
ala_fecha_registro,
ala_hora
)
VALUES(
nextval('smn_banco.smn_alarma.seq_smn_alarma'),
${fld:detalle_id},
'',
${fld:descripcion},
'RE',  
'${def:locale}',
'${def:user}',
{d '${def:date}'},
'${def:time}'
)
RETURNING smn_alarma_id