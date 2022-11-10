INSERT INTO smn_banco.smn_rol
(
	smn_rol_id,
	smn_usuario_rf,
	smn_perfil_rf,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	rol_tipo,
	smn_corporacion_rf,
	smn_entidad_rf,
	smn_sucursal_rf,
	smn_posicion_estructura_rf,
	rol_estatus,
	rol_vigencia,
	rol_idioma,
	rol_usuario,
	rol_fecha_registro,
	rol_hora
)
VALUES
(
	${seq:nextval@smn_banco.seq_smn_rol},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	'${def:locale  }',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
