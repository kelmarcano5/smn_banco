select smn_tipo_documento_id as id, tdo_codigo||' - '||tdo_descripcion as item 
from smn_banco.smn_tipo_documento order by smn_tipo_documento_id 