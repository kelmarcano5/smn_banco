select
		smn_banco.smn_documento.smn_documento_id,
	${field}
from
	smn_banco.smn_documento
where
		smn_banco.smn_documento.smn_documento_id is not null
	${filter}
	
	
