SELECT 
	smn_banco.smn_equivalencia_doc_bancario.smn_equivalencia_doc_bancario_id  
	FROM   
	smn_banco.smn_equivalencia_doc_bancario
	WHERE  
	UPPER(TRIM(smn_banco.smn_equivalencia_doc_bancario.edb_doc_equiv_bancario)) = UPPER(TRIM(substring(${fld:pmd_descripcion},1, char_length(TRIM(smn_banco.smn_equivalencia_doc_bancario.edb_doc_equiv_bancario)))))