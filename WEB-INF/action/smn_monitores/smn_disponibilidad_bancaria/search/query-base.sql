select
smn_banco.smn_saldo_cta_bancaria.*,
	smn_base.smn_entidades.ent_codigo||' - '||ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_codigo||' - '||suc_nombre as smn_sucursal_rf,
	smn_base.smn_entidades_financieras.efi_codigo||' - '||efi_nombre as smn_banco_rf,
	smn_base.smn_cuentas_bancarias.cba_codigo||' - '||cba_nombre as smn_cuenta_bancaria_rf
	
	
from
	smn_banco.smn_saldo_cta_bancaria
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_banco.smn_saldo_cta_bancaria.smn_entidades_rf
	left join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_banco.smn_saldo_cta_bancaria.smn_sucursal_rf
	inner join smn_base.smn_entidades_financieras on smn_base.smn_entidades_financieras.smn_entidades_financieras_id = smn_banco.smn_saldo_cta_bancaria.smn_entidad_financiera_rf
	inner join smn_base.smn_cuentas_bancarias on smn_base.smn_cuentas_bancarias.smn_cuentas_bancarias_id = smn_banco.smn_saldo_cta_bancaria.smn_cuenta_bancaria_rf
where
	smn_saldo_cta_bancaria_id is not null
	${filter}
order by
	sal_fecha