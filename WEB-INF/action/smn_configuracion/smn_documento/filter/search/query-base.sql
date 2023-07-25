select

	case
	when smn_banco.smn_documento.doc_tipo_movimiento='DE' then '${lbl:b_debit}'
	when smn_banco.smn_documento.doc_tipo_movimiento='{CR' then '${lbl:b_credit}'
	end as doc_tipo_movimiento,
	case
	when smn_banco.smn_documento.doc_maneja_moneda_alterna='SI' then '${lbl:b_yes}'
	when smn_banco.smn_documento.doc_maneja_moneda_alterna='NO' then '${lbl:b_no}'
	end as doc_maneja_moneda_alterna,
	case
	when smn_banco.smn_documento.doc_transferencia='SI' then '${lbl:b_yes}'
	when smn_banco.smn_documento.doc_transferencia='NO' then '${lbl:b_no}'
	end as doc_transferencia,

	case
	when smn_banco.smn_documento.doc_estatus='AC' then '${lbl:b_active}'
	when smn_banco.smn_documento.doc_estatus='IN' then '${lbl:b_inactive}'
	end as doc_estatus,
		smn_banco.smn_documento.smn_documento_id,
	dcg_codigo ||' - '||dcg_descripcion as smn_documento_general_rf,
	tdo_codigo ||' - '||tdo_descripcion as smn_tipo_documento_id,
	smn_banco.smn_documento.doc_codigo, 
	smn_banco.smn_documento.doc_descripcion,
	document1.doc_codigo ||' - '||document1.doc_descripcion as smn_documento_origen_id,
	document2.doc_codigo ||' - '||document2.doc_descripcion as smn_documento_destino_id,
	smn_base.smn_formas_pago.fop_codigo ||' - '||smn_base.smn_formas_pago.fop_descripcion as smn_formas_pago_rf,
	smn_banco.smn_documento.doc_vigencia,
	smn_banco.smn_documento.doc_idioma,
	smn_banco.smn_documento.doc_usuario,
	smn_banco.smn_documento.doc_fecha_registro,
	smn_banco.smn_documento.doc_hora,
  smn_banco.smn_documento.doc_es_cobranza
from
		smn_banco.smn_documento
	inner join smn_base.smn_documentos_generales on smn_documentos_generales_id=smn_documento_general_rf 
	inner join smn_banco.smn_tipo_documento on smn_banco.smn_tipo_documento.smn_tipo_documento_id=smn_banco.smn_documento.smn_tipo_documento_id
	left outer join smn_banco.smn_documento as document1 on document1.smn_documento_id=smn_banco.smn_documento.smn_documento_origen_id
	left outer join smn_banco.smn_documento as document2 on document2.smn_documento_id=smn_banco.smn_documento.smn_documento_destino_id
	left outer join smn_base.smn_formas_pago on smn_base.smn_formas_pago.smn_formas_pago_id=smn_banco.smn_documento.smn_formas_pago_rf

where
	smn_banco.smn_documento.smn_documento_id is not null
	${filter}
order by
		smn_banco.smn_documento.smn_documento_id
