<?php
//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: class/usuario_entidad.php
//----------------------------------------------------------------------------------
// Gestiona las entidades de un usuario y los usuarios de una entidad
//----------------------------------------------------------------------------------

class usuario_entidad extends ADOdb_Active_Record
{
	public $_table='usuarios_entidades'; 
	public $asiste;	
  public $entidad;
  public $rol;
  public $usuario;
	public $indicadores_entidad;//cuadromando_crear.php

	//Devuelve todas las entidades de un usuario con sus indicadores
	public function Find_entidades_indicadores($id_usuario) 
	{ 
		if ($ues = $this->Find("id_usuario = $id_usuario")) 
		{ 
			foreach ($ues as $item) 
			{
				
				$is = new indicador_subunidad();
				$iss = $is->find_indicadores_con_valores("id_entidad = $item->id_entidad");
				$item->indicadores_entidad = $iss;

				$e = new entidad();
				$e->load("id = $item->id_entidad");
				$item->entidad = $e;
			}
      return $ues;
    }
    else
    {
      return false;
    }
  }
	public function Find_entidades($condicion) 
	{ 
		if ($usuarios_entidades = $this->Find($condicion)) 
		{ 
			foreach ($usuarios_entidades as& $usuario_entidad) 
			{ 
				$entidad = new entidad(); 
				$entidad->load("id = $usuario_entidad->id_entidad"); 
        $usuario_entidad->entidad = $entidad;
        $usuario_entidad->rol = new rol();
        $usuario_entidad->rol->load("id = $usuario_entidad->id_rol");
			}
      return $usuarios_entidades;
    }
    else
    {
      return false;
    }
  }

  public function Find_usuarios($condicion)
  {
    if($usuarios_entidades = $this->Find($condicion))
    {
      foreach($usuarios_entidades as& $usuario_entidad)
      {
        $usuario_entidad->usuario = new usuario();
        $usuario_entidad->usuario->load("id = $usuario_entidad->id_usuario");
        $usuario_entidad->rol = new rol();
        $usuario_entidad->rol->load("id = $usuario_entidad->id_rol");
      }
      usort( $usuarios_entidades, array( $this, "compara_por_apellidos") );
      return $usuarios_entidades;
    }
    else
    {
      return false;
    }
  }
    
  // Función auxiliar para devolver un listado de usuarios ordenados por apellidos
  // Se usa en: Find_usuarios()
  function compara_por_apellidos($a, $b)
  {
    $al = strtolower($a->usuario->apellidos);
    $bl = strtolower($b->usuario->apellidos);
    if ($al == $bl) 
    {
      return 0;
    }
    return ($al > $bl) ? +1 : -1;
  }
      
	//funcion para comprobrar los permisos de las actas
	public function acta_permisos($id_usuario,$id_entidad,$id_rol)
	{
		$permiso = $this->load('id_usuario ='.$id_usuario.' AND id_entidad = '.$id_entidad.' AND id_rol = '.$id_rol);
		return $permiso;
	}
	public function desasignar_usuario($id_entidad, $id_usuario)
	{
		if ($this->load("id_entidad = $id_entidad AND id_usuario = $id_usuario" ))
		{
			if ($this->delete())
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	} 
	//persmisos de usuarios
	public function permiso_crear_medicion($id_usuario,$id_entidad)
	{
		if ($this->load("id_usuario=$id_usuario AND id_entidad=$id_entidad AND (id_rol = 1 OR id_rol =2)"))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}
?>
