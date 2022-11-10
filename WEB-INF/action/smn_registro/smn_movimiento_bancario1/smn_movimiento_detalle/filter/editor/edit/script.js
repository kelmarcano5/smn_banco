document.form1.smn_movimiento_bancario_id.value='${fld:smn_movimiento_bancario_id@#,###,###}';
setComboValue('dmo_tipo_movimiento','${fld:dmo_tipo_movimiento}','form1');
document.form1.dmo_monto_ml.value='${fld:dmo_monto_ml@#,###,##0.00}';
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_concepto_id','${fld:smn_concepto_id}','form1');
document.form1.dmo_monto_ma.value='${fld:dmo_monto_ma@#,###,##0.00}';
document.form1.dmo_fecha_registro.value='${fld:dmo_fecha_registro@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_movimiento_detalle_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");