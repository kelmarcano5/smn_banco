select
	smn_banco.smn_plantilla_movimiento_bancario.smn_plantilla_movimiento_bancario_id,
	case
	when smn_banco.smn_plantilla_movimiento_bancario.pmb_estatus='GE' then '${lbl:b_generated}'
	when smn_banco.smn_plantilla_movimiento_bancario.pmb_estatus='CN' then '${lbl:b_concil}'
	end as pmb_estatus,
	smn_banco.smn_plantilla_movimiento_bancario.smn_entidad_rf,
	smn_banco.smn_plantilla_movimiento_bancario.smn_sucursal_rf,
	smn_banco.smn_plantilla_movimiento_bancario.smn_banco_rf,
	smn_banco.smn_plantilla_movimiento_bancario.smn_cuenta_bancaria_rf,
	smn_banco.smn_plantilla_movimiento_bancario.pmb_estatus,
	smn_banco.smn_plantilla_movimiento_bancario.pmb_fecha_registro
	
from
	smn_banco.smn_plantilla_movimiento_bancario
