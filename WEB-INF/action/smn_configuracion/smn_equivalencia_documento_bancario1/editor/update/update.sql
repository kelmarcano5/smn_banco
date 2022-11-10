UPDATE smn_banco.smn_equivalencia_doc_bancario SET
	smn_documento_id=${fld:smn_documento_id},
	smn_entidad_financiera_id=${fld:smn_entidad_financiera_id},
	edb_doc_equiv_bancario=${fld:edb_doc_equiv_bancario},
	smn_tipo_documento_id=${fld:smn_tipo_documento_id},
	edb_descrip_bancaria=${fld:edb_descrip_bancaria},
	edb_estatus=${fld:edb_estatus},
	edb_vigencia=${fld:edb_vigencia},
	edb_idioma='${def:locale}',
	edb_usuario='${def:user}',
	edb_fecha_registro={d '${def:date}'},
	edb_hora='${def:time}'

WHERE
	smn_equivalencia_doc_bancario_id=${fld:id}

