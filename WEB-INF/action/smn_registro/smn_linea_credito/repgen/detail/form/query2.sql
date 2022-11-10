select
	smn_banco.smn_linea_credito.smn_linea_credito_id,
	smn_banco.smn_linea_credito.lcr_codigo,
	smn_banco.smn_linea_credito.lcr_descripcion,
	smn_base.smn_entidades.ent_codigo||' - '||ent_descripcion_corta as smn_entidades_rf,
	smn_base.smn_sucursales.suc_codigo||' - '||suc_nombre as smn_sucursal_rf,
	smn_base.smn_entidades_financieras.efi_codigo||' - '||efi_nombre as smn_entidad_financiera_id,
	smn_base.smn_cuentas_bancarias.cba_codigo||' - '||cba_nombre as smn_cuenta_bancaria_rf,
	smn_banco.smn_linea_credito.lcr_monto_linea_ml,
	smn_base.smn_monedas.mon_codigo||' - '||mon_nombre as smn_moneda_rf,
	smn_base.smn_tasas_de_cambio.tca_moneda_referencia||' - '||tca_tasa_cambio as smn_tasa_rf,
	smn_banco.smn_linea_credito.lcr_monto_linea_ma,
	smn_banco.smn_linea_credito.lcr_saldo_disponible,
	case
		when smn_banco.smn_linea_credito.lcr_estatus='AC' then '${lbl:b_active}'
		when smn_banco.smn_linea_credito.lcr_estatus='IN' then '${lbl:b_inactive}'
	end as lcr_estatus,
	smn_banco.smn_linea_credito.lcr_vigencia,
	smn_banco.smn_linea_credito.lcr_fecha_registro
from
	smn_banco.smn_linea_credito 
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_banco.smn_linea_credito.smn_entidades_rf
	inner join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_banco.smn_linea_credito.smn_sucursal_rf
	inner join smn_base.smn_entidades_financieras on smn_base.smn_entidades_financieras.smn_entidades_financieras_id = smn_banco.smn_linea_credito.smn_entidad_financiera_id
	inner join smn_base.smn_cuentas_bancarias on smn_base.smn_cuentas_bancarias.smn_cuentas_bancarias_id = smn_banco.smn_linea_credito.smn_cuenta_bancaria_rf
	inner join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_banco.smn_linea_credito.smn_moneda_rf
	inner join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_banco.smn_linea_credito.smn_tasa_rf
where
	smn_banco.smn_linea_credito.smn_linea_credito_id = ${fld:id}
