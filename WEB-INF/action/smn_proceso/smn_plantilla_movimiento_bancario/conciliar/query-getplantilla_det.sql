select 
 smn_banco.smn_plantilla_movimiento_bancario_det.smn_plantilla_movimiento_bancario_id as mov_ban_id,
  smn_entidad_rf as entidad_rf,
  smn_sucursal_rf as sucursal_rf,
  smn_banco_rf as banco_rf,
  smn_cuenta_bancaria_rf as cuenta_bancaria_rf,
  pmb_fecha_movimiento as fecha_movimiento,

  smn_plantilla_movimiento_bancario_det_id as det_id,
  smn_banco.smn_plantilla_movimiento_bancario_det.smn_equivalencia_doc_bancario_id as equivalencia_ref_ban,
  pmd_numero_referencia_bancaria as numero_ref_ban,
  pmd_monto as monto_ml_ban,
  tdo_codigo as tipo_doc,
  smn_moneda_rf,
  pmd_monto_ma as monto_ma,
  doc_es_cobranza,
  smn_banco.smn_documento.smn_formas_pago_rf
from smn_banco.smn_plantilla_movimiento_bancario_det
inner join smn_banco.smn_plantilla_movimiento_bancario on smn_banco.smn_plantilla_movimiento_bancario.smn_plantilla_movimiento_bancario_id=smn_banco.smn_plantilla_movimiento_bancario_det.smn_plantilla_movimiento_bancario_id
inner join smn_banco.smn_tipo_documento on smn_banco.smn_tipo_documento.smn_tipo_documento_id=smn_banco.smn_plantilla_movimiento_bancario_det.smn_tipo_documento_id
inner join smn_banco.smn_equivalencia_doc_bancario on smn_banco.smn_equivalencia_doc_bancario.smn_equivalencia_doc_bancario_id=smn_banco.smn_plantilla_movimiento_bancario_det.smn_equivalencia_doc_bancario_id
inner join smn_banco.smn_documento on smn_banco.smn_documento.smn_documento_id=smn_banco.smn_equivalencia_doc_bancario.smn_documento_id
where smn_banco.smn_plantilla_movimiento_bancario_det.smn_plantilla_movimiento_bancario_id=${fld:plantilla_id} 
and pmd_estatus in ('GE', 'NC', 'EC')