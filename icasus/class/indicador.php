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
	public $ruta_imagen;
	public $valores;
	public $proceso;
	public $responsable;
	public $entidad;

	public function Find_joined($criterio)
	{
		if ($indicadores = $this->Find($criterio))
		{
			foreach ($indicadores as $indicador)
			{
				$proceso = new proceso();
				$proceso->load("id_proceso = $indicador->id_proceso");
				$indicador->proceso = $proceso->nombre;

			  $responsable = new usuario();
				$responsable->load("id_usuario = $indicador->id_responsable");
				$indicador->responsable = $responsable;
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
