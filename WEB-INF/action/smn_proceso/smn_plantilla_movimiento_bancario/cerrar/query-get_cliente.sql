select 
  smn_cliente_id
  
from smn_comercial.smn_cliente
where
	smn_comercial.smn_cliente.cli_cliente_reclasificacion='S'
limit 1;