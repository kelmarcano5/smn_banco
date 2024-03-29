Update smn_cobranzas.smn_relacion_cobranza set rco_estatus_proceso='CO'
where
smn_relacion_cobranza_id in (select smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id
FROM
smn_banco.smn_movimiento_bancario
INNER JOIN smn_caja.smn_deposito ON smn_banco.smn_movimiento_bancario.smn_cuenta_bancaria_rf = smn_caja.smn_deposito.smn_cuenta_bancaria_id 
AND cast(smn_banco.smn_movimiento_bancario.mov_numero_documento as char) = smn_caja.smn_deposito.dep_numero_deposito 
AND smn_banco.smn_movimiento_bancario.mov_fecha_documento = smn_caja.smn_deposito.dep_fecha
INNER JOIN smn_caja.smn_rel_deposito_dist_pago_det ON smn_caja.smn_deposito.smn_deposito_id = smn_caja.smn_rel_deposito_dist_pago_det.smn_deposito_id
INNER JOIN smn_caja.smn_dist_pago_detalle ON smn_caja.smn_rel_deposito_dist_pago_det.smn_dist_pago_detalle_id = smn_caja.smn_dist_pago_detalle.smn_dist_pago_detalle_id
--INNER JOIN smn_caja.smn_mov_caja_cabecera ON smn_caja.smn_dist_pago_detalle.smn_mov_caja_cabecera_id = smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id
INNER JOIN smn_cobranzas.smn_relacion_cobranza ON smn_caja.smn_dist_pago_detalle.smn_dist_pago_detalle_id = smn_cobranzas.smn_relacion_cobranza.smn_dist_pago_detalle_rf
where smn_banco.smn_movimiento_bancario.smn_movimiento_bancario_id=${fld:movimiento_bancario_id}
);