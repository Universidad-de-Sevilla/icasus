<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: clase/entidad.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona las entidades
//---------------------------------------------------------------------------------------------------

class fichero extends ADOdb_Active_Record
{
	public $_table = 'ficheros';
  public $usuario;

	public function find_joined($condicion)
  {
		$lista = $this->find($condicion);
		foreach($lista as $item)
		{
			$usuario = new usuario();
			$usuario->load("id = $item->id_usuario");
			$item->usuario = $usuario;
		}
		return $lista;
	}
}
?>
