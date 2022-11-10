select
	case
	when smn_banco.smn_plantilla_movimiento_bancario.pmb_estatus='GE' then '${lbl:b_generated}'
	when smn_banco.smn_plantilla_movimiento_bancario.pmb_estatus='CN' then '${lbl:b_concil}'
	end as pmb_estatus,
	smn_banco.smn_plantilla_movimiento_bancario.*
from
	smn_banco.smn_plantilla_movimiento_bancario
where
	smn_plantilla_movimiento_bancario = ${fld:id}
