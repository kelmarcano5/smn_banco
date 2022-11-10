select 
  smn_plantilla_movimiento_bancario_det_id as det_id,
  smn_banco.smn_plantilla_movimiento_bancario_det.smn_equivalencia_doc_bancario_id as equivalencia_ref_ban,
  pmd_numero_referencia_bancaria as numero_ref_ban,
  pmd_monto as monto_ml_ban,
  pmd_fecha as fecha,
  smn_banco.smn_plantilla_movimiento_bancario_det.smn_moneda_rf as moneda_rf,
  smn_banco.smn_plantilla_movimiento_bancario_det.smn_tasa_rf as tasa_rf,
  pmd_monto_ma as monto_ma_ban,
  tdo_codigo as tipo_doc, 
  smn_banco.smn_plantilla_movimiento_bancario_det.smn_tipo_documento_id as tipo_doc_id,
  pmd_descripcion as descripcion,
  smn_banco.smn_documento.smn_documento_id as documento_id,
  smn_banco.smn_documento.smn_documento_general_rf as documento_general_rf,
  smn_base.smn_documentos_generales.dcg_modulo_origen as modulo_origen, 
  smn_banco.smn_documento.doc_tipo_movimiento as tipo_movimiento,
  smn_banco.smn_documento.doc_es_cobranza,
  smn_banco.smn_documento.smn_formas_pago_rf,
  smn_banco.smn_plantilla_movimiento_bancario_det.smn_cliente_rf
  
from smn_banco.smn_plantilla_movimiento_bancario_det
inner join smn_banco.smn_tipo_documento on smn_banco.smn_tipo_documento.smn_tipo_documento_id=smn_banco.smn_plantilla_movimiento_bancario_det.smn_tipo_documento_id
inner join smn_banco.smn_equivalencia_doc_bancario on smn_banco.smn_equivalencia_doc_bancario.smn_equivalencia_doc_bancario_id=smn_banco.smn_plantilla_movimiento_bancario_det.smn_equivalencia_doc_bancario_id
inner join smn_banco.smn_documento on smn_banco.smn_documento.smn_documento_id=smn_banco.smn_equivalencia_doc_bancario.smn_documento_id
inner join smn_base.smn_documentos_generales on smn_base.smn_documentos_generales.smn_documentos_generales_id=smn_banco.smn_documento.smn_documento_general_rf
left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id=smn_banco.smn_plantilla_movimiento_bancario_det.smn_cliente_rf
where smn_plantilla_movimiento_bancario_id=${fld:plantilla_id} and pmd_estatus in ('GE', 'NC')