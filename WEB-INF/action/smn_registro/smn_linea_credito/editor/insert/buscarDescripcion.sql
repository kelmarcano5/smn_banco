select
		smn_banco.smn_linea_credito.lcr_descripcion
from
		smn_banco.smn_linea_credito
where
		upper(smn_banco.smn_linea_credito.lcr_descripcion) = upper(${fld:lcr_descripcion})
