Select sal_saldo_final as saldo_final_anterior
from smn_banco.smn_saldo_cta_bancaria
where smn_banco.smn_saldo_cta_bancaria.smn_cuenta_bancaria_rf = ${fld:cuenta_bancaria_rf}
and sal_fecha = (select max(sal_fecha) from smn_banco.smn_saldo_cta_bancaria where smn_banco.smn_saldo_cta_bancaria.smn_cuenta_bancaria_rf = ${fld:cuenta_bancaria_rf})
order by sal_fecha desc
limit 1;
