UPDATE smn_banco.smn_plantilla_movimiento_bancario SET
	smn_entidad_rf=${fld:smn_entidad_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_banco_rf=${fld:smn_banco_rf},
	smn_cuenta_bancaria_rf=${fld:smn_cuenta_bancaria_rf},
	pmb_estatus=${fld:pmb_estatus},
	pmb_fecha_registro=${fld:pmb_fecha_registro}

WHERE
	smn_plantilla_movimiento_bancario=${fld:id}

