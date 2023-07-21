select 
  smn_movimiento_bancario_id,
  mov_descripcion_movimiento, 
  mov_monto_ml
  
from smn_banco.smn_movimiento_bancario
where mov_estatus_proceso = 'DI' and
	smn_entidades_rf = ${fld:smn_entidades_rf} and
  	smn_sucursal_rf = ${fld:smn_sucursal_rf} and
  	smn_entidad_financiera_id = ${fld:smn_entidad_financiera_id} and 
  	smn_cuenta_bancaria_rf = ${fld:smn_cuenta_bancaria_rf} Y