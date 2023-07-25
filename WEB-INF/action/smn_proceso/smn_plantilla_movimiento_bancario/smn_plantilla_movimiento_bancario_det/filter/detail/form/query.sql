select
	smn_banco.smn_plantilla_movimiento_bancario_det.smn_plantilla_movimiento_bancario_det_id,
	smn_banco.smn_plantilla_movimiento_bancario_det.smn_plantilla_movimiento_bancario_id,
	case
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='GE' then '${lbl:b_generated}'
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='CN' then '${lbl:b_concil}'
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='NC' then '${lbl:b_no_concil}'
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='AL' then '${lbl:b_alarm}'
	end as pmd_estatus,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_fecha,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_numero_referencia_bancaria,
	smn_banco.smn_equivalencia_doc_bancario.edb_descrip_bancaria as smn_equivalencia_doc_bancario_id,
	smn_banco.smn_tipo_documento.tdo_codigo ||' - '|| tdo_descripcion as smn_tipo_documento_id,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_descripcion,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_monto,
	smn_base.smn_monedas.mon_codigo ||' - '|| mon_nombre as smn_moneda_rf,
	smn_base.smn_tasas_de_cambio.tca_moneda_referencia ||' - '|| tca_tasa_cambio as smn_tasa_rf,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_monto_ma,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_idioma,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_hora,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_usuario,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_fecha_registro
from
	smn_banco.smn_plantilla_movimiento_bancario_det
	inner join smn_banco.smn_equivalencia_doc_bancario on smn_banco.smn_equivalencia_doc_bancario.smn_equivalencia_doc_bancario_id = smn_banco.smn_plantilla_movimiento_bancario_det.smn_equivalencia_doc_bancario_id
	inner join smn_banco.smn_tipo_documento on smn_banco.smn_tipo_documento.smn_tipo_documento_id = smn_banco.smn_plantilla_movimiento_bancario_det.smn_tipo_documento_id
	inner join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_banco.smn_plantilla_movimiento_bancario_det.smn_moneda_rf
	inner join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_banco.smn_plantilla_movimiento_bancario_det.smn_tasa_rf
where
	smn_plantilla_movimiento_bancario_det_id = ${fld:id}
