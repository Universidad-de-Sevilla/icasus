<?php
//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: class/indicador_subunidad.php
//----------------------------------------------------------------------------------
// Relaciona los indicadores con las subunidades y los responsables 
// de grabar valores
//----------------------------------------------------------------------------------

class indicador_subunidad extends ADOdb_Active_Record
{
	public $_table='indicadores_subunidades'; 
  public $indicador;
  public $usuario;
  public $entidad;
	//devuelve los indicadores en los que mide la unidad y no son propios de ella.
  public function indicador_segregado($id_unidad,$id_proceso)
	{
		$db = $this->DB();
		/*
		$query = "SELECT * FROM indicadores_subunidades insu 
							INNER JOIN indicadores i ON insu.id_indicador = i.id 
							WHERE insu.id_entidad = $id_unidad AND insu.id_indicador 
							NOT IN (SELECT id FROM indicadores  WHERE id_entidad = $id_unidad)";
		*/
		$query = "SELECT * FROM `indicadores_subunidades` insu
								LEFT JOIN indicadores i
								ON insu.id_indicador = i.id
								WHERE insu.id_entidad = $id_unidad AND i.id_proceso = $id_proceso
								AND insu.id_indicador NOT IN (SELECT id FROM indicadores WHERE id_entidad = $id_unidad)";
		$indicadores = $db->getall($query);
		return $indicadores;
	}

  public function Find_entidades_responsables($id_indicador,$id_usuario)
  {
		$indicador = new indicador();
		$indicador->load("id = $id_indicador");

		if ($indicador->id_responsable_medicion == $id_usuario OR $indicador->id_responsable == $id_usuario)
		{
			$indicadores_subunidades = $this->Find("id_indicador = $id_indicador");
		}
		//solo le sale las subunidades en las que tiene responsabilidad de grabación
		else
		{
			$indicadores_subunidades = $this->Find("id_usuario = $id_usuario AND id_indicador= $id_indicador");
		}
		if ($indicadores_subunidades)
		{
			foreach ($indicadores_subunidades as& $indicador_subunidad)
				{
					$indicador_subunidad->entidad = new entidad();
					$indicador_subunidad->entidad->load_joined("id = $indicador_subunidad->id_entidad");

					$indicador_subunidad->usuario = new usuario();
					$indicador_subunidad->usuario->load("id = $indicador_subunidad->id_usuario");
				}
				return $indicadores_subunidades;
		}
		else
		{
			return false;
		}
  }
 public function Find_entidades($criterio)
  {
    if ($indicadores_subunidades = $this->Find($criterio))
    {
      foreach ($indicadores_subunidades as& $indicador_subunidad)
      {
        $indicador_subunidad->entidad = new entidad();
        $indicador_subunidad->entidad->load("id = $indicador_subunidad->id_entidad");
				//creo que sobran estas 2 líneas siguientes
        //$indicador_subunidad->usuario = new usuario();
        //$indicador_subunidad->usuario->load("id = $indicador_subunidad->id_usuario");
      }
      return $indicadores_subunidades;
    }
    else
    {
      return false;
    }
  }

  // No recuerdo ni entiendo epara porque se llama "con_valores" (Juanan)
  public function Find_indicadores_con_valores($criterio)
  {
    if ($indicadores_subunidades = $this->Find($criterio))
    {
      foreach ($indicadores_subunidades as& $indicador_subunidad)
      {
        $indicador_subunidad->indicador = new indicador();
        $indicador_subunidad->indicador->load("id = $indicador_subunidad->id_indicador");
      }
      return $indicadores_subunidades;
    }
    else
    {
      return false;
    }
  }
}
?>
