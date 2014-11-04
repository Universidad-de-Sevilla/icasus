<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/criterio_efqm_indicador.php
//---------------------------------------------------------------------------------------------------
// Gestiona los indicadores
//---------------------------------------------------------------------------------------------------

class Criterio_efqm_indicador extends ADOdb_Active_Record
{
	public $_table = 'criterios_efqm_indicadores';
	public $criterio_efqm;

	public function Find_joined($criterio)
	{
		if ($criterios_efqm_indicadores = $this->Find($criterio))
		{
			foreach ($criterios_efqm_indicadores as& $criterio_efqm_indicador)
			{
				$criterio_efqm = new Criterio_efqm();
				$criterio_efqm->load("id = $criterio_efqm_indicador->id_criterio_efqm");
				$criterio_efqm_indicador->criterio_efqm = $criterio_efqm;
			}
			return $criterios_efqm_indicadores;
		}
		else
		{
			return false;
		}
	}	
}
?>