select
		smn_banco.smn_tipo_documento.smn_tipo_documento_id,
	case
	when smn_banco.smn_tipo_documento.tdo_estatus='AC' then '${lbl:b_active}'
	when smn_banco.smn_tipo_documento.tdo_estatus='IN' then '${lbl:b_inactive}'
	end as tdo_estatus_combo,
	smn_banco.smn_tipo_documento.tdo_codigo,
	smn_banco.smn_tipo_documento.tdo_descripcion,
	smn_banco.smn_tipo_documento.tdo_estatus,
	smn_banco.smn_tipo_documento.tdo_vigencia,
	smn_banco.smn_tipo_documento.tdo_fecha_registro
	
from
	smn_banco.smn_tipo_documento
