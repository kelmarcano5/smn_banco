select
		smn_banco.smn_movimiento_bancario.mov_descripcion_movimiento
from
		smn_banco.smn_movimiento_bancario
where
		upper(smn_banco.smn_movimiento_bancario.mov_descripcion_movimiento) = upper(${fld:mov_descripcion_movimiento})
