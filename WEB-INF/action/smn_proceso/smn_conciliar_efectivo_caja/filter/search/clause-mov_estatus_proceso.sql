 and case when ${fld:mov_estatus_proceso} is not null then 
 	upper(smn_banco.smn_movimiento_bancario.mov_estatus_proceso) like upper(${fld:mov_estatus_proceso})
    else
    mov_estatus_proceso in ('DI', 'NC', 'CN')
    end