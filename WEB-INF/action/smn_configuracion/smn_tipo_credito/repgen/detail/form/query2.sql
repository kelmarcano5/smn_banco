select
		smn_banco.smn_tipo_credito.tcr_codigo,
	smn_banco.smn_tipo_credito.tcr_descripcion,
	smn_banco.smn_tipo_credito.tcr_metodo_calculo,
	smn_banco.smn_tipo_credito.tcr_estatus,
	smn_banco.smn_tipo_credito.tcr_vigencia,
	smn_banco.smn_tipo_credito.tcr_fecha_registro
from
	smn_banco.smn_tipo_credito 
where
	smn_banco.smn_tipo_credito.smn_tipo_credito_id = ${fld:id}
