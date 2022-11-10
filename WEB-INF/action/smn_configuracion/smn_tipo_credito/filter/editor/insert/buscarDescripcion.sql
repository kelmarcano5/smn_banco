select
		smn_banco.smn_tipo_credito.tcr_descripcion
from
		smn_banco.smn_tipo_credito
where
		upper(smn_banco.smn_tipo_credito.tcr_descripcion) = upper(${fld:tcr_descripcion})
