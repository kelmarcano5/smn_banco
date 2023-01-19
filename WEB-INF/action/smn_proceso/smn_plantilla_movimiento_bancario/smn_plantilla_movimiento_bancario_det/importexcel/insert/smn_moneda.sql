SELECT 
    COALESCE( 
        (SELECT smn_base.smn_cuentas_bancarias.cba_moneda  
        FROM smn_base.smn_cuentas_bancarias
        INNER JOIN smn_banco.smn_plantilla_movimiento_bancario ON smn_banco.smn_plantilla_movimiento_bancario.smn_cuenta_bancaria_rf=smn_base.smn_cuentas_bancarias.smn_cuentas_bancarias_id
        WHERE smn_banco.smn_plantilla_movimiento_bancario.smn_plantilla_movimiento_bancario_id = ${fld:smn_plantilla_movimiento_bancario_id}
    )) AS smn_moneda_rf