select
		smn_banco.smn_rol.smn_rol_id,
case
	when smn_banco.smn_rol.rol_tipo='SO' then '${lbl:b_applicant}'
	when smn_banco.smn_rol.rol_tipo='RE' then '${lbl:b_recorder}'
	when smn_banco.smn_rol.rol_tipo='AP' then '${lbl:b_approver}'
	end as rol_tipo,
	case
	when smn_banco.smn_rol.rol_estatus='AC' then '${lbl:b_active}'
	when smn_banco.smn_rol.rol_estatus='IN' then '${lbl:b_inactive}'
	end as rol_estatus,
	smn_banco.smn_rol.smn_usuario_rf,
	smn_banco.smn_rol.smn_perfil_rf,
	smn_banco.smn_rol.smn_clase_auxiliar_rf,
	smn_banco.smn_rol.smn_auxiliar_rf,
	smn_banco.smn_rol.rol_tipo,
	smn_banco.smn_rol.rol_estatus,
	smn_banco.smn_rol.rol_fecha_registro
	
from
	smn_banco.smn_rol
