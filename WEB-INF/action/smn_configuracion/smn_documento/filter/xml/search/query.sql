select
		smn_banco.smn_documento.smn_documento_id,

	case
	when smn_banco.smn_documento.doc_maneja_moneda_alterna='SI' then '${lbl:b_yes}'
	when smn_banco.smn_documento.doc_maneja_moneda_alterna='NO' then '${lbl:b_no}'
	end as doc_maneja_moneda_alterna,
	case
	when smn_banco.smn_documento.doc_estatus='AC' then '${lbl:b_active}'
	when smn_banco.smn_documento.doc_estatus='IN' then '${lbl:b_inactive}'
	end as doc_estatus,
	smn_banco.smn_documento.smn_tipo_documento_id,
	smn_banco.smn_documento.doc_codigo,
	smn_banco.smn_documento.doc_descripcion,
	smn_banco.smn_documento.doc_maneja_moneda_alterna,
	smn_banco.smn_documento.doc_estatus,
	smn_banco.smn_documento.doc_fecha_registro
	
from
	smn_banco.smn_documento
