INSERT INTO smn_banco.smn_plantilla_movimiento_bancario_det
(
    smn_plantilla_movimiento_bancario_det_id,
    smn_plantilla_movimiento_bancario_id,
    pmd_fecha,
    pmd_numero_referencia_bancaria,
    pmd_descripcion,
    pmd_monto,
    smn_equivalencia_doc_bancario_id,
    smn_tipo_documento_id,
    smn_tasa_rf,
    smn_moneda_rf,
    pmd_monto_ma,
    pmd_estatus,
    pmd_idioma,
    pmd_usuario,
    pmd_fecha_registro,
    pmd_hora
)
VALUES
(
    ${seq:nextval@smn_banco.seq_smn_plantilla_movimiento_bancario_det},
    ${fld:smn_plantilla_movimiento_bancario_id},
    ?,
    ?,
    ?,
    ?,
    ?,
    ?,
    null,
    (SELECT smn_base.smn_cuentas_bancarias.cba_moneda FROM smn_base.smn_cuentas_bancarias INNER JOIN smn_banco.smn_plantilla_movimiento_bancario ON smn_banco.smn_plantilla_movimiento_bancario.smn_cuenta_bancaria_rf=smn_base.smn_cuentas_bancarias.smn_cuentas_bancarias_id WHERE smn_banco.smn_plantilla_movimiento_bancario.smn_plantilla_movimiento_bancario_id = ${fld:smn_plantilla_movimiento_bancario_id}),
    null,
    'NC',
    '${def:locale}',
    '${def:user}',
    {d '${def:date}'},
    '${def:time}'
)
