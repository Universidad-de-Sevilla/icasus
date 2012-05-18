<?php
//-----------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: class/permiso.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín Corredera (jjmc@us.es)
//-----------------------------------------------------------------------------------
// Descripcion:  
// Gestiona  los permisos que tiene cada usuario en el sistema
//-----------------------------------------------------------------------------------

class permiso 
{

   var $database; //objeto de conexion a la base de datos
   var $error; //propiedad de uso interno para almacenar los errores

   // Constructor de la clase
   function permiso($database) 
   {
      $this->database = $database;
   }

	// Asignar permisos a un usuario
	function conceder($page,$id_objeto,$id_usuario)
	{
		$consulta = "INSERT INTO permiso (page, id_objeto, id_usuario) 
			VALUES('$page', $id_objeto, $id_usuario)";
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	// Quitar permisos a un usuario
	function denegar($page,$id_objeto,$id_usuario)
	{
		$consulta = "DELETE FROM permiso WHERE page='$page' AND id_objeto=$objeto AND id_usuario=$id_usuario"; 
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	//Lista los permisos concedidos a un usuario
	function listar_concedidos($id_usuario)
	{
		$permisos = array();
		$consulta = "SELECT * FROM permiso WHERE id_usuario=$id_usuario";
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0)
		{
			while ($this->database->obtener_fila())
			{
				$permisos[] = $this->database->fila; 
			}
			return $permisos;

		}
		else
		{
			return false;
		}

	}
}
?>
