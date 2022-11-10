select	
	case
		when smn_banco.smn_tipo_credito.tcr_metodo_calculo='SI' then '${lbl:b_simple}'
		when smn_banco.smn_tipo_credito.tcr_metodo_calculo='CO' then '${lbl:b_compound}'
	end as tcr_metodo_calculo,
	case
		when smn_banco.smn_tipo_credito.tcr_estatus='AC' then '${lbl:b_active}'
		when smn_banco.smn_tipo_credito.tcr_estatus='IN' then '${lbl:b_inactive}'
	end as tcr_estatus,
	smn_banco.smn_tipo_credito.tcr_codigo,
	smn_banco.smn_tipo_credito.tcr_descripcion,
	smn_banco.smn_tipo_credito.tcr_fecha_registro,
	smn_banco.smn_tipo_credito.smn_tipo_credito_id

from
	smn_banco.smn_tipo_credito
where
	smn_tipo_credito_id is not null	
 	 	${filter}
order by 
	smn_tipo_credito_id