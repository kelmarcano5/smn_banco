select
		smn_banco.smn_equivalencia_doc_bancario.smn_equivalencia_doc_bancario_id,
	case
	when smn_banco.smn_equivalencia_doc_bancario.edb_estatus='AC' then '${lbl:b_active}'
	when smn_banco.smn_equivalencia_doc_bancario.edb_estatus='IN' then '${lbl:b_inactive}'
	end as edb_estatus_combo,
	smn_banco.smn_documento.doc_codigo ||' - '||doc_descripcion as smn_documento_id, 
	smn_banco.smn_tipo_documento.tdo_codigo ||' - '|| tdo_descripcion as smn_tipo_documento_id,
	smn_banco.smn_equivalencia_doc_bancario.edb_descrip_bancaria,
	smn_banco.smn_equivalencia_doc_bancario.edb_estatus,
	smn_banco.smn_equivalencia_doc_bancario.edb_fecha_registro
	
from
	smn_banco.smn_equivalencia_doc_bancario
	
inner join smn_banco.smn_documento on smn_banco.smn_documento.smn_documento_id = smn_banco.smn_equivalencia_doc_bancario.smn_documento_id
inner join smn_banco.smn_tipo_documento on smn_banco.smn_tipo_documento.smn_tipo_documento_id = smn_banco.smn_equivalencia_doc_bancario.smn_tipo_documento_id
	