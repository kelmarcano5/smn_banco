WITH mov_bancario AS (
        SELECT smn_movimiento_bancario_id
        FROM smn_banco.smn_rel_plant_mov_bancario
        WHERE
        smn_plantilla_movimiento_bancario_det_id=${fld:id}
     )
update smn_banco.smn_movimiento_bancario set mov_estatus_proceso='CN'
WHERE smn_movimiento_bancario_id IN (SELECT smn_movimiento_bancario_id FROM mov_bancario);