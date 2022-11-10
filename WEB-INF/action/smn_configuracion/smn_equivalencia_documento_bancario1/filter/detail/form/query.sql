select
	case
	when smn_banco.smn_equivalencia_doc_bancario.edb_estatus='AC' then '${lbl:b_active}'
	when smn_banco.smn_equivalencia_doc_bancario.edb_estatus='IN' then '${lbl:b_inactive}'
	end as edb_estatus_combo,
			smn_banco.smn_equivalencia_doc_bancario.smn_equivalencia_doc_bancario_id,
			smn_banco.smn_documento.doc_codigo ||' - '|| doc_descripcion as smn_documento_id, 
			smn_base.smn_entidades_financieras.efi_codigo ||' - '|| efi_nombre as smn_entidad_financiera_id,
			smn_banco.smn_equivalencia_doc_bancario.edb_doc_equiv_bancario,
			smn_banco.smn_tipo_documento.tdo_codigo ||' - '|| tdo_descripcion as smn_tipo_documento_id,
			smn_banco.smn_equivalencia_doc_bancario.edb_descrip_bancaria,			
			smn_banco.smn_equivalencia_doc_bancario.edb_vigencia,
			smn_banco.smn_equivalencia_doc_bancario.edb_idioma,
			smn_banco.smn_equivalencia_doc_bancario.edb_usuario,
			smn_banco.smn_equivalencia_doc_bancario.edb_fecha_registro,
			smn_banco.smn_equivalencia_doc_bancario.edb_hora
from
	smn_banco.smn_equivalencia_doc_bancario
	inner join smn_banco.smn_documento on smn_banco.smn_documento.smn_documento_id = smn_banco.smn_equivalencia_doc_bancario.smn_documento_id
	inner join smn_banco.smn_tipo_documento on smn_banco.smn_tipo_documento.smn_tipo_documento_id = smn_banco.smn_equivalencia_doc_bancario.smn_tipo_documento_id
	inner join smn_base.smn_entidades_financieras on smn_base.smn_entidades_financieras.smn_entidades_financieras_id = smn_banco.smn_equivalencia_doc_bancario.smn_entidad_financiera_id

where
	smn_equivalencia_doc_bancario_id = ${fld:id}
