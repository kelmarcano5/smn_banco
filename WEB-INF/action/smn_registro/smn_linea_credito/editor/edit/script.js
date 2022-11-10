document.form1.lcr_codigo.value='${fld:lcr_codigo@js}';
document.form1.lcr_descripcion.value='${fld:lcr_descripcion@js}';
setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_entidad_financiera_id','${fld:smn_entidad_financiera_id}','form1');
setComboValue('smn_cuenta_bancaria_rf','${fld:smn_cuenta_bancaria_rf}','form1');
document.form1.lcr_monto_linea_ml.value='${fld:lcr_monto_linea_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.lcr_monto_linea_ma.value='${fld:lcr_monto_linea_ma@#,###,##0.00}';
document.form1.lcr_saldo_disponible.value='${fld:lcr_saldo_disponible@#,###,##0.00}';
setComboValue('lcr_estatus','${fld:lcr_estatus}','form1');
document.form1.lcr_vigencia.value='${fld:lcr_vigencia@dd-MM-yyyy}';
document.form1.lcr_fecha_registro.value='${fld:lcr_fecha_registro@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_linea_credito_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.lcr_codigo.disabled=true;
 

