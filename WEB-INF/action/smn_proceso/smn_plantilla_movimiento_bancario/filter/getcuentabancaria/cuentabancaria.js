listboxClear("smn_cuenta_bancaria_rf");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "";
document.form1.smn_cuenta_bancaria_rf.add(optionChoose, 0);

<smn_cuenta_bancaria_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_cuenta_bancaria_rf.add(option, 0);
</smn_cuenta_bancaria_rf_rows>
