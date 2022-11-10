select
	case
	when smn_banco.smn_concepto.con_estatus='AC' then '${lbl:b_active}'
	when smn_banco.smn_concepto.con_estatus='IN' then '${lbl:b_inactive}'
	end as con_estatus,
	smn_banco.smn_concepto.*
from
	smn_banco.smn_concepto
where
	smn_concepto_id = ${fld:id}
