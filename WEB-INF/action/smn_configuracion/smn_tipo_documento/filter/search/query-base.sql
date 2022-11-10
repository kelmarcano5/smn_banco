select
	case
	when smn_banco.smn_tipo_documento.tdo_estatus='AC' then '${lbl:b_active}'
	when smn_banco.smn_tipo_documento.tdo_estatus='IN' then '${lbl:b_inactive}'
	end as tdo_estatus_combo,
	smn_banco.smn_tipo_documento.tdo_vigencia,
	smn_banco.smn_tipo_documento.tdo_estatus,
	smn_banco.smn_tipo_documento.tdo_descripcion,
	smn_banco.smn_tipo_documento.tdo_codigo,
	smn_banco.smn_tipo_documento.tdo_hora,
	smn_banco.smn_tipo_documento.tdo_fecha_registro,
	smn_banco.smn_tipo_documento.tdo_usuario,
	smn_banco.smn_tipo_documento.tdo_idioma,
		smn_banco.smn_tipo_documento.smn_tipo_documento_id
	
from
	smn_banco.smn_tipo_documento
where
	smn_tipo_documento_id is not null
	${filter}
order by
		smn_tipo_documento_id
