select
		smn_banco.smn_documento.doc_codigo
from
		smn_banco.smn_documento
where
		upper(smn_banco.smn_documento.doc_codigo) = upper(${fld:doc_codigo})
