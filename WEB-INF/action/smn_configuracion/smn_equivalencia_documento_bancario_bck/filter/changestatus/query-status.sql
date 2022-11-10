UPDATE smn_banco.smn_equivalencia_doc_bancario
SET edb_estatus = (CASE WHEN (edb_estatus = 'AC') THEN 'IN'
			ELSE 'AC'
 END),
 	edb_idioma='${def:locale}',
	edb_usuario='${def:user}',
	edb_fecha_registro={d '${def:date}'},
	edb_hora='${def:time}'
WHERE smn_equivalencia_doc_bancario_id = ${fld:id}