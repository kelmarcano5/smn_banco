select
		smn_banco.smn_tipo_credito.tcr_codigo
from
		smn_banco.smn_tipo_credito
where
		upper(smn_banco.smn_tipo_credito.tcr_codigo) = upper(${fld:tcr_codigo})
