<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/panel.php
//---------------------------------------------------------------------------------------------------
// Gestiona los paneles de un cuadro de mando
//---------------------------------------------------------------------------------------------------

class panel extends ADOdb_Active_Record
{
	public $_table = 'paneles';
	public $indicadores;
  public $tipo;

  // Devuelve un array de paneles con los panel_tipo y panel_indicador asociados a cada uno
  // Recibe una condición en formato WhereOrderBy
	public function Find_joined($condicion)
	{
		if ($paneles = $this->Find($condicion))
    {
      foreach($paneles as& $panel)
      {
        $panel_indicador = new panel_indicador();
        $panel->indicadores = $panel_indicador->Find("id_panel = $panel->id");
        $panel->tipo = new panel_tipo();
        $panel->tipo->load("id = $panel->id_paneltipo");
      }
		  return $paneles;
    }
    else
    {
      return false;
    }
	}
}
?>
