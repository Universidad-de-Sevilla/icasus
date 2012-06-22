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
  public $autorizado;
	
	public function puede_grabarse($id_valor,$id_usuario_activo)
	{
		$db = $this->DB();
		$sql = "SELECT * FROM valores v 
						LEFT JOIN mediciones m ON v.id_medicion = m.id 
						LEFT JOIN indicadores_subunidades i ON  m.id_indicador = i.id_indicador 
						WHERE i.id_usuario = $id_usuario_activo
						AND v.id_entidad = i.id_entidad AND v.id = $id_valor";
		$rs = $db->execute($sql);
		if ($rs->_numOfRows == 1)
		{
			return  true;
		}
		else
		{
			return false;
		}	
	}
 	public function Find_joined_jjmc($id_medicion,$id_usuario_activo)
  {
		if ($valores = $this->Find("id_medicion = $id_medicion"))
		{
			foreach ($valores as& $valor)
			{
				$valor->entidad = new entidad();
				$valor->entidad->load("id = $valor->id_entidad");

			  $valor->usuario = new usuario();
				$valor->usuario->load("id = $valor->id_usuario");
				
				$db = $this->DB();
				$sql = "SELECT * FROM valores v 
								LEFT JOIN mediciones m ON v.id_medicion = m.id 
								LEFT JOIN indicadores_subunidades i ON  m.id_indicador = i.id_indicador 
								WHERE i.id_usuario = $id_usuario_activo
								AND v.id_entidad = i.id_entidad AND v.id = $valor->id";
				$rs = $db->execute($sql);
				if ($rs->_numOfRows == 1)
				{
					$valor->autorizado = true;
				}
				else
				{
					$valor->autorizado = false;
				}
			}
			return $valores;
		}
		else
		{
			return false;
		}
	}
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
