select
		smn_banco.smn_concepto.con_descripcion
from
		smn_banco.smn_concepto
where
		upper(smn_banco.smn_concepto.con_descripcion) = upper(${fld:con_descripcion})
