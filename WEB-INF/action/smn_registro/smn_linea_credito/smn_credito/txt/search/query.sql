select
	smn_banco.smn_credito.smn_credito_id,
	(select doc_codigo||' - '||doc_descripcion from  smn_banco.smn_documento  where smn_documento_id is not null  and smn_documento_id=smn_banco.smn_credito.smn_documento_id  order by smn_documento ) as smn_documento_id,
	smn_banco.smn_credito.smn_credito_id,
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
	smn_banco.smn_credito.smn_documento_id,
	smn_banco.smn_credito.cre_numero_documento,
	smn_banco.smn_credito.cre_fecha_solicitud,
	smn_banco.smn_credito.cre_fecha_otorgamiento,
	smn_banco.smn_credito.cre_tasa_interes,
	smn_banco.smn_credito.cre_meses_credito,
	smn_banco.smn_credito.cre_monto_credito_ml,
	smn_banco.smn_credito.cre_estatus_financiero,
	smn_banco.smn_credito.cre_estatus_proceso,
	smn_banco.smn_credito.cre_fecha_registro
from 
	smn_banco.smn_credito
