<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/projects/icasus/)
// Archivo: clase/log.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: registra la actividad de los usuarios en icasus
//---------------------------------------------------------------------------------------------------

class Log extends ADOdb_Active_Record
{
	var $_table = 'logs';
	var $usuario;

	function add($page,$id_objeto,$id_usuario)
	{
		$this->page = $page;
		$this->id_objeto = $id_objeto;
		$this->id_usuario = $id_usuario;
		$this->fecha = time();
		if ($this->save())
		{
			return true;
		}
		else
		{	
			return false;
		}
	}

	function Find_joined($criterio)
	{
		if ($logs = $this->Find($criterio))
		{
			foreach ($logs as $log)
			{
				$log->usuario = new ado_usuario();
				$log->usuario->load("id_usuario = $log->id_usuario");
			}
			return $logs;
		}	
		else
		{
			return false;
		}
	}
}

