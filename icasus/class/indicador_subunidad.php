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

  public function Find_entidades($criterio)
  {
    if ($indicadores_subunidades = $this->Find($criterio))
    {
      foreach ($indicadores_subunidades as& $indicador_subunidad)
      {
        $indicador_subunidad->entidad = new entidad();
        $indicador_subunidad->entidad->load("id = $indicador_subunidad->id_entidad");
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
