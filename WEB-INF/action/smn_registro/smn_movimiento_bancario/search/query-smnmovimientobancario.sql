select
	smn_banco.smn_movimiento_bancario.smn_movimiento_bancario_id,
	case
	when smn_banco.smn_movimiento_bancario.mov_estatus='RE' then '${lbl:b_registered}'
	when smn_banco.smn_movimiento_bancario.mov_estatus='GE' then '${lbl:b_generated}'
	when smn_banco.smn_movimiento_bancario.mov_estatus='CO' then '${lbl:b_posted}'
	end as mov_estatus,
	smn_base.smn_entidades.ent_codigo||' - '||smn_base.smn_entidades.ent_descripcion_corta as smn_entidades_rf,
	smn_base.smn_entidades_financieras.efi_codigo||' - '||efi_nombre as smn_entidad_financiera_id,
	smn_base.smn_cuentas_bancarias.cba_codigo||' - '||smn_base.smn_cuentas_bancarias.cba_nombre as smn_cuenta_bancaria_rf,
	smn_banco.smn_documento.doc_codigo||' - '||doc_descripcion as smn_documento_id,
	smn_banco.smn_movimiento_bancario.mov_numero_documento_modulo,
	smn_banco.smn_tipo_documento.tdo_codigo||' - '||tdo_descripcion as smn_tipo_documento_id,
	smn_base.smn_documentos_generales.dcg_codigo||' - '||smn_base.smn_documentos_generales.dcg_descripcion as smn_documentos_generales_rf,
	smn_base.smn_modulos.mod_codigo||' - '||smn_base.smn_modulos.mod_nombre as smn_modulo_origen_rf,
	smn_banco.smn_movimiento_bancario.mov_monto_ml,
	smn_banco.smn_movimiento_bancario.mov_monto_ma,
	smn_banco.smn_movimiento_bancario.mov_estatus,
	smn_banco.smn_movimiento_bancario.mov_estatus_proceso,
	smn_banco.smn_movimiento_bancario.mov_fecha_documento,
	smn_banco.smn_movimiento_bancario.mov_numero_documento,
	smn_banco.smn_movimiento_bancario.mov_fecha_registro,
	smn_base.smn_sucursales.suc_codigo||' - '||smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_monedas.mon_codigo||' - '||smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_base.smn_tasas_de_cambio.tca_moneda_referencia||' - '||tca_tasa_cambio as smn_tasa_rf,
	smn_banco.smn_equivalencia_doc_bancario.edb_doc_equiv_bancario||' - '||edb_descrip_bancaria as smn_equivalencia_doc_bancario_id
from
	smn_banco.smn_movimiento_bancario
	left outer join smn_base.smn_cuentas_bancarias on smn_base.smn_cuentas_bancarias.smn_cuentas_bancarias_id = smn_banco.smn_movimiento_bancario.smn_cuenta_bancaria_rf
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_banco.smn_movimiento_bancario.smn_entidades_rf
	left outer join smn_base.smn_entidades_financieras on smn_base.smn_entidades_financieras.smn_entidades_financieras_id = smn_banco.smn_movimiento_bancario.smn_entidad_financiera_id
	left outer join smn_base.smn_documentos_generales on smn_base.smn_documentos_generales.smn_documentos_generales_id = smn_banco.smn_movimiento_bancario.smn_documentos_generales_rf
	left outer join smn_base.smn_modulos on smn_base.smn_modulos.smn_modulos_id = smn_banco.smn_movimiento_bancario.smn_modulo_origen_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_banco.smn_movimiento_bancario.smn_sucursal_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_banco.smn_movimiento_bancario.smn_moneda_rf
 	left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_banco.smn_movimiento_bancario.smn_tasa_rf
	left outer join smn_banco.smn_documento on smn_banco.smn_documento.smn_documento_id =  smn_banco.smn_movimiento_bancario.smn_documento_id
	left outer join smn_banco.smn_tipo_documento on smn_banco.smn_tipo_documento.smn_tipo_documento_id =  smn_banco.smn_movimiento_bancario.smn_tipo_documento_id
	left outer join smn_banco.smn_equivalencia_doc_bancario on smn_banco.smn_equivalencia_doc_bancario.smn_equivalencia_doc_bancario_id = smn_banco.smn_movimiento_bancario.smn_equivalencia_doc_bancario_id
order by 
	mov_fecha_documento desc,
	smn_entidades_rf,
	smn_sucursal_rf,
	mov_numero_documento