select
	${field},
	smn_banco.smn_linea_credito.smn_linea_credito_id,
	(select ent_codigo||' - '||ent_descripcion_corta from  smn_base.smn_entidades  where smn_entidades_id is not null  and smn_entidades_id=smn_banco.smn_linea_credito.smn_entidades_rf  order by smn_entidades_id ) as smn_entidades_rf,
	(select suc_codigo||' - '||suc_nombre from  smn_base.smn_sucursales  where smn_sucursales_id is not null  and smn_sucursales_id=smn_banco.smn_linea_credito.smn_sucursal_rf  order by smn_sucursales_id ) as smn_sucursal_rf,
	(select efi_codigo||' - '||efi_nombre from  smn_base.smn_entidades_financieras  where smn_entidades_financieras_id is not null  and smn_entidades_financieras_id=smn_banco.smn_linea_credito.smn_entidad_financiera_id  order by smn_entidades_financieras_id ) as smn_entidad_financiera_id,
	(select cba_codigo||' - '||cba_nombre from  smn_base.smn_cuentas_bancarias  where smn_cuentas_bancarias_id is not null  and smn_cuentas_bancarias_id=smn_banco.smn_linea_credito.smn_cuenta_bancaria_rf  order by smn_cuentas_bancarias_id ) as smn_cuenta_bancaria_rf,
	(select mon_codigo||' - '||mon_nombre from  smn_base.smn_monedas  where smn_monedas_id is not null  and smn_monedas_id=smn_banco.smn_linea_credito.smn_moneda_rf  order by smn_monedas_id ) as smn_moneda_rf,
	(select tca_moneda_referencia||' - '||tca_tasa_cambio from  smn_base.smn_tasas_de_cambio  where smn_tasas_de_cambio_id is not null  and smn_tasas_de_cambio_id=smn_banco.smn_linea_credito.smn_tasa_rf  order by smn_tasas_de_cambio_id ) as smn_tasa_rf,
	case
		when smn_banco.smn_linea_credito.lcr_estatus='AC' then '${lbl:b_active}'
		when smn_banco.smn_linea_credito.lcr_estatus='IN' then '${lbl:b_inactive}'
	end as lcr_estatus,
	smn_banco.smn_linea_credito.lcr_codigo,
	smn_banco.smn_linea_credito.lcr_descripcion,
	smn_banco.smn_linea_credito.lcr_monto_linea_ml,
	smn_banco.smn_linea_credito.lcr_monto_linea_ma,
	smn_banco.smn_linea_credito.lcr_saldo_disponible,
	smn_banco.smn_linea_credito.lcr_vigencia,
	smn_banco.smn_linea_credito.lcr_fecha_registro
from
	smn_banco.smn_linea_credito
where
    smn_banco.smn_linea_credito.smn_linea_credito_id is not null
    ${filter}


