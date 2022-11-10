update smn_banco.smn_plantilla_movimiento_bancario_det set pmd_estatus='CN' 
where smn_plantilla_movimiento_bancario_id=${fld:detalle_id};

update smn_banco.smn_movimiento_bancario set mov_estatus_proceso='CN'
where smn_movimiento_bancario_id=${fld:mov_id};

insert into smn_banco.smn_rel_plant_mov_bancario(
  smn_rel_plant_mov_bancario_id,
  smn_plantilla_movimiento_bancario_det_id,
  smn_movimiento_bancario_id,
  rpm_idioma,
  rpm_usuario,
  rpm_fecha_registro,
  rpm_hora
)
VALUES(
nextval('smn_banco.seq_smn_rel_plant_mov_bancario'),
${fld:detalle_id},
${fld:mov_id},
'${def:locale}',
'${def:user}',
{d '${def:date}'},
'${def:time}'
);

INSERT INTO smn_cobranzas.smn_relacion_cobranza
(
	smn_relacion_cobranza_id,
	smn_modulo_rf,
  	smn_doc_orig_rf,
  	smn_num_doc_orig,
  	smn_documento_id,
  	rco_numero_documento,
  	smn_cliente_rf,
  	rco_monto_bruto_cob_ml,
  	smn_moneda_rf,
  	rco_monto_bruto_cob_ma,
  	rco_monto_desc_ret_cob_ml,
  	rco_monto_desc_ret_cob_ma,
  	rco_monto_neto_cob_ml,
  	rco_monto_neto_cob_ma,
  	rco_estatus_proceso,
  	rco_idioma,
  	rco_usuario,
  	rco_fecha_registro,
  	rco_hora,
  	smn_entidad_rf,
  	smn_sucursal_rf,
  	rco_monto_impuesto_ml,
  	rco_monto_impuesto_ma,
  	rco_monto_documento_ml,
  	rco_monto_documento_ma,
  	rco_monto_diferencial_cambiario,
  	smn_tasa_rf,
  	smn_forma_pago_rf
)
VALUES
(
	nextval('smn_cobranzas.seq_smn_relacion_cobranza'),
	(Select smn_modulos_id from smn_base.smn_modulos where mod_codigo='SMN_BAN'),
	${fld:smn_documentos_generales_rf}, 
	${fld:mov_numero_documento},
  	(Select smn_documento_id from smn_cobranza.smn_documento where smn_documento_general_rf=${fld:smn_documentos_generales_rf}),
	(SELECT rco_numero_documento+1 FROM smn_cobranzas.smn_relacion_cobranza ORDER BY rco_numero_documento DESC LIMIT 1),
	${fld:smn_auxiliar_rf},
	${fld:mov_monto_ml},
	${fld:smn_moneda_rf},
	${fld:mov_monto_ma},
	null,
	null,
	${fld:mov_monto_ml},
	${fld:mov_monto_ma},
	'GE',
	'${def:locale}',
    '${def:user}',
    {d '${def:date}'},
    '${def:time}',
    ${fld:smn_entidad_rf},
    null,
    0,
    0,
    0,
    0,
    0,
    0,
    ${fld:smn_forma_pago_rf}
);
