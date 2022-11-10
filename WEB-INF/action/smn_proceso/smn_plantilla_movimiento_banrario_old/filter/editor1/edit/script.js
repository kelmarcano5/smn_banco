setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_banco_rf','${fld:smn_banco_rf}','form1');
setComboValue('smn_cuenta_bancaria_rf','${fld:smn_cuenta_bancaria_rf}','form1');
setComboValue('pmb_estatus','${fld:pmb_estatus}','form1');
document.form1.pmb_fecha_registro.value='${fld:pmb_fecha_registro@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_plantilla_movimiento_bancario@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

