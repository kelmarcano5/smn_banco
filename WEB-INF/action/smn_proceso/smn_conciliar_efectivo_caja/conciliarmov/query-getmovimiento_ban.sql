select 
  smn_movimiento_bancario_id as mov_ban_id,
  smn_entidades_rf as entidad_rf,
  smn_banco.smn_movimiento_bancario.smn_sucursal_rf as sucursal_rf,
  smn_banco.smn_movimiento_bancario.smn_entidad_financiera_id as banco_rf,
  smn_cuenta_bancaria_rf as cuenta_bancaria_rf,
  mov_fecha_documento as fecha_movimiento,
  tdo_codigo as tipo_doc,
  mov_monto_ml as monto_ml_ban,
  mov_monto_ma as monto_ma_ban,
  smn_moneda_rf as moneda_rf,
  smn_tasa_rf as tasa_rf,
  smn_banco.smn_documento.smn_documento_id as documento_id,
  smn_banco.smn_documento.smn_documento_general_rf as documento_general_rf,
  smn_base.smn_documentos_generales.dcg_modulo_origen as modulo_origen, 
  smn_banco.smn_documento.doc_tipo_movimiento as tipo_movimiento,
  smn_banco.smn_documento.doc_es_cobranza,
  smn_banco.smn_documento.smn_forma_pago_rf as smn_formas_pago_rf,
  smn_banco.smn_movimiento_bancario.smn_equivalencia_doc_bancario_id as equivalencia_ref_ban,
  mov_numero_documento as numero_ref_ban,
  tcb_naturaleza as naturaleza,
  smn_banco.smn_movimiento_bancario.smn_tipo_documento_id as tipo_doc_id

from smn_banco.smn_movimiento_bancario
inner join smn_banco.smn_tipo_documento on smn_banco.smn_tipo_documento.smn_tipo_documento_id=smn_banco.smn_movimiento_bancario.smn_tipo_documento_id
inner join smn_banco.smn_equivalencia_doc_bancario on smn_banco.smn_equivalencia_doc_bancario.smn_equivalencia_doc_bancario_id=smn_banco.smn_movimiento_bancario.smn_equivalencia_doc_bancario_id
inner join smn_banco.smn_documento on smn_banco.smn_documento.smn_documento_id=smn_banco.smn_equivalencia_doc_bancario.smn_documento_id
inner join smn_base.smn_documentos_generales on smn_base.smn_documentos_generales.smn_documentos_generales_id=smn_banco.smn_documento.smn_documento_general_rf
inner join smn_base.smn_cuentas_bancarias on smn_base.smn_cuentas_bancarias.smn_cuentas_bancarias_id=smn_banco.smn_movimiento_bancario.smn_cuenta_bancaria_rf
inner join smn_base.smn_tipo_cuenta_banco on smn_base.smn_tipo_cuenta_banco.smn_tipo_cuenta_banco_id=smn_base.smn_cuentas_bancarias.cba_tipo_cta_banco
where smn_movimiento_bancario_id=${fld:movimiento_bancario_id} 