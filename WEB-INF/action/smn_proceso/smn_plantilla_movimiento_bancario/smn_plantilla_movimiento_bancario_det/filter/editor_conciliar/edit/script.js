var cl = '${fld:smn_cliente_rf}';
$('#smn_cliente_rf').val(cl).change();

document.form1.smn_plantilla_movimiento_bancario_id.value='${fld:smn_plantilla_movimiento_bancario_id@#,###,###}';
setComboValue('smn_equivalencia_doc_bancario_id','${fld:smn_equivalencia_doc_bancario_id}','form1');
  	
document.form1.pmd_fecha.value='${fld:pmd_fecha@dd-MM-yyyy}';
document.form1.pmd_numero_referencia_bancaria.value='${fld:pmd_numero_referencia_bancaria@js}';
setComboValue('smn_equivalencia_doc_bancario_id','${fld:smn_equivalencia_doc_bancario_id}','form1');
setComboValue('smn_tipo_documento_id','${fld:smn_tipo_documento_id}','form1');
document.form1.pmd_descripcion.value='${fld:pmd_descripcion@js}';
document.form1.pmd_monto.value=formatear_monto('${fld:pmd_monto@#,###,##0.00}'); //'${fld:pmd_monto@######0.00}';
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.pmd_monto_ma.value=formatear_monto('${fld:pmd_monto_ma@#,###,##0.00}'); //'${fld:pmd_monto_ma@######0.00}';
setComboValue('pmd_estatus','${fld:pmd_estatus}','form1');
document.form1.pmd_fecha_registro.value='${fld:pmd_fecha_registro@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_plantilla_movimiento_bancario_det_id@#,###,###}';

document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

setCheckboxValue('smn_mov_bancario_id','${fld:smn_mov_bancario_id}','form1');

 

 //alert("naturaleza desde el edit: "+nat);
function formatear_monto(monto)
	{
		var base = monto;
		base1 = base.replace('.','');
		base = base1.replace('.','');
		base1 = base.replace(',','.');
		
		return base1;
	}