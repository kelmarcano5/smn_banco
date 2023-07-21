select *,
	smn_banco.smn_plantilla_movimiento_bancario_det.smn_plantilla_movimiento_bancario_det_id,
	smn_banco.smn_plantilla_movimiento_bancario_det.smn_equivalencia_doc_bancario_id,
	smn_banco.smn_plantilla_movimiento_bancario.smn_cuenta_bancaria_rf,
	smn_banco.smn_plantilla_movimiento_bancario.smn_banco_rf as smn_entidad_financiera_id,
	case
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='GE' then '${lbl:b_generated}'
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='CN' then '${lbl:b_concil}'
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='NC' then '${lbl:b_no_concil}'
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='AL' then '${lbl:b_alarm}'
	end as pmd_estatus,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus as status,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_fecha,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_numero_referencia_bancaria,
	smn_banco.smn_equivalencia_doc_bancario.edb_descrip_bancaria as smn_equivalencia_doc_bancario_desc,
	smn_banco.smn_tipo_documento.tdo_codigo ||' - '|| tdo_descripcion as smn_tipo_documento_id,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_descripcion,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_monto,
	smn_base.smn_monedas.mon_codigo ||' - '|| mon_nombre as smn_moneda_rf,
	smn_base.smn_tasas_de_cambio.tca_moneda_referencia ||' - '|| tca_tasa_cambio as smn_tasa_rf,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_monto_ma,
<<<<<<< HEAD
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_fecha_registro
=======
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_fecha_registro,
	smn_base.smn_auxiliar.aux_codigo || ' - ' || smn_base.smn_auxiliar.aux_descripcion as cliente
>>>>>>> bc307d24c29d1044b7ee82ed38f71dbe935112fb
from
	smn_banco.smn_plantilla_movimiento_bancario_det
	inner join smn_banco.smn_plantilla_movimiento_bancario on smn_banco.smn_plantilla_movimiento_bancario.smn_plantilla_movimiento_bancario_id=smn_banco.smn_plantilla_movimiento_bancario_det.smn_plantilla_movimiento_bancario_id
	left outer join smn_banco.smn_equivalencia_doc_bancario on smn_banco.smn_equivalencia_doc_bancario.smn_equivalencia_doc_bancario_id = smn_banco.smn_plantilla_movimiento_bancario_det.smn_equivalencia_doc_bancario_id
	left outer join smn_banco.smn_tipo_documento on smn_banco.smn_tipo_documento.smn_tipo_documento_id = smn_banco.smn_plantilla_movimiento_bancario_det.smn_tipo_documento_id
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_banco.smn_plantilla_movimiento_bancario_det.smn_moneda_rf
	left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_banco.smn_plantilla_movimiento_bancario_det.smn_tasa_rf
<<<<<<< HEAD
=======
	left  join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id=smn_banco.smn_plantilla_movimiento_bancario_det.smn_cliente_rf  
	left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
>>>>>>> bc307d24c29d1044b7ee82ed38f71dbe935112fb
where
	smn_banco.smn_plantilla_movimiento_bancario_det.smn_plantilla_movimiento_bancario_id is not null
    and smn_banco.smn_plantilla_movimiento_bancario_det.smn_plantilla_movimiento_bancario_id = ${fld:cabecera_id}
	${filter}
order by
	smn_plantilla_movimiento_bancario_det