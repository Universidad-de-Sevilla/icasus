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
      return $usuarios_entidades;
    }
    else
    {
      return false;
    }
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
}
?>
