select smn_formas_pago_id as id, fop_codigo||' - '|| fop_descripcion as item 
from smn_base.smn_formas_pago order by smn_formas_pago_id 