update smn_banco.smn_saldo_cta_bancaria 
	set sal_saldo_inicial=${fld:monto_ml_sal_ant},
  sal_deposito=${fld:monto_ml_deposito},
  sal_nota_credito=${fld:monto_ml_nota_credito},
  sal_cheque=${fld:monto_ml_cheque},
  sal_nota_debito=${fld:monto_ml_nota_debito},
  sal_saldo_final=${fld:monto_ml_saldo_final}
where smn_banco.smn_saldo_cta_bancaria.smn_saldo_cta_bancaria_id=${fld:saldo_cta_bancaria_id};