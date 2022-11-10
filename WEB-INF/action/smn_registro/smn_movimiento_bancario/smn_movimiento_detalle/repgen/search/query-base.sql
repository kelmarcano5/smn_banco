select
	${field},
	smn_banco.smn_movimiento_detalle.smn_movimiento_detalle_id,
	smn_banco.smn_movimiento_detalle.smn_concepto_id,
	smn_banco.smn_movimiento_detalle.dmo_tipo_movimiento,
	smn_banco.smn_movimiento_detalle.dmo_monto_ml,
	smn_banco.smn_movimiento_detalle.dmo_fecha_registro,
	smn_base.smn_tasas_de_cambio.tca_moneda_referencia||' - '||tca_tasa_cambio as smn_tasa_rf
from
	smn_banco.smn_movimiento_detalle
	inner join smn_banco.smn_movimiento_bancario on smn_banco.smn_movimiento_bancario.smn_movimiento_bancario_id = smn_banco.smn_movimiento_detalle.smn_movimiento_bancario_id
	inner join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_banco.smn_movimiento_bancario.smn_tasa_rf
where
	smn_banco.smn_movimiento_detalle.smn_movimiento_detalle_id is not null
	smn_banco.smn_movimiento_detalle.smn_movimiento_bancario_id = ${fld:id2}
	${filter}