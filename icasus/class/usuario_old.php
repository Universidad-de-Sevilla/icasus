<?php
//-----------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: class/usuario.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín Corredera (jjmc@us.es)
//-----------------------------------------------------------------------------------
// Descripcion:  
// Gestiona el inicio de sesión, graba los datos de un nuevo usuario
// en la base de datos y almacena los datos del usuario que accede a la aplicacion.
//-----------------------------------------------------------------------------------

class usuario 
{
	var $id_usuario;
	var $datos = array();
	var $entidades = array();
	var $grupos = array();
	var $error;
	var $database;
	
	function usuario($database) 
	{
		$this->database = $database;
	}

	//Busca los datos de un usuario en la base de datos en funcion de su identificador
	function obtener_datos ($id_usuario) 
	{
		$consulta = "SELECT *  FROM usuario WHERE id_usuario=" . $id_usuario;
		//$consulta = "SELECT id_usuario, login, clave, nombre, apellidos, nif, correo, telefono, mis_notas FROM usuario WHERE id_usuario=" . $id_usuario;
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0) 
		{
		    $this->database->obtener_fila();
			$this->datos = $this->database->fila;
			$this->id_usuario = $id_usuario;
			return $this->datos;
		}
		else 
		{
			$this->error = "ERROR: No se encuentra el usuario en la base de datos";
			return false;
		}
	}

	// Devuelve una lista de todos los usuarios del sistema en base  a un criterio
	function listar($criterio) 
	{
		$lista_usuarios = array();
		$consulta = "SELECT * FROM usuario $criterio ORDER BY login";
		$this->database->ejecutar_consulta($consulta);
		while ($this->database->obtener_fila()) 
		{
			$lista_usuarios[] = $this->database->fila;
	    }   
		return $lista_usuarios;
	}
    
	//Devuelve un array con los identificadores de entidades a las que pertenece este usuario y los roles asociados
	//  rol 1 - responsable
	//  rol 2 - miembro
	//  rol 3 - asesor
	//  Se pordrán definir más roles en la base de datos
	function obtener_entidades($id_usuario) 
	{
		$consulta = "SELECT e.codigo as codigo, e.id_entidad as id_entidad, 
				e.nombre as nombre, r.nombre as rol
				FROM usuario_entidad ue INNER JOIN entidad e ON ue.id_entidad = e.id_entidad
				INNER JOIN rol r ON r.id_rol = ue.id_rol 
				WHERE e.id_padre != 221  AND ue.id_usuario=$id_usuario ORDER BY codigo";
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0) 
		{
			$entidades = array();
			while ($this->database->obtener_fila()) 
			{
				$entidades[] = $this->database->fila;
			}
			return $entidades;
			
		}
		else
	   	{
			$this->error = "AVISO: este usuario no tiene entidades asignadas";
			return false;
		}
	}

    /*
	//Devuelve un array con los identificadores de entidades a las que pertenece este usuario y las subentidades asociadas
	function obtener_cascada_entidades($id_usuario) 
	{
		$consulta = "SELECT e.codigo as codigo, e.id_entidad as id_entidad, 
				e.nombre as nombre, r.nombre as rol
				FROM usuario_entidad ue INNER JOIN entidad e ON ue.id_entidad = e.id_entidad
				INNER JOIN rol r ON r.id_rol = ue.id_rol 
				WHERE e.id_padre != 221  AND ue.id_usuario=$id_usuario ORDER BY codigo";
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0) 
		{
			$entidades = array();
			while ($this->database->obtener_fila()) 
			{
				$entidades[] = $this->database->fila;
			}
			return $entidades;
			
		}
		else
	   	{
			$this->error = "AVISO: este usuario no tiene entidades asignadas";
			return false;
		}
	}
    */


	//Devuelve un array con los identificadores de los grupo y las que pertenece este usuario y los roles asociados    	
	function obtener_grupos($id_usuario)
        {
                $consulta = "SELECT e.codigo as codigo, e.id_entidad as id_entidad, 
                                e.nombre as nombre, r.nombre as rol
                                FROM usuario_entidad ue INNER JOIN entidad e ON ue.id_entidad = e.id_entidad
                                INNER JOIN rol r ON r.id_rol = ue.id_rol 
                                WHERE e.id_padre = 221  AND ue.id_usuario=$id_usuario  ORDER BY codigo";
                                //WHERE e.id_padre = 221  AND ue.id_usuario=$id_usuario AND ue.id_rol = 1 ORDER BY codigo";
                $this->database->ejecutar_consulta($consulta);
                if ($this->database->filas_implicadas > 0)
                {
                        $entidades = array();
                        while ($this->database->obtener_fila())
                        {
                                $entidades[] = $this->database->fila;
                        }
                        return $entidades;

		}
                else
                {
                        $this->error = "AVISO: este usuario no tiene grupos";
                        return false;
                }
        }

	//Comprueba login y clave, devuelve el identificador del usuario
	function comprobar_login($login,$clave) 
	{
		$consulta = "SELECT id_usuario FROM usuario WHERE login='$login' AND clave='$clave'";
	
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0)
	   	{
			$this->database->obtener_fila();
			$id_usuario = $this->database->fila["id_usuario"];
			return $id_usuario;
		}
		else 
		{
			$this->error = "El nombre de usuario o la clave son incorrectos.";
			return false;
		}
		
	}
		
	//Escribe los datos de un nuevo usuario en la base de datos
	function crear ($login, $clave, $nombre, $apellidos, $nif, $correo, $telefono)
   	{
		//Comprueba que no exista un usuario con el mismo login en el sistema
		$consulta = "SELECT * FROM usuario WHERE login='$login'";

		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0) 
		{
			$this->error = "El login '$login' está duplicado en el sistema";
			return false;
		}
		
		//Comprueba que no exista un usuario con el mismo nif en el sistema
		$consulta = "SELECT * FROM usuario WHERE nif='$nif'";

		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0) 
		{
			$this->error = "El nif '$nif' está duplicado en el sistema";
			return false;
		}
		
	    //Grabamos el nuevo usuario en la base de datos
		$consulta = "INSERT INTO usuario (nombre,apellidos,nif,login,clave,correo, telefono)  
			VALUES ('$nombre','$apellidos','$nif','$login','$clave','$correo','$telefono')";

		$this->database->ejecutar_consulta($consulta);
		
		if ($this->database->filas_implicadas > 0)
		{
			//Obtenemos el identificador del nuevo usuario
			$this->id_usuario = $this->database->obtener_ultima_id();
			/*//Grabamos las entidad que se le ha asignado
			$consulta = "INSERT INTO usuario_entidad (id_usuario, id_entidad, id_rol) ";
			$consulta .= "VALUES (" . $this->id_usuario . "," . $id_entidad . ",'" . $id_rol ."')";
			$this->database->ejecutar_consulta($consulta);
        
			if ($this->database->filas_implicadas>0) 
			{ 
				$this->entidades[] = $id_entidad;
			}
			*/			
			return $this->id_usuario;
		}
		else 
		{
			$this->error = "No ha podido grabarse el nuevo usuario en el sistema.";
			return false;
		}
	}

	// Actualiza los datos de un usuario existente en la base de datos
	function modificar($id_usuario,$nombre,$apellidos,$nif,$correo,$telefono,$login,$clave) 
	{	
		//Comprueba que no exista un usuario con el mismo nif en el sistema
		$consulta = "SELECT * FROM usuario WHERE nif='" . $nif . "' AND id_usuario <> " . $id_usuario ;
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0) {
			$this->error = "El nif '" . $nif . "' está duplicado en el sistema";
			return false;
			}
		// Modificamos los datos relativos al usuario
      	$consulta = "UPDATE usuario SET login='$login', clave='$clave',
			nombre='$nombre', apellidos='$apellidos', nif='$nif',
			correo='$correo', telefono='$telefono' WHERE id_usuario = $id_usuario";
      
		$this->database->ejecutar_consulta($consulta);
       	return true;
	}
	
	// Comprueba si el rol del usuario le permite acceder a la página
	function autorizar($page,$id_entidad,$id_usuario,$id_usuario_url=NULL)
	{
		switch ($page)
		{
            // Para administradores de icasus
			case 'informes/indicadores_subentidad':
				$consulta = "SELECT * FROM usuario_entidad WHERE id_entidad = 1 AND id_rol = 1 AND id_usuario = $id_usuario"; 
				break;
			// Para administradores de cada entidad y de icasus
			case 'grupo/grupo_editar':
			case 'grupo/grupo_datos':
			case 'grupo/grupo_poblar':
			case 'grupo/grupo_despoblar':
			case 'grupo/acta_crear':
			case 'grupo/acta_grabar':
			case 'grupo/acta':
				//permiso de secretario para los grupos y actas
				$consulta = "SELECT * FROM usuario_entidad WHERE (id_entidad=$id_entidad OR id_entidad=1) 
						AND id_usuario=$id_usuario AND id_rol=3";
				break;
			case 'proceso_crear':
			case 'proceso_editar':
			case 'usuario_crear':
			case 'usuario_borrar':	
			//case 'usuario_editar':
			case 'indicador_crear':	
			case 'indicador_editar':	
			case 'indicador_borrar':	
			case 'indicador_copiar':	
			case 'entidad_crear':	
			case 'entidad_editar':	
			case 'entidad_borrar':	
			case 'entidad_poblar':	
			case 'entidad_despoblar':	
			case 'pagina_crear':
			case 'pagina_editar':
			case 'pagina_borrar':
			case 'plan_listar':
			case 'accion_crear':
			case 'accion_modificar':
			case 'linea_crear':
		  case 'linea_modificar':
     	case 'objetivo_crear':
			case 'objetivo_modificar':
     	case 'valor_borrar':
			case 'valor_editar':
			case 'valor_crear':
     	case 'borrar':
			// Mira si el usuario es administrador de la entidad en cuestión o de la entidad administrativa (id_entidad=1)
			$consulta = "SELECT * FROM usuario_entidad WHERE (id_entidad=$id_entidad OR id_entidad=1) 
					AND id_usuario=$id_usuario AND id_rol=1";
			break;
			// Para usuarios normales de la entidad	
			case 'indicador_datos':
			case 'cuadromando_entidad':
     	case 'plan_informe1':
			// Mira si el usuario es miembro de la entidad en cuestión o de la entidad administrativa (id_entidad=1)
			$consulta = "SELECT * FROM usuario_entidad 
					WHERE (id_entidad = $id_entidad OR id_entidad =1 ) 
					AND id_usuario=$id_usuario";
			break;
			// Para el usuario actual o administradores icasus
			// Aquí usaremos id_entidad en el sentido de id_contexto o id_objeto
			// TODO: cambiar toda la función a id_contexto o id_objeto
			case 'usuario_editar':
				$consulta = "SELECT * FROM usuario_entidad 
					WHERE (id_entidad = 1 AND id_rol = 1 AND id_usuario = $id_usuario) 
					OR (id_usuario = $id_usuario AND id_usuario = $id_entidad)";
				break;

			// Para todos los demas
			default:
				$consulta = "SELECT true";
		}
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

	function borrar($id_usuario)
	{
		$this->error = false;
		// Comprueba que el usuario no pertenece a ninguna entidad
		$consulta = "SELECT * FROM usuario_entidad WHERE id_usuario=$id_usuario";
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0)
		{
			$this->error = 'No se puede borrar un usuario mientras pertenezca a alguna entidad'; 
		}
		// Comprueba que el usuario no es responsable de ningún indicador
		$consulta = "SELECT id_indicador FROM indicador WHERE id_responsable=$id_usuario";
		$this->database->ejecutar_consulta($consulta);
		if ($this->database->filas_implicadas > 0)
		{
			$this->error = 'No se puede borrar un usuario con indicadores a su cargo'; 
		}
		// Si hubo algún error no borra
		if ($this->error)
		{
			return false;
		}
		else
		{
			// No hay error, intenta borrar
			$consulta = "DELETE FROM usuario WHERE id_usuario=$id_usuario";
			$this->database->ejecutar_consulta($consulta);
			if ($this->database->filas_implicadas > 0)
			{
				return true;
			}
			else
			{
				$this->error = 'No se pudo borrar el usuario por alguna causa desconocida';
				return false;
			}
		}	
	}
}
?>
