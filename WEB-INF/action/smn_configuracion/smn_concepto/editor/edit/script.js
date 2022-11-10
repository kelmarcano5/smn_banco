document.form1.con_codigo.value='${fld:con_codigo@js}';
document.form1.con_descripcion.value='${fld:con_descripcion@js}';
document.form1.con_tabla.value='${fld:con_tabla@js}';
document.form1.con_campo.value='${fld:con_campo@js}';
setComboValue('con_estatus','${fld:con_estatus}','form1');
document.form1.con_vigencia.value='${fld:con_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_concepto_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.con_codigo.disabled=true;
 

