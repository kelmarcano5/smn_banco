select
	case
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='GE' then '${lbl:b_generated}'
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='CN' then '${lbl:b_concil}'
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='NC' then '${lbl:b_no_concil}'
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='AL' then '${lbl:b_alarm}'
	end as pmd_estatus,
	smn_banco.smn_plantilla_movimiento_bancario_det.*
from
	smn_banco.smn_plantilla_movimiento_bancario_det
where
	smn_plantilla_movimiento_bancario_det = ${fld:id}
