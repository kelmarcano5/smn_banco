SELECT 
	COALESCE( 
		(SELECT 
			smn_banco.smn_equivalencia_doc_bancario.smn_equivalencia_doc_bancario_id  
		FROM   
			smn_banco.smn_equivalencia_doc_bancario
		WHERE  
			UPPER(TRIM(smn_banco.smn_equivalencia_doc_bancario.edb_descrip_bancaria)) = UPPER(TRIM(${fld:pmd_descripcion}))
	)) AS smn_equivalencia_doc_bancario_id	