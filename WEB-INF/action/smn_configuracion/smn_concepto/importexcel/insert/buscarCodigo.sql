select
		smn_banco.smn_concepto.con_codigo
from
		smn_banco.smn_concepto
where
		upper(smn_banco.smn_concepto.con_codigo) = upper(${fld:con_codigo})
