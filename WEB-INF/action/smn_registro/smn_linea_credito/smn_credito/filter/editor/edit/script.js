document.form1.smn_linea_credito_id.value='${fld:smn_linea_credito_id@#,###,###}';
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.cre_numero_documento.value='${fld:cre_numero_documento@#,###,###}';
setComboValue('cre_tipo_credito_id','${fld:cre_tipo_credito_id}','form1');
document.form1.cre_fecha_solicitud.value='${fld:cre_fecha_solicitud@dd-MM-yyyy}';
document.form1.cre_fecha_esperada_aprobacion.value='${fld:cre_fecha_esperada_aprobacion@dd-MM-yyyy}';
document.form1.cre_fecha_otorgamiento.value='${fld:cre_fecha_otorgamiento@dd-MM-yyyy}';
document.form1.cre_fecha_primera_cuota.value='${fld:cre_fecha_primera_cuota@dd-MM-yyyy}';
document.form1.cre_fecha_ultima_cuota.value='${fld:cre_fecha_ultima_cuota@dd-MM-yyyy}';
document.form1.cre_tasa_interes.value='${fld:cre_tasa_interes@#,###,##0.00}';
document.form1.cre_meses_credito.value='${fld:cre_meses_credito@#,###,##0.00}';
document.form1.cre_cantidad_cuotas.value='${fld:cre_cantidad_cuotas@#,###,##0.00}';
document.form1.cre_monto_solicitado_ml.value='${fld:cre_monto_solicitado_ml@#,###,##0.00}';
document.form1.cre_monto_credito_ml.value='${fld:cre_monto_credito_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.cre_monto_intereses_ml.value='${fld:cre_monto_intereses_ml@#,###,##0.00}';
document.form1.cre_monto_comision_ml.value='${fld:cre_monto_comision_ml@#,###,##0.00}';
document.form1.cre_monto_solicitado_ma.value='${fld:cre_monto_solicitado_ma@#,###,##0.00}';
document.form1.cre_monto_credito_ma.value='${fld:cre_monto_credito_ma@#,###,##0.00}';
document.form1.cre_monto_intereses_ma.value='${fld:cre_monto_intereses_ma@#,###,##0.00}';
document.form1.cre_monto_comision_ma.value='${fld:cre_monto_comision_ma@#,###,##0.00}';
setComboValue('cre_estatus_financiero','${fld:cre_estatus_financiero}','form1');
setComboValue('cre_estatus_proceso','${fld:cre_estatus_proceso}','form1');
document.form1.cre_fecha_registro.value='${fld:cre_fecha_registro@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_credito_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

