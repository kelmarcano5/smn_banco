select
		smn_banco.smn_tipo_documento.tdo_descripcion
from
		smn_banco.smn_tipo_documento
where
		upper(smn_banco.smn_tipo_documento.tdo_descripcion) = upper(${fld:tdo_descripcion})
