var ent = '${fld:smn_entidad_rf}';
$('#smn_entidad_rf').val(ent).change();

var suc = '${fld:smn_sucursal_rf}';
$('#smn_sucursal_rf').val(suc).change();

var ban = '${fld:smn_banco_rf}';
$('#smn_banco_rf').val(ban).change();

var cuen = '${fld:smn_cuenta_bancaria_rf}';
$('#smn_cuenta_bancaria_rf').val(cuen).change();

setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_banco_rf','${fld:smn_banco_rf}','form1');
setComboValue('smn_cuenta_bancaria_rf','${fld:smn_cuenta_bancaria_rf}','form1');
document.form1.pmb_fecha_movimiento.value='${fld:pmb_fecha_movimiento@dd-MM-yyyy}';
setComboValue('pmb_estatus','${fld:pmb_estatus}','form1');
document.form1.id.value='${fld:smn_plantilla_movimiento_bancario_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

