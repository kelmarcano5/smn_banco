setComboValue('smn_documento_general_rf','${fld:smn_documento_general_rf}','form1');
setComboValue('smn_tipo_documento_id','${fld:smn_tipo_documento_id}','form1');
document.form1.doc_codigo.value='${fld:doc_codigo@js}';
document.form1.doc_descripcion.value='${fld:doc_descripcion@js}';
setComboValue('doc_tipo_movimiento','${fld:doc_tipo_movimiento}','form1');
setComboValue('doc_maneja_moneda_alterna','${fld:doc_maneja_moneda_alterna}','form1');
setComboValue('doc_transferencia','${fld:doc_transferencia}','form1');
setComboValue('smn_documento_origen_id','${fld:smn_documento_origen_id}','form1');
setComboValue('smn_documento_destino_id','${fld:smn_documento_destino_id}','form1');
setComboValue('smn_forma_pago_id','${fld:smn_forma_pago_rf}','form1');
setComboValue('doc_estatus','${fld:doc_estatus}','form1');
document.form1.doc_vigencia.value='${fld:doc_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_documento_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.doc_codigo.disabled=true;
 

