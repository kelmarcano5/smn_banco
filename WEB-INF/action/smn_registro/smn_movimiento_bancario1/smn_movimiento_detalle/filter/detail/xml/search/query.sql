select
	smn_banco.smn_movimiento_detalle*
from
	smn_banco.smn_movimiento_detalle
where
	smn_movimiento_detalle_id = ${fld:id}
