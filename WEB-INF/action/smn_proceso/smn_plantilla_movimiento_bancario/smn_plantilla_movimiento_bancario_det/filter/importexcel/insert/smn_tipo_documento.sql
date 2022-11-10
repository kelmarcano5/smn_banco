SELECT 
	smn_banco.smn_equivalencia_doc_bancario.smn_tipo_documento_id
FROM   
	smn_banco.smn_equivalencia_doc_bancario
	INNER JOIN
	smn_banco.smn_tipo_documento ON smn_banco.smn_tipo_documento.smn_tipo_documento_id=smn_banco.smn_equivalencia_doc_bancario.smn_tipo_documento_id
WHERE
	UPPER(smn_banco.smn_equivalencia_doc_bancario.edb_descrip_bancaria) = UPPER(substring(${fld:pmd_descripcion},1,length(smn_banco.smn_equivalencia_doc_bancario.edb_descrip_bancaria)))    	
	AND
	(
		smn_banco.smn_tipo_documento.tdo_codigo=(SELECT CASE WHEN ${fld:pmd_monto} < 0 THEN (SELECT tdo_codigo FROM smn_banco.smn_tipo_documento WHERE tdo_codigo IN ('ND')) ELSE (SELECT tdo_codigo FROM smn_banco.smn_tipo_documento WHERE tdo_codigo IN ('NC')) END)
		OR
		smn_banco.smn_tipo_documento.tdo_codigo=(SELECT CASE WHEN ${fld:pmd_monto} < 0 THEN (SELECT tdo_codigo FROM smn_banco.smn_tipo_documento WHERE tdo_codigo IN ('CH')) ELSE (SELECT tdo_codigo FROM smn_banco.smn_tipo_documento WHERE tdo_codigo IN ('DP')) END)
	)