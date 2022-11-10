setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_cuenta_bancaria_rf','${fld:smn_cuenta_bancaria_rf}','form1');
setComboValue('smn_entidad_financiera_id','${fld:smn_entidad_financiera_id}','form1');
// setComboValue('smn_documentos_generales_rf','${fld:smn_documentos_generales_rf}','form1');
// document.form1.mov_numero_documento.value='${fld:mov_numero_documento@#,###,###}';
// setComboValue('smn_modulo_origen_rf','${fld:smn_modulo_origen_rf}','form1');
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('smn_tipo_documento_id','${fld:smn_tipo_documento_id}','form1');
// document.form1.mov_numero_documento_modulo.value='${fld:mov_numero_documento_modulo@#,###,###}';
// setComboValue('smn_equivalencia_doc_bancario_id','${fld:smn_equivalencia_doc_bancario_id}','form1');
document.form1.mov_descripcion_movimiento.value='${fld:mov_descripcion_movimiento@js}';
document.form1.mov_beneficiario_pago.value='${fld:mov_beneficiario_pago@js}';
setComboValue('mov_tipo_movimiento','${fld:mov_tipo_movimiento}','form1');
document.form1.mov_monto_ml.value='${fld:mov_monto_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.mov_fecha_registro.value='${fld:mov_fecha_documento@dd-MM-yyyy}';
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
// document.form1.mov_monto_ma.value='${fld:mov_monto_ma@#,###,##0.00}';
// document.form1.mov_fecha_entrega.value='${fld:mov_fecha_entrega@dd-MM-yyyy}';
// document.form1.mov_fecha_disponible.value='${fld:mov_fecha_disponible@dd-MM-yyyy}';
// setComboValue('mov_estatus_proceso','${fld:mov_estatus_proceso}','form1');
// setComboValue('mov_estatus','${fld:mov_estatus}','form1');
document.form1.mov_fecha_registro.value='${fld:mov_fecha_registro@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_movimiento_bancario_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

