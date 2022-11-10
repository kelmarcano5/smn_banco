select 
	sum (smn_base.fields.width_px) as width_total
from 
	smn_base.fields 
where 
	smn_base.fields.field_id in ${fields}
and
	smn_base.fields.action_root = '/action/smn_proceso/smn_plantilla_movimiento_bancario/smn_plantilla_movimiento_bancario_det/repgen'
