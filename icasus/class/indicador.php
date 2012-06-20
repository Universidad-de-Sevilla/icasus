<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/indicador.php
//---------------------------------------------------------------------------------------------------
// Gestiona los indicadores
//---------------------------------------------------------------------------------------------------

class indicador extends ADOdb_Active_Record
{
	public $_table = 'indicadores';
	public $entidad;
	public $proceso;
	public $responsable;
	public $ruta_imagen;
	public $valores;
  public $valores_referencia;
  public $visibilidad;

	public function load_joined($criterio)
	{
		if ($this->load($criterio))
		{
      $proceso = new proceso();
      $proceso->load("id = $this->id_proceso");
      $this->proceso = $proceso;

      $responsable = new usuario();
      $responsable->load("id = $this->id_responsable");
      $this->responsable = $responsable;

      $valor_referencia = new valor_referencia();
      $valores_referencia = $valor_referencia->Find("id_indicador = $this->id");
      $this->valores_referencia = $valores_referencia;

      $visibilidad = new visibilidad();
      $visibilidad->load("id = $this->id_visibilidad");
      $this->visibilidad = $visibilidad;
		}
		else
		{
			return false;
		}
	}	

	public function Find_joined($criterio)
	{
		if ($indicadores = $this->Find($criterio))
		{
			foreach ($indicadores as& $indicador)
			{
				$proceso = new proceso();
				$proceso->load("id = $indicador->id_proceso");
				$indicador->proceso = $proceso;

			  $responsable = new usuario();
				$responsable->load("id = $indicador->id_responsable");
				$indicador->responsable = $responsable;

        $visibilidad = new visibilidad();
        $visibilidad->load("id = $indicador->id_visibilidad");
        $indicador->visibilidad = $visibilidad;
			}
			return $indicadores;
		}
		else
		{
			return false;
		}
	}	

	// Obtiene los valores introducidos en este indicador con la fecha de recogida como campo clave
	public function obtener_valores()
	{	
		$datos = array();
		$db = $this->DB();
		$query = "SELECT * FROM valor WHERE id_indicador = $this->id_indicador ORDER BY fecha_recogida";
		$resultado = $db->Execute($query);
		while (!$resultado->EOF)
		{
			$datos[$resultado->fields['fecha_recogida']] = $resultado->fields;
			$resultado->MoveNext();
		}
		if (sizeof($datos) > 0)
		{
			$this->valores = $datos;
			return true;
		}
		else
		{
			return false;
		}
	}

	public function indicador_publico()
	{
		if ($indicadores = $this->find("id_visibilidad = 2"))
		{
			foreach ($indicadores as $indicador)
			{
			$entidad = new entidad();	
			$entidad->load("id_entidad = $indicador->id_entidad");
			$indicador->entidad = $entidad->nombre;
			}
		return $indicadores;
		}
		else
		{
		return false;
		}
	}
//devuelve los indicadores con su valores
	public function find_valor($condicion)
	{
		$indicadores = $this->find($condicion);
		foreach ($indicadores as $indicador)
		{
			$valor = new valor();
			$valors = $valor->find("id_indicador = ".$indicador->id_indicador." ORDER BY fecha_recogida DESC");
			$indicador->valores = $valors;
		}
		//print_r($indicadores);
		return $indicadores;
	}
}
?>
