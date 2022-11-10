select
	case
	when smn_banco.smn_movimiento_bancario.mov_tipo_movimiento='DE' then '${lbl:b_debit}'
	when smn_banco.smn_movimiento_bancario.mov_tipo_movimiento='CR' then '${lbl:b_credit}'
	end as mov_tipo_movimiento,
	case
	when smn_banco.smn_movimiento_bancario.mov_estatus_proceso='CJ' then '${lbl:b_box}'
	when smn_banco.smn_movimiento_bancario.mov_estatus_proceso='DI' then '${lbl:b_available}'
	when smn_banco.smn_movimiento_bancario.mov_estatus_proceso='CN' then '{lbl:b_concil}'
	when smn_banco.smn_movimiento_bancario.mov_estatus_proceso='AL' then '{lbl:b_alarm}'
	end as mov_estatus_proceso,
	case
	when smn_banco.smn_movimiento_bancario.mov_estatus='RE' then '${lbl:b_registered}'
	when smn_banco.smn_movimiento_bancario.mov_estatus='GE' then '${lbl:b_generated}'
	when smn_banco.smn_movimiento_bancario.mov_estatus='CO' then '{lbl:b_posted}'
	end as mov_estatus,
	smn_banco.smn_movimiento_bancario.*
from
	smn_banco.smn_movimiento_bancario
where
	smn_movimiento_bancario_id = ${fld:id}
