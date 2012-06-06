<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: class/usuario_entidad.php
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona los usuarios asignados a una unidad y las unidades asignadas a un usuario
//---------------------------------------------------------------------------------------------------

class usuario_entidad extends ADOdb_Active_Record 
{ 
	public $_table="usuarios_entidades"; 
  public $usuario;
  public $entidad;
  public $lista_indicadores;
	public $nombre;

  // Devuelve una array de usuarios asignados a la entidad
  public function Find_usuarios($condicion)
  {
    if ($usuarios_entidades = $this->Find($condicion))
    {
      foreach ($usuarios_entidades as& $usuario_entidad)
      {
        $usuario_entidad->usuario = new usuario;
        $usuario_entidad->usuario->load("id = $usuario_entidad->id_usuario");
      }
      return $usuarios_entidades;
    }
    else
    {
      return false;
    }
      
  }

	// Carga los indicadores de las entidades a las que pertenece el usuario 
	// para crear un cuadro de mando
  public function carga_entidades_indicadores($id_usuario)
	{
		if ($entidades = $this->Find($id_usuario))
		{
			foreach($entidades as $entidad) 
			{
				$indicador = new indicador();
				$indicadores = $indicador->Find('id_entidad = '.$entidad->id_entidad);
				$entidad->lista_indicadores = $indicadores;

				$nombre_entidad = new entidad();
				$nombre_entidad->Load('id_entidad = '.$entidad->id_entidad);
				$entidad->nombre = $nombre_entidad->nombre;

			}	
			return $entidades;
		}
		else
		{
			return false;
		}
	}
	
	// Carga los indicadores de las entidades a las que pertenece el usuario 
	// que estan en un cuadro de mando del usuario
  public function carga_entidades_indicadores_in_cuadromando($condicion,$id_cuadro)
	{
		if ($entidades = $this->Find($condicion))
    {
      foreach($entidades as $entidad)
      {
        $indicador = new indicador();
        $indicadores = $indicador->Find("id_entidad = $entidad->id_entidad AND id_indicador IN (SELECT id_indicador FROM indicadores_cuadros WHERE id_cuadromando = $id_cuadro)");
        $entidad->lista_indicadores = $indicadores;
				$nombre_entidad = new entidad();
        $nombre_entidad->Load('id_entidad = '.$entidad->id_entidad);
        $entidad->nombre = $nombre_entidad->nombre;
      }
      return $entidades;
    }
    else
    {
      return false;
    }
	}

	//Carga los indicadores de las entidades a las que pertenece el usuario 
	//que estan en un cuadro de mando del usuario
  public function carga_entidades_indicadores_out_cuadromando($condicion,$id_cuadro)
	{
		if ($entidades = $this->Find($condicion))
    {
    foreach($entidades as $entidad)
    {
      $indicador = new indicador();
      //$indicadores = $indicador->Find('id_entidad = '.$entidad->id_entidad);
      $indicadores = $indicador->Find("id_entidad = $entidad->id_entidad AND id_indicador NOT IN (SELECT id_indicador FROM indicadores_cuadros WHERE id_cuadromando = $id_cuadro)");
      $entidad->lista_indicadores = $indicadores;
      $nombre_entidad = new entidad();
      $nombre_entidad->Load('id_entidad = '.$entidad->id_entidad);
      $entidad->nombre = $nombre_entidad->nombre;
    }
      return $entidades;
    }
    else
    {
      return false;
    }
	}
}
?>
