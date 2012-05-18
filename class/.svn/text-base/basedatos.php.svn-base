<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: clase_base_datos.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona las conexiones con la base de datos, lanza consultas y 
// devuelve los resultados en un array.
//---------------------------------------------------------------------------------------------------

class basedatos 
{
	var $conexion;
	var $resultado_consulta;
	var $filas_implicadas; 
	var $fila;
	var $error;

	//El constructor de la clase genera una conexion con el servidor y la bases de datos especificada
	function basedatos($host, $usuario, $password,$database)
	{
		//Abrimos una conexion a la base de datos, la arroba es para callar a la funcion y que no devuelva error
		if ($this->conexion = mysql_connect($host,$usuario, $password)) 
		{
			//Seleccionamos la base de datos
			if (mysql_select_db($database, $this->conexion)) 
			{
				return true;
			}
			else									
			{
				echo 'Error al conectar con la base de datos';
				return false;
			}
		}	
		else
		{
			echo 'Error al conectar con la base de datos';
			return false;
		}
	}

	// Realiza una consulta a la base de datos a partir de una sentencia sql recibida
	// Almacena en filas_implicadas el numero de filas implicadas en la consulta
	function ejecutar_consulta($consulta) 
	{
		//echo "<small>$consulta</small>"; 
		if ($this->resultado_consulta = mysql_query($consulta, $this->conexion))
		{ 
			if (substr($consulta,0,6) == "SELECT") 
			{
				$this->filas_implicadas = mysql_num_rows($this->resultado_consulta);
			}
			else 
			{
				$this->filas_implicadas = mysql_affected_rows();
			}
			return true;
		}
		else 
		{
		   $this->error = "Error al ejecutar la consulta: " . $consulta;
		   return false;
		}
	}

	//Nos da la ultima ID que se ha creado en la base de datos
	function obtener_ultima_id() 
	{
	   return mysql_insert_id();
	}
	
	
	//Da un paso dentro del array de datos obtenidos para extraer la siguiente fila o registro, 
	//almacena dicho registro en la propiedad $fila de la clase
	function obtener_fila() 
	{
		$this->fila = mysql_fetch_array($this->resultado_consulta);
		if (empty($this->fila))
			return false;
		else
			return true;
	}

	/*	
	// Convierte fecha de mysql a espana
	function fecha_sql_es($fecha)
	{
    	ereg( "([0-9]{2,4})-([0-9]{1,2})-([0-9]{1,2})", $fecha, $array_fecha);
	 	$fecha_cambiada = $array_fecha[3]."/".$array_fecha[2]."/".$array_fecha[1];
		return $fecha_cambiada;
	}

	//Convierte fecha de espana a mysql
	function fecha_es_sql($fecha)
	{
    	ereg( "([0-9]{1,2})/([0-9]{1,2})/([0-9]{2,4})", $fecha, $array_fecha);
	   	$fecha_cambiada = $array_fecha[3]."-".$array_fecha[2]."-".$array_fecha[1];
	   	return $fecha_cambiada;
	}
	*/				

	//Libera la conexion con la base de datos
	function desconectar()
	{
		mysql_close($this->conexion);
	}
	
}

?>
