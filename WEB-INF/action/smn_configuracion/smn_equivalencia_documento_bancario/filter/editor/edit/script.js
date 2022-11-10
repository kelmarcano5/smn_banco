setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('smn_entidad_financiera_id','${fld:smn_entidad_financiera_id}','form1');
document.form1.edb_doc_equiv_bancario.value='${fld:edb_doc_equiv_bancario@js}';
setComboValue('smn_tipo_documento_id','${fld:smn_tipo_documento_id}','form1');
document.form1.edb_descrip_bancaria.value='${fld:edb_descrip_bancaria@js}';
setComboValue('edb_estatus','${fld:edb_estatus}','form1');
document.form1.edb_vigencia.value='${fld:edb_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_equivalencia_doc_bancario_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

