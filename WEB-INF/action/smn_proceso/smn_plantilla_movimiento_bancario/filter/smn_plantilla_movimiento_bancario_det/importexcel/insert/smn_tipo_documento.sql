SELECT 
	smn_banco.smn_equivalencia_doc_bancario.smn_tipo_documento_id  
	FROM   
	smn_banco.smn_equivalencia_doc_bancario
	WHERE
	UPPER(smn_banco.smn_equivalencia_doc_bancario.edb_descrip_bancaria) = UPPER(substring(${fld:pmd_descripcion},1,length(smn_banco.smn_equivalencia_doc_bancario.edb_descrip_bancaria)))    	