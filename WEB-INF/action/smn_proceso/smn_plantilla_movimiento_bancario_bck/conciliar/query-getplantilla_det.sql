select 
  smn_plantilla_movimiento_bancario_det_id as det_id,
  smn_equivalencia_doc_bancario_id as equivalencia_ref_ban,
  pmd_numero_referencia_bancaria as numero_ref_ban,
  pmd_monto as monto_ml_ban,
  tdo_codigo as tipo_doc
from smn_banco.smn_plantilla_movimiento_bancario_det
inner join smn_banco.smn_tipo_documento on smn_banco.smn_tipo_documento.smn_tipo_documento_id=smn_banco.smn_plantilla_movimiento_bancario_det.smn_tipo_documento_id
where smn_plantilla_movimiento_bancario_id=${fld:plantilla_id} and pmd_estatus in ('GE', 'NC')