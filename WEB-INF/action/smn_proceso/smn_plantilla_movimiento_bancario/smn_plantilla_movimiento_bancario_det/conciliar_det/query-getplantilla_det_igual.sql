select 
  smn_plantilla_movimiento_bancario_det_id as det_id2
  
from smn_banco.smn_plantilla_movimiento_bancario_det
where smn_plantilla_movimiento_bancario_id=${fld:plantilla_id} and pmd_estatus in ('GE', 'NC', 'EC') and
smn_plantilla_movimiento_bancario_det_id <> ${fld:detalle_id} and
pmd_numero_referencia_bancaria = ${fld:numero_ref_ban} and
smn_equivalencia_doc_bancario_id = ${fld:equivalencia_ban} and
(pmd_monto+${fld:monto_ml_ban}) = 0