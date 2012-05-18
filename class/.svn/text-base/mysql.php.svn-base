<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: clase_mysql.php
// Tipo: definición de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es)
//---------------------------------------------------------------------------------------------------
// Descripción: Provee una conexión a una base de datos mysql
//---------------------------------------------------------------------------------------------------

class mysql {
	var $database;
	var $host;
	var $usuario;
	var $password;
	var $manejador;
	var $resultado_consulta;
	var $datos;
	
	//Realiza la conexión con la base de datos
	function conecta($database, $host, $usuario, $password){
		$this->database = $database;
		$this->host	  = $host;
		$this->usuario	  = $usuario;
		$this->password	  = $password;
		//La arroba es para callar a la función y que no devuelva error
		$this->manejador  = @mysql_connect($this->host, $this->usuario, $this->password) or die("error 0 ".mysql_error()); 
		
		if ($this->manejador!=false) {
			$seleccion = mysql_select_db($this->database, $this->manejador) or die("error 1 ".mysql_error());
			return true;
			}
		else
			return false;
		
		}
		
	//Realiza la consulta a la base de datos	
	function consulta($query) {
		$this->resultado_consulta = mysql_query($query, $this->manejador) or die("error2 : ".mysql_error().$query);
		}
		
	//Nos da la última ID que se ha creado en la base de datos
	function obtener_ultima_id() {
		return mysql_insert_id ($this->manejador);
		}
		
	function siguiente_fila() {
		$this->datos = mysql_fetch_array($this->resultado_consulta);
		if (empty($this->datos))
			return false;
		else
			return true;
		}

	function desconecta($manejador){
		mysql_close($manejador);
		}
	}

?>
