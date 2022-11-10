UPDATE smn_banco.smn_documento
SET doc_estatus = (CASE WHEN (doc_estatus = 'AC') THEN 'IN'
			ELSE 'AC'
 END),
 	doc_idioma='${def:locale}',
	doc_usuario='${def:user}',
	doc_fecha_registro={d '${def:date}'},
	doc_hora='${def:time}'
WHERE smn_documento_id = ${fld:id}