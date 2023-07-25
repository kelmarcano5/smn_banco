UPDATE smn_banco.smn_plantilla_movimiento_bancario_det SET
	
	pmd_fecha=${fld:pmd_fecha},
	pmd_numero_referencia_bancaria=${fld:pmd_numero_referencia_bancaria},
	smn_equivalencia_doc_bancario_id=${fld:smn_equivalencia_doc_bancario_id},
	pmd_estatus='CN',
	pmd_fecha_registro=${fld:pmd_fecha_registro}

WHERE
	smn_plantilla_movimiento_bancario_det_id=${fld:id};

WITH mov_bancario AS (
        SELECT smn_movimiento_bancario_id 
        FROM smn_banco.smn_rel_plant_mov_bancario
        WHERE
        smn_plantilla_movimiento_bancario_det_id=${fld:id}
     )
Update smn_banco.smn_movimiento_bancario set mov_estatus_proceso='CN'
WHERE smn_movimiento_bancario_id IN (SELECT smn_movimiento_bancario_id FROM mov_bancario);