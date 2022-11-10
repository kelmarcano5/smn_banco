select smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id as id, 
smn_base.smn_tasas_de_cambio.tca_moneda_referencia||' - '|| smn_base.smn_tasas_de_cambio.tca_tasa_cambio as item
from smn_base.smn_tasas_de_cambio
where smn_monedas_id=${fld:smn_moneda_rf}  
and tca_moneda_referencia=(select ent_moneda from smn_base.smn_entidades where smn_entidades_id = ${fld:smn_entidades_rf})
and tca_fecha_vigencia=${fld:mov_fecha_documento}