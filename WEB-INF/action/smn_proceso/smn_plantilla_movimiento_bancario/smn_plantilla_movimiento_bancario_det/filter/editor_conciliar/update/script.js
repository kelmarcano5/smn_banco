//addNew();
//alertBox ('${lbl:b_record_updated}', '${lbl:b_continue_button}', null, 'setFocusOnForm("form1"); search();');
//search();
 var idsta = document.form1.id.value;

 //alert(idsta);

setTimeout(function(){ 
	actualizar(idsta); 
}, 1000);


function actualizar(id) {
	var uri="${def:actionroot}/updatestatus?id=" + id;
	ajaxCall(httpMethod="GET", 
		uri,
		divResponse=null, 
		divProgress="status", 
		formName=null, 
		afterResponseFn=mensaje(), 
		onErrorFn=null);	
}

function mensaje() {
	alertBox('El registro fue modificado de la base de datos', 'Continuar', null, 'parent.search(); parent.closeDialog();');
}

