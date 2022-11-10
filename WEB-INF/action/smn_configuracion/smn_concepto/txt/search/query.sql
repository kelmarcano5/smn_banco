select
		smn_banco.smn_concepto.smn_concepto_id,
	case
	when smn_banco.smn_concepto.con_estatus='AC' then '${lbl:b_active}'
	when smn_banco.smn_concepto.con_estatus='IN' then '${lbl:b_inactive}'
	end as con_estatus,
	smn_banco.smn_concepto.con_codigo,
	smn_banco.smn_concepto.con_descripcion,
	smn_banco.smn_concepto.con_estatus,
	smn_banco.smn_concepto.con_fecha_registro
	
from
	smn_banco.smn_concepto
