Select smn_saldo_cta_bancaria_id as saldo_cta_bancaria_id,
 
  sal_deposito as deposito_act,
  sal_nota_credito as nota_credito_act,
  sal_cheque as cheque_act,
  sal_nota_debito as nota_debito_act
from smn_banco.smn_saldo_cta_bancaria
where smn_banco.smn_saldo_cta_bancaria.smn_cuenta_bancaria_rf = ${fld:cuenta_bancaria_rf}
and sal_fecha = ${fld:fecha_movimiento} 
order by sal_fecha desc
limit 1;