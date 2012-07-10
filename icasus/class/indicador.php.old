<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/projects/icasus/)
// Archivo: clase_indicador.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los indicadores 
//---------------------------------------------------------------------------------------------------

class indicador 
{
   //Parametros del indicador 
   var $id_indicador;
   var $datos = array(); //almacena los datos del indicador
   var $valores = array(); //almacena los valores del indicador
   var $database;
   var $error; //recoge los errores internos, solo sirve para debug
   
   //----------------------------------------------------------------
   //Metodos de la clase
   //----------------------------------------------------------------

	// Constructor de la clase
	function indicador ($database) 
	{
		$this->database = $database;
	}
	
	// Copia un indicador desde el catalogo de indicadores
    function copiar ($id_indicador,$id_entidad)
	{
		// Buscamos el indicador que corresponde a esta id para copiarlo
		$consulta = "SELECT * FROM indicador WHERE id_indicador = $id_indicador";
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->obtener_fila())
		{	
			$indicador = $this->database->fila;
			$consulta = 'INSERT INTO indicador (id_entidad, 
				id_responsable, 
				id_proceso, 
				codigo, 
				nombre, 
				objetivo,
				descripcion, 
				formulacion, 
				fuente, 
				periodicidad) 
				VALUES (' . $id_entidad . ',' . 
				$indicador['id_responsable'] . ',' . 
				$indicador['id_proceso'] .',"' .  
				$indicador['codigo'] . '","' . 
				$indicador['nombre'] . '","' . 
				$indicador['objetivo'] . '","' . 
				$indicador['descripcion'] . '","' .
				$indicador['formulacion'] . '","' .
				$indicador['fuente'] . '",' . 
				$indicador['periodicidad'] . ')';

			if ($this->database->ejecutar_consulta($consulta))
			{
			    return true; 
			}
			else
			{
			    // Si no se ha podido copiar
				return false;
			}
		}
		else
		{
			// Si no se encuentra un indicador con esta id
			return false;
		}

	}	

	//Graba un nuevo indicador en la base de datos comprobando duplicados
	function crear ($id_entidad,$id_proceso,$codigo,$nombre,$objetivo,$objetivo_carta,
		$objetivo_estrategico,$descripcion,$formulacion,$fuente,$periodicidad,$id_responsable,$id_visibilidad) 
	{
		//Comprueba que el nombre o el codigo del indicador no este duplicado para esta entidad
		$consulta = "SELECT * FROM indicador WHERE (nombre='$nombre' OR codigo='$codigo') AND id_entidad=$id_entidad";
		$this->database->ejecutar_consulta($consulta); 
		//Si la consulta viene llena devuelve un error
		if ($this->database->obtener_fila()) 
		{
            $this->error = 'El nombre o el código del indicador ya existe para esta entidad';
            return false;
		}	 
		else
		{ 
		  //Ahora ya puedo grabar en la base de datos
			$consulta = "INSERT INTO indicador (id_entidad,
				id_proceso,
				codigo,
				nombre,
				objetivo,
				objetivo_carta,
				objetivo_estrategico,
				descripcion, 
				formulacion,
				fuente,
				periodicidad,
				id_responsable,
				id_visibilidad) 
				VALUES ($id_entidad,
					$id_proceso,
					'$codigo',
					'$nombre',
					'$objetivo',
					'$objetivo_carta',
					'$objetivo_estrategico',
					'$descripcion',
					'$formulacion', 
					'$fuente',
					'$periodicidad',
					$id_responsable,
					$id_visibilidad)";

		  $this->database->ejecutar_consulta($consulta); 
		  $this->id_indicador = $this->database->obtener_ultima_id();
		  return $this->id_indicador;
		}
	}	   

	// Obtiene los datos de un indicador, los devuelve en forma de array y los almacena en la propiedad $datos
   function obtener_datos($id_indicador)
   {
	  $consulta = 'SELECT id_visibilidad,id_indicador, i.id_entidad as id_entidad, i.nombre as nombre, i.descripcion as descripcion, 
		i.codigo as codigo, e.nombre as entidad, d.nombre as dimension, 
		formulacion, fuente, objetivo, objetivo_estrategico, objetivo_carta, periodicidad, 
		i.id_responsable as id_responsable,
		u.nombre as nombre_responsable, u.apellidos as apellidos_responsable, 
		p.id_proceso as id_proceso, p.nombre as proceso, p.codigo as codigo_proceso, v.nombre as visibilidad
		FROM indicador i 
		INNER JOIN entidad e ON i.id_entidad = e.id_entidad
		INNER JOIN usuario u ON i.id_responsable = u.id_usuario 
		INNER JOIN proceso p ON i.id_proceso = p.id_proceso 
		LEFT JOIN dimension d ON i.id_dimension = d.id 
		LEFT JOIN visibilidad v ON i.id_visibilidad = v.id  
		WHERE id_indicador=' . $id_indicador;
	  $this->database->ejecutar_consulta($consulta);
	  if ($this->database->filas_implicadas > 0) 
	  {
			$this->database->obtener_fila();
			$this->datos = $this->database->fila;
			return $this->datos;
	  }   
	  else 
	  {
      	$this->error = "No se encuentra ningun indicador con este identificador";
        return false;
      }
   }
	// Obtiene los valores introducidos en este indicador con la fecha de recogida como campo clave
	function obtener_valores()
	{	
    
		$consulta = "SELECT * FROM valor WHERE id_indicador = $this->id_indicador ORDER BY fecha_recogida";
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0) 
		{
			while ($this->database->obtener_fila()) 
			{
				$this->valores[$this->database->fila['fecha_recogida']] = $this->database->fila;
			}
			return $this->valores;
		}
		else
		{
			return false;
		}
	}
	 
	// Actualiza en la base de datos los datos del indicador que estamos editando
	function modificar($codigo, $nombre, $objetivo, $objetivo_estrategico, $objetivo_carta, $descripcion, 
		$formulacion, $fuente, $periodicidad, $id_responsable,$id_indicador,$id_proceso,$id_visibilidad) 
	{
		$consulta = "UPDATE indicador SET nombre='$nombre',
		  codigo = '$codigo',		
		  id_proceso = $id_proceso,	
		  descripcion = '$descripcion',
		  fuente = '$fuente',
		  formulacion = '$formulacion',
		  periodicidad = '$periodicidad',
		  objetivo = '$objetivo',
		  objetivo_estrategico = '$objetivo_estrategico',
		  objetivo_carta = '$objetivo_carta',
		  id_responsable = $id_responsable ,
		  id_visibilidad = $id_visibilidad
		  WHERE id_indicador = $id_indicador";
	  if ($this->database->ejecutar_consulta($consulta)) 
	  {
         return true;
	  }
	  else 
	  {
		$this->error = "No se ha podido actualizar el indicador";
        return false;
	  }
    }

    //Lista los valores recogidos para un indicador
	function listar_valores($id_indicador) 
	{
        $valores = array();
		$consulta = "SELECT * FROM valor WHERE id_indicador = $id_indicador ORDER BY fecha_recogida";
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0) 
		{
			while ($this->database->obtener_fila()) 
			{
				$valores[] = $this->database->fila;
			}
			return $valores;
		}
		else
		{
			return false;
		}
	}

	// Borra un indicador de la base de datos, comprueba antes que no tenga valores asociados
	function borrar($id_indicador)
	{
		$consulta = "SELECT * FROM valor WHERE id_indicador = $id_indicador";

		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0) 
		{
			$this->error = 'No se puede borrar un indicador con valores asociados, borre antes los valores.';
			return false;
		}
		else
		{
			$consulta = "DELETE FROM indicador WHERE id_indicador = $id_indicador";
			$this->database->ejecutar_consulta($consulta);
			return true;
		}
	}
   // Devuelve la lista de dimensiones de calidad definidas en la base de datos
   function listar_dimensiones()
   {
		$dimensiones = array();
		$consulta = 'SELECT * FROM dimension ORDER BY nombre';
		$this->database->ejecutar_consulta($consulta);
		while ($this->database->obtener_fila())
		{
			$dimensiones[] = $this->database->fila;
		}	
		return $dimensiones;		
   }
}      
?>
