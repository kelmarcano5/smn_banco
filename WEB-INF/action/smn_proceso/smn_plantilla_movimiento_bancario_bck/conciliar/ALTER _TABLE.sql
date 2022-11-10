ALTER TABLE smn_banco.smn_documento ADD COLUMN smn_forma_pago_rf integer default 0;
ALTER TABLE smn_banco.smn_documento ALTER COLUMN smn_forma_pago_rf SET NOT NULL;