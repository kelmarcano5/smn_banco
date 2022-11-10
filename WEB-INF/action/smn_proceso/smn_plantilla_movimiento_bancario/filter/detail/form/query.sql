select
	smn_banco.smn_plantilla_movimiento_bancario.smn_plantilla_movimiento_bancario_id,
	case
	when smn_banco.smn_plantilla_movimiento_bancario.pmb_estatus='GE' then '${lbl:b_generated}'
	when smn_banco.smn_plantilla_movimiento_bancario.pmb_estatus='CN' then '${lbl:b_concil}'
	end as pmb_estatus,
	smn_base.smn_entidades.ent_codigo||' - '||ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_codigo||' - '||suc_nombre as smn_sucursal_rf,
	smn_base.smn_entidades_financieras.efi_codigo||' - '||efi_nombre as smn_banco_rf,
	smn_base.smn_cuentas_bancarias.cba_codigo||' - '||cba_nombre as smn_cuenta_bancaria_rf,
	smn_banco.smn_plantilla_movimiento_bancario.pmb_fecha_movimiento,
	smn_banco.smn_plantilla_movimiento_bancario.pmb_idioma,
	smn_banco.smn_plantilla_movimiento_bancario.pmb_usuario,
	smn_banco.smn_plantilla_movimiento_bancario.pmb_hora,
	smn_banco.smn_plantilla_movimiento_bancario.pmb_fecha_registro
from
	smn_banco.smn_plantilla_movimiento_bancario
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_banco.smn_plantilla_movimiento_bancario.smn_entidad_rf
	left join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_banco.smn_plantilla_movimiento_bancario.smn_sucursal_rf
	inner join smn_base.smn_entidades_financieras on smn_base.smn_entidades_financieras.smn_entidades_financieras_id = smn_banco.smn_plantilla_movimiento_bancario.smn_banco_rf
	inner join smn_base.smn_cuentas_bancarias on smn_base.smn_cuentas_bancarias.smn_cuentas_bancarias_id = smn_banco.smn_plantilla_movimiento_bancario.smn_cuenta_bancaria_rf
where
	smn_plantilla_movimiento_bancario_id = ${fld:id}
