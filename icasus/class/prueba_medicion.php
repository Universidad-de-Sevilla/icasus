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

	public function find_joined_subunidad_valor($id_indicador,$id_entidad)
	{

		$mediciones = $this->find("id_indicador = $id_indicador");
		foreach($mediciones as $medicion)
		{
			$sql = "SELECT  m.etiqueta,m.id as id_medicion,v.id_medicion,v.id as id_valor,v.id_entidad,v.valor
					FROM `mediciones` m
					LEFT JOIN valores v ON m.id = v.id_medicion
					WHERE m.id = $medicion->id
					AND v.id_entidad =$id_entidad";
			$db = $this->DB();
			$medicion_valor = $db->execute($sql);
			/*
			if ($medicion_valor->_numOfRows == 0)
			{
				$valor = 'La subunidad no está vinculada a esta medición';
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
			}
			*/
			$medicion->medicion_valor = $medicion_valor;
			//$medicion->medicion_valor = $valor;
		}
		return $mediciones;
	}
}
?>
