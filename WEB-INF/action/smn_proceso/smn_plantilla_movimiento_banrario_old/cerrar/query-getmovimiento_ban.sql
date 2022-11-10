select 
  smn_movimiento_bancario as mov_id,
  
from smn_banco.smn_movimiento_bancario
where mov_estatus_proceso = 'DI' and
	smn_entidades_rf = ${fld:entidad_rf} and
  	smn_sucursal_rf = ${fld:sucursal_rf} and
  	smn_entidad_financiera_id = ${fld:banco_rf} and 
  	smn_cuenta_bancaria_rf = ${fld:cuenta_bancaria_rf} and
  	smn_equivalencia_doc_bancario_id = ${fld:equivalencia_ref_ban} and
  	mov_monto_ml = ${fld:monto_ml_ban} and
  	substring(mov_numero_documento, length(mov_numero_documento)-5, 6) = ${fld:numero_ref_ban}