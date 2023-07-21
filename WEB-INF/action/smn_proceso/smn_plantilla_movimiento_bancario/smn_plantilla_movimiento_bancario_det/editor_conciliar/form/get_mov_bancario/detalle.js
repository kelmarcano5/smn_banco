var list = document.getElementById("detalle");
console.log(list);
document.getElementById("smn_mov_bancario_id").remove();
for(var i = (list.getElementsByTagName('input').length + list.getElementsByTagName('span').length + list.getElementsByTagName('br').length) - 1; 0 <= i; i--)
	

<smn_mov_bancario_rows>

//setCheckboxValue('smn_movimiento_bancario_id','${fld:smn_movimiento_bancario_id}','form1');

var checkbox = document.createElement('input');
checkbox.type = "checkbox";
checkbox.name = "smn_movimiento_bancario_id";
checkbox.id = "smn_movimiento_bancario_id";
checkbox.type = "checkbox";
checkbox.checked = false;
checkbox.value = "${fld:smn_movimiento_bancario_id}";
checkbox.style = "width: 10px";
checkbox.setAttribute("onclick","javascript:sumar('detalle','${fld:mov_monto_ml}',(this));");

var span = document.createElement('span')
span.id = "smn_movimiento_bancario_id";
span.appendChild(document.createTextNode(' ${fld:mov_descripcion_movimiento} | ${fld:mov_numero_documento} | ${fld:mov_monto_ml@##,###,##0.00}'));

var br = document.createElement('br');
br.id = "smn_movimiento_bancario_id";

detalle.appendChild(checkbox);
detalle.appendChild(span);
detalle.appendChild(br);

</smn_mov_bancario_rows>


