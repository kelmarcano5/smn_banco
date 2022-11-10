select
		smn_banco.smn_tipo_documento.tdo_codigo
from
		smn_banco.smn_tipo_documento
where
		upper(smn_banco.smn_tipo_documento.tdo_codigo) = upper(${fld:tdo_codigo})
