SELECT 
smn_base.smn_cuentas_bancarias.smn_cuentas_bancarias_id as id,
smn_base.smn_cuentas_bancarias.cba_codigo||'-'||smn_base.smn_cuentas_bancarias.cba_nombre as item 
from smn_base.smn_cuentas_bancarias 
where smn_base.smn_cuentas_bancarias.cba_entidades_financieras=(SELECT smn_base.smn_entidades_financieras.smn_entidades_financieras_id
from smn_base.smn_entidades_financieras
where
upper(smn_base.smn_entidades_financieras.efi_nombre)=upper(${fld:id}))  