select
	smn_banco.smn_movimiento_bancario.smn_movimiento_bancario_id,
	case
	when smn_banco.smn_movimiento_bancario.mov_estatus='RE' then '${lbl:b_registered}'
	when smn_banco.smn_movimiento_bancario.mov_estatus='GE' then '${lbl:b_generated}'
	when smn_banco.smn_movimiento_bancario.mov_estatus='CO' then '{lbl:b_posted}'
	end as mov_estatus,
	smn_banco.smn_movimiento_bancario.smn_entidades_rf,
	smn_banco.smn_movimiento_bancario.smn_entidad_financiera_id,
	smn_banco.smn_movimiento_bancario.smn_cuenta_bancaria_rf,
	smn_banco.smn_movimiento_bancario.smn_documento_id,
	smn_banco.smn_movimiento_bancario.mov_numero_documento_modulo,
	smn_banco.smn_movimiento_bancario.smn_tipo_documento_id,
	smn_banco.smn_movimiento_bancario.mov_monto_ml,
	smn_banco.smn_movimiento_bancario.mov_estatus,
	smn_banco.smn_movimiento_bancario.mov_fecha_registro
from
	smn_banco.smn_movimiento_bancario
