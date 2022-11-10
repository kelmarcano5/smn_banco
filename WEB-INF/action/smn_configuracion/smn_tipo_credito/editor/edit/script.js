document.form1.tcr_codigo.value='${fld:tcr_codigo@js}';
document.form1.tcr_descripcion.value='${fld:tcr_descripcion@js}';
setComboValue('tcr_metodo_calculo','${fld:tcr_metodo_calculo}','form1');
setComboValue('tcr_estatus','${fld:tcr_estatus}','form1');
document.form1.tcr_vigencia.value='${fld:tcr_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_tipo_credito_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.tcr_codigo.disabled=true;
 

