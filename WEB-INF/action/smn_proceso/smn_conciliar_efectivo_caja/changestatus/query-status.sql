UPDATE smn_banco.smn_movimiento_bancario
SET mov_estatus = 'GE',
 	mov_idioma='${def:locale}',
	mov_usuario='${def:user}',
	mov_fecha_registro={d '${def:date}'},
	mov_hora='${def:time}'
WHERE smn_movimiento_bancario_id = ${fld:id3}