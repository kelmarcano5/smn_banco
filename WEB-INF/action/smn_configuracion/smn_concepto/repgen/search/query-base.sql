select
		smn_banco.smn_concepto.smn_concepto_id,
	${field}
from
	smn_banco.smn_concepto
where
		smn_banco.smn_concepto.smn_concepto_id is not null
	${filter}
	
	
