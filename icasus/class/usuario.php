<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: class/usuario.php
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona los usuarios 
//---------------------------------------------------------------------------------------------------
class usuario extends ADOdb_Active_Record
{
  //Propiedades de la clase
	public $_table = 'usuarios';
	public $entidades = array();
  public $grupos = array();

  public function load_joined($condicion)
  {
    if ($this->load($condicion))
    {
      $usuario_entidad = new usuario_entidad();
      $this->entidades = $usuario_entidad->Find_entidades("id_usuario = $this->id");
      return true;
    }
    else
    {
      return false;
    }
  }

  //TODO: eliminar tras comprobar que no se usa
  //Devuelve las entidades a las que pertenece el usuario con sus respectivas subentidades
  public function entidades()
  {
    $entidades = $usuario_entidad->Find_entidades("id_usuario = $this->id");
  } 
}
?>
