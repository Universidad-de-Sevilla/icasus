<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/projects/icasus/)
// Archivo: clase/asunto.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los asuntos, ordenes del día de las comvocatorias
//---------------------------------------------------------------------------------------------------

class asunto extends ADOdb_Active_Record
{
	var $_table = 'acta_asuntos';

	function borrar($condicion)
	{
		$this->load($condicion);
        	if ($this->delete())
        	{
       		     	return true;
        	}
        	else
        	{
       			return false;   
		}
	}
function ultimo_asunto ($condicion)
{
	$db = $this->DB();
	$query="SELECT MAX(numero) as ultimo FROM acta_asuntos WHERE id_acta = $condicion";
	$valor = $db->execute($query);
	return $valor->fields['ultimo']+1;
}


}
?>
