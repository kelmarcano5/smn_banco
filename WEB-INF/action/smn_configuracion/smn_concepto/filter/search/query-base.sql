select
	smn_concepto_id,
	con_codigo,
	con_descripcion,
	con_tabla,
	con_campo,
	case
		when con_estatus = 'AC' then '${lbl:b_active}'
		when con_estatus = 'IN' then '${lbl:b_inactive}'
	end as con_estatus,
	con_vigencia,
	con_idioma,
	con_usuario,
	con_fecha_registro,
	con_hora
from
	smn_banco.smn_concepto
where
	smn_concepto_id is not null
	${filter}
order by
		smn_concepto_id
