<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/valor.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los valores recogidos para cada indicador
//---------------------------------------------------------------------------------------------------

class valor extends ADOdb_Active_Record 
{
	public $_table = 'valores';
  public $entidad;
  public $usuario;

  public function Find_joined($condicion)
  {
		if ($valores = $this->Find($condicion))
		{
			foreach ($valores as& $valor)
			{
				$valor->entidad = new entidad();
				$valor->entidad->load("id = $valor->id_entidad");

			  $valor->usuario = new usuario();
				$valor->usuario->load("id = $valor->id_usuario");
			}
			return $valores;
		}
		else
		{
			return false;
		}
    
  }
	public function load_joined($id)
	{
		if($this->load("id = $id"))
		{
			$this->entidad = new entidad();
      $this->entidad->load("id = $this->id_entidad");
    
      $this->usuario = new usuario();
      $this->usuario->load("id = $this->id_usuario");

			return $this;
		}
		else
		{
			return false;
		}
	}
}
?>
