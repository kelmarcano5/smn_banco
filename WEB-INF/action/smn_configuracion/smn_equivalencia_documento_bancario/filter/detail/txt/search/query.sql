select
	
from 
	smn_banco.smn_equivalencia_documento_bancario
where
	smn_banco.smn_equivalencia_documento_bancario.smn_equivalencia_documento_bancario_id=${fld:id}
order by 
	smn_banco.smn_equivalencia_documento_bancario.smn_equivalencia_documento_bancario_id
