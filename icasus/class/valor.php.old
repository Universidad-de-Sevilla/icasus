<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: class/valor.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los valores recogidos para cada indicador
//---------------------------------------------------------------------------------------------------

class valor extends ADOdb_Active_Record 
{
   //----------------------------------------------------------------
   //Propiedades de la clase
   //----------------------------------------------------------------
   var $id_valor;
   var $datos = array();
   var $database;
   var $error;
   
   //----------------------------------------------------------------
   //Metodos de la clase
   //----------------------------------------------------------------
   // Constructor de la clase
   function valor ($database = null) 
   {
      	$this->database = $database;
   }
	
   //Graba un nuevo valor en la base de datos comprobando duplicados
   function crear ($id_indicador, $id_usuario, $valor, $periodo, $fecha_recogida, $objetivo, 
	   $objetivo_carta, $objetivo_estrategico) 
   {
      $fecha_entrada = time(); 
	  $consulta = "INSERT INTO valor (id_indicador,id_usuario,valor,periodo,
		  fecha_recogida,fecha_entrada, objetivo, objetivo_carta, objetivo_estrategico) 
		  VALUES ($id_indicador,$id_usuario,$valor,'$periodo',$fecha_recogida,
		  $fecha_entrada,$objetivo, $objetivo_carta, $objetivo_estrategico)";
      $this->database->ejecutar_consulta($consulta); 
      // Si la consulta ha tenido exito obtenemos el identificador del nuevo valor
	  if ($this->database->filas_implicadas > 0) 
	  { 
        $this->id_valor = $this->database->obtener_ultima_id();
        return true;
	  }
	  else 
	  {
        $this->error = "No ha sido posible grabar los datos en el sistema";
        return false;
      }
   }	   
   
   function obtener_datos($id_valor)
   {
      $consulta = "SELECT * FROM valor WHERE id_valor=$id_valor";
      $this->database->ejecutar_consulta($consulta);
	  if ($this->database->filas_implicadas > 0) 
	  {
		$this->database->obtener_fila();
		$this->datos = $this->database->fila;
		$this->id_valor = $this->datos["id_valor"];
		return $this->datos;
	  }   
	  else 
	  {
      	$this->error = "No se encuentra ningun valor con este identificador";
        return false;
	  }
   }
   
   function modificar($id_valor, $id_usuario, $valor, $fecha_recogida, $objetivo, $objetivo_estrategico, $objetivo_carta)
   {
	   $consulta = "UPDATE valor SET valor = $valor, objetivo = $objetivo, 
			objetivo_estrategico = $objetivo_estrategico, objetivo_carta = $objetivo_carta, 
			fecha_recogida = $fecha_recogida, id_usuario = $id_usuario 
			WHERE id_valor = $id_valor";
       $this->database->ejecutar_consulta($consulta);
	   if ($this->database->filas_implicadas > 0) 
	   {
         return true;
	   }
       else
	   {
	      $this->error = "No ha sido posible actualizar los datos del valor";
		  return false;
       }
   }
	
   function borrar($id_valor)
   {
	   $consulta = "DELETE FROM valor WHERE id_valor=$id_valor";
	   $this->database->ejecutar_consulta($consulta);
	   if ($this->database->filas_implicadas > 0) 
	   {
		   return true;
	   }
       else
	   {
	      $this->error = "No ha sido posible borrar el valor";
		  return false;
       }
   }

}      
?>
