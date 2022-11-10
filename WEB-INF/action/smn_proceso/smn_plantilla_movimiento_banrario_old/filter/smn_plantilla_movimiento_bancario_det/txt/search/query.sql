select
	smn_banco.smn_plantilla_movimiento_bancario_det.smn_plantilla_movimiento_bancario_det_id,
	case
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='GE' then '${lbl:b_generated}'
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='CN' then '${lbl:b_concil}'
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='NC' then '${lbl:b_no_concil}'
	when smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus='AL' then '${lbl:b_alarm}'
	end as pmd_estatus,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_fecha,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_numero_referencia_bancaria,
	smn_banco.smn_plantilla_movimiento_bancario_det.smn_equivalencia_doc_bancario_id,
	smn_banco.smn_plantilla_movimiento_bancario_det.smn_tipo_documento_id,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_descripcion,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_monto,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_estatus,
	smn_banco.smn_plantilla_movimiento_bancario_det.pmd_fecha_registro
from
	smn_banco.smn_plantilla_movimiento_bancario_det