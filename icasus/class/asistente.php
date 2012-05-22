<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/projects/icasus/)
// Archivo: clase/asistente.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los cuadros de mandos o colecciones de indicadores 
//---------------------------------------------------------------------------------------------------

class asistente extends ADOdb_Active_Record
{
	var $_table = 'acta_asistentes';
	var $nombre;

	function find_join($condicion)
		{
			$asistentes = $this->find($condicion);
			foreach ($asistentes as $asiste)
				{
				$id_usuario = $asiste->id_usuario;
				$usuario = new ado_usuario();
				$usuario -> load ('id_usuario='.$id_usuario);
				$asiste->nombre = $usuario->nombre." ".$usuario->apellidos;
				}
			return $asistentes;
		}
}
?>
