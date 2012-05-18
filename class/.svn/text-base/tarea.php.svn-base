<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/projects/icasus/)
// Archivo: clase/acta.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los cuadros de mandos o colecciones de indicadores 
//---------------------------------------------------------------------------------------------------

class tarea extends ADOdb_Active_Record
{
	var $_table = 'acta_tareas';
	var $nombre;
	function borrar($condicion)
	{
    	//$db = $this->DB();
       	//$query="DELETE FROM acta_tareas WHERE ".$condicion;
       	//$db->execute($query);
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
 	function find_join($condicion)
                { 
                        $tareas = $this->find($condicion);
                        foreach ($tareas as $tarea)
                                {
                                $id_usuario = $tarea->id_usuario;
                                $usuario = new ado_usuario();
                                $usuario -> load ('id_usuario='.$id_usuario);
                                $tarea->nombre = $usuario->nombre." ".$usuario->apellidos;
                                }
			return $tareas;
                }

function ultima_tarea ($condicion)
{
    $db = $this->DB();
    $query="SELECT MAX(numero) as ultima FROM acta_tareas WHERE id_acta = $condicion";
    $valor = $db->execute($query);
    return $valor->fields['ultima']+1;
}


}
?>
