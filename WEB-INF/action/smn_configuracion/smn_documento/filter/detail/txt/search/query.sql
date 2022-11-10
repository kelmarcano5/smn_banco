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
	smn_banco.smn_documento.*
from
	smn_banco.smn_documento
where
	smn_documento_id = ${fld:id}
