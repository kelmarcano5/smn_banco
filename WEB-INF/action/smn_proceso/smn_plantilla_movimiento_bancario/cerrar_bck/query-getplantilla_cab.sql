select 
  smn_plantilla_movimiento_bancario_id as mov_ban_id,
  smn_entidad_rf as entidad_rf,
  smn_sucursal_rf as sucursal_rf,
  smn_banco_rf as banco_rf,
  smn_cuenta_bancaria_rf as cuenta_bancaria_rf,
  pmb_fecha_movimiento as fecha_movimiento
from smn_banco.smn_plantilla_movimiento_bancario
where smn_plantilla_movimiento_bancario_id=${fld:plantilla_id} and pmb_estatus = 'EC'