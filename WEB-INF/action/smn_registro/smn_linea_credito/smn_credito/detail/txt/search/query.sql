select
	(select doc_codigo||' - '||doc_descripcion from  smn_banco.smn_documento  where smn_documento_id is not null  and smn_documento_id=smn_banco.smn_credito.smn_documento_id  order by smn_documento ) as smn_documento_id,
	(select tcr_codigo||' - '||tcr_descripcion from  smn_banco.smn_tipo_credito  where smn_tipo_credito_id is not null  and smn_tipo_credito_id=smn_banco.smn_credito.cre_tipo_credito_id  order by smn_tipo_credito ) as cre_tipo_credito_id,
	(select mon_codigo||' - '||mon_nombre from  smn_base.smn_monedas  where smn_monedas_id is not null  and smn_monedas_id=smn_banco.smn_credito.smn_moneda_rf  order by smn_monedas_id ) as smn_moneda_rf,
	(select tca_moneda_referencia||' - '||tca_tasa_cambio from  smn_base.smn_tasas_de_cambio  where smn_tasas_de_cambio_id is not null  and smn_tasas_de_cambio_id=smn_banco.smn_credito.smn_tasa_rf  order by smn_tasas_de_cambio_id ) as smn_tasa_rf,
	case
		when smn_banco.smn_credito.cre_estatus_financiero='SO' then '${lbl:b_requested}'
		when smn_banco.smn_credito.cre_estatus_financiero='OT' then '${lbl:b_awarded}'
		when smn_banco.smn_credito.cre_estatus_financiero='VI' then '${lbl:b_valid}'
		when smn_banco.smn_credito.cre_estatus_financiero='PA' then '${lbl:b_paid}'
		when smn_banco.smn_credito.cre_estatus_financiero='AT' then '${lbl:b_late}'
	end as cre_estatus_financiero,
	case
		when smn_banco.smn_credito.cre_estatus_proceso='RE' then '${lbl:b_registered}'
		when smn_banco.smn_credito.cre_estatus_proceso='GE' then '${lbl:b_generated}'
	end as cre_estatus_proceso,
	smn_banco.smn_credito.*
from 
	smn_banco.smn_credito
where
	smn_credito_id = ${fld:id}
