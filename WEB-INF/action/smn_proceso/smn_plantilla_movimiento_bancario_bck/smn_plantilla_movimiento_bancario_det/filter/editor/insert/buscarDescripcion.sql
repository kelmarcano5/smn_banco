select
		smn_banco.smn_plantilla_movimiento_bancario_det.pmd_descripcion
from
		smn_banco.smn_plantilla_movimiento_bancario_det
where
		upper(smn_banco.smn_plantilla_movimiento_bancario_det.pmd_descripcion) = upper(${fld:pmd_descripcion})
