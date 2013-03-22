<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/cuadro.php
//---------------------------------------------------------------------------------------------------
// Gestiona los cuadros de mando de un usuario
//---------------------------------------------------------------------------------------------------

class cuadro extends ADOdb_Active_Record
{
	public $_table = 'cuadro';
	public $indicadores_cuadros;

  //No se si está función será útil
	public function find_joined($id_usuario)
	{
		if ($cuadros = $this->find("id_usuario = $id_usuario"))
    {
      foreach($cuadros as& $cuadro)
      {
        $indicador_cuadro = new indicador_cuadro();
        $indicadores_cuadros = $indicador_cuadro->find_joined("id_cuadro = $cuadro->id");
        $cuadro->indicadores_cuadros = $indicadores_cuadros;
      }
		  return $cuadros;
    }
    else
    {
      return false;
    }
	}
}
