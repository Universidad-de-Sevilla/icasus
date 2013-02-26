<?php
//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: class/medicion.php
// Descripcion: gestiona las mediciones de un indicador
//----------------------------------------------------------------------------------

class medicion extends ADOdb_Active_Record
{
	public $_table='mediciones'; 
	public $medicion_valor;
  public $indicador;

	public function find_joined_subunidad_valor($id_indicador,$id_entidad)
	{

		$mediciones = $this->find("id_indicador = $id_indicador");
		foreach($mediciones as $medicion)
		{
			$sql = "SELECT  m.etiqueta,m.id,v.id_medicion,m.id,v.id_entidad,v.valor
					FROM `mediciones` m
					LEFT JOIN valores v ON m.id = v.id_medicion
					WHERE m.id = $medicion->id
					AND v.id_entidad =$id_entidad";
			$db = $this->DB();
			$medicion_valor = $db->execute($sql);
			if ($medicion_valor->_numOfRows == 0)
			{
				$valor = $medicion_valor->_numOfRows; 
			}
			else
			{
				if ($medicion_valor->fields["valor"] == '')
				{
					$valor = 'NULL';
				}
				else
				{
					$valor = $medicion_valor->fields["valor"];
				}
				$valor = $medicion_valor; 
			}
			$medicion->medicion_valor = $valor;
		}
		return $mediciones;
	}

	//medicion_listar.php
	public function cuadro_mando($id_indicador,$id_entidad)
	{
		$entidad = new entidad();
		$subunidades = $entidad->find_subunidades("id_madre = $id_entidad");		
		
		return $subunidades;
	}

	//obtener array de los años selecionados por el usuario para mostrar los valores
	//indicador_subunidad_valor.php 
	public function mediciones_periodos($id_indicador,$inicio,$fin)
	{
		$periodo = $this->find("id_indicador = $id_indicador AND date_format(periodo_inicio,'%Y') between '$inicio' AND '$fin' ORDER BY periodo_inicio");
		return $periodo;
	}

	//obtener registros únicos de fechas de medición para el selector de periodos en	
	//indicador_subunidad_valor.php 
	public function find_year_mediciones($id_indicador)
	{
		$years_mediciones = $this->find("id_indicador = $id_indicador  GROUP BY date_format(periodo_inicio,'%Y') ORDER BY periodo_inicio");
		return $years_mediciones;
	}

  public function find_joined_indicador($condicion)
  {
    $mediciones = $this->Find($condicion);
    foreach($mediciones as& $medicion)
    {
      $medicion->indicador = new indicador();
      $medicion->indicador->load("id = $medicion->id_indicador");
    }
    return $mediciones;
  }
}
?>
