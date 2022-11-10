select
		smn_banco.smn_linea_credito.lcr_codigo
from
		smn_banco.smn_linea_credito
where
		upper(smn_banco.smn_linea_credito.lcr_codigo) = upper(${fld:lcr_codigo})
