select
		smn_banco.smn_concepto.con_codigo,
	smn_banco.smn_concepto.con_descripcion,
	smn_banco.smn_concepto.con_tabla,
	smn_banco.smn_concepto.con_campo,
	smn_banco.smn_concepto.con_estatus,
	smn_banco.smn_concepto.con_vigencia,
	smn_banco.smn_concepto.con_fecha_registro
from
	smn_banco.smn_concepto 
where
	smn_banco.smn_concepto.smn_concepto_id = ${fld:id}
