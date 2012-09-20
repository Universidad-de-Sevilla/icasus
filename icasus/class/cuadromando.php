<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/indicador.php
//---------------------------------------------------------------------------------------------------
// Gestiona los indicadores y los indicadores-dato
//---------------------------------------------------------------------------------------------------

class cuadromando extends ADOdb_Active_Record
{
	public $_table = 'cuadromandos';
	public $indicadores;

	public function find_joined($id_usuario)
	{
		$cs = $this->find("id_usuario = $id_usuario");
		foreach($cs as $item)
		{
			$ic = new indicador_cuadro();
			$ics = $ic->find_joined("id_cuadromando = $item->id");
			$item->indicadores = $ics;
		}
		return $cs;
	}
}
