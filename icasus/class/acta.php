<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/projects/icasus/)
// Archivo: clase/acta.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los cuadros de mandos o colecciones de indicadores 
//---------------------------------------------------------------------------------------------------

class acta extends ADOdb_Active_Record
{
	var $_table = 'actas';
	var $acuerdos;
	//	var $asistentes;
	var $tareas;
	var $entidad;
	var $usuarios;
	var $asuntos;
	var $rol;

	function load_joined($condicion){

		if ($this->load($condicion))
		{
			
			$acuerdo = new acuerdo();
			$acuerdo = $acuerdo -> find($condicion);
			$this -> acuerdos = $acuerdo;

      $tarea = new tarea();
      $tarea = $tarea -> find_join($condicion);
      $this -> tareas = $tarea;

      $entidad = new ado_entidad($_table);
			$entidad = $entidad -> find('id_entidad='.$this->id_entidad);
      $this -> entidad = $entidad;
		
			$usuario = new usuario_entidad();
			$usuarios = $usuario -> join_usuarios_asiste('id_entidad='.$this->id_entidad,$condicion);
			$this -> usuarios = $usuarios;

			$asunto = new asunto();
			$asuntos = $asunto -> find($condicion);
			$this -> asuntos = $asuntos;

			return true;
		}
		else
		{
			return false;
		}
	}
		function Find_joined($condicion)
		{
				if ($actas = $this->Find($condicion))
				{
						foreach($actas as $acta)
						{
								$entidad = new ado_entidad();
								$enti = $entidad ->find($condicion);
								//$acta->entidad  = $enti; carga  el array con todos los datos de cada unidad
								//en vez de solo el campo nombre
								$acta->entidad  = $enti[0]->nombre;
						}
				return $actas;
				}
				else
				{
				return false;
				}
}
		function ultima_acta ($condicion)
		{
				$db = $this->DB();
				$query="SELECT MAX(numero) as ultima FROM actas WHERE id_entidad = $condicion";
				$valor = $db->execute($query);
				return $valor->fields['ultima']+1;
		}
}
?>
