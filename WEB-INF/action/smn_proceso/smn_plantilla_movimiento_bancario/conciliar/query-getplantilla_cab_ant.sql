select 
  *
from smn_banco.smn_plantilla_movimiento_bancario
where pmb_fecha_movimiento<${fld:fecha_movimiento} and pmb_estatus in ('GE','NC','EC') and
	smn_entidad_rf = ${fld:entidad_rf} and
  	smn_sucursal_rf = ${fld:sucursal_rf} and
  	smn_banco_rf = ${fld:banco_rf} and 
  	smn_cuenta_bancaria_rf = ${fld:cuenta_bancaria_rf}