select
	smn_banco.smn_concepto.con_codigo||' - '||con_descripcion as smn_concepto_id,
	case
	when smn_banco.smn_movimiento_detalle.dmo_tipo_movimiento='DE' then '${lbl:b_debit}'
	when smn_banco.smn_movimiento_detalle.dmo_tipo_movimiento='CR' then '${lbl:b_credit}'
	end as dmo_tipo_movimiento,
	smn_banco.smn_movimiento_detalle.dmo_fecha_registro,
	smn_banco.smn_movimiento_detalle.smn_movimiento_detalle_id,
	smn_base.smn_tasas_de_cambio.tca_moneda_referencia||' - '||tca_tasa_cambio as smn_tasa_rf,
	smn_base.smn_monedas.mon_codigo||' - '||mon_nombre as smn_moneda_rf
from
	smn_banco.smn_movimiento_detalle
	inner join smn_banco.smn_concepto on smn_banco.smn_concepto.smn_concepto_id = smn_banco.smn_movimiento_detalle.smn_concepto_id
	inner join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_banco.smn_movimiento_detalle.smn_tasa_rf
	inner join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_banco.smn_movimiento_detalle.smn_moneda_rf
where
	smn_movimiento_detalle_id is not null
	${filter}
order by
	smn_movimiento_detalle_id
