document.form1.tdo_codigo.value='${fld:tdo_codigo@js}';
document.form1.tdo_descripcion.value='${fld:tdo_descripcion@js}';
setComboValue('tdo_estatus','${fld:tdo_estatus}','form1');
document.form1.tdo_vigencia.value='${fld:tdo_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_tipo_documento_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.tdo_codigo.disabled=true;
 

