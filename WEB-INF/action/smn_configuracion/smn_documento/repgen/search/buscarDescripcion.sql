select
		smn_banco.smn_documento.doc_descripcion
from
		smn_banco.smn_documento
where
		upper(smn_banco.smn_documento.doc_descripcion) = upper(${fld:doc_descripcion})
