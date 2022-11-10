select
	case
	when smn_banco.smn_tipo_documento.tdo_estatus='AC' then '${lbl:b_active}'
	when smn_banco.smn_tipo_documento.tdo_estatus='IN' then '${lbl:b_inactive}'
	end as tdo_estatus_combo,
	smn_banco.smn_tipo_documento.*
from
	smn_banco.smn_tipo_documento
where
	smn_tipo_documento_id = ${fld:id}
