<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: clase/entidad.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona las entidades
//---------------------------------------------------------------------------------------------------

class entidad extends ADOdb_Active_Record
{
	public $_table = 'entidades';
	public $indicadores;
  public $madre;

  public function load_joined($condicion)
  {
    if ($this->load($condicion))
    {
      $this->madre = new entidad;
      $this->madre->load("id = $this->id_madre");
      return true;
    }
    else
    {
      return false;
    }
  }

  public function informe_entidad_indicador($condicion)
  {
    $dptos = $this->find("codigo LIKE '$condicion%'");
    foreach($dptos as $dpto)
    {
      //indicadores de la unidad
      $indicador = new indicador();
      $indicadores = $indicador->find_valor("id_entidad = $dpto->id_entidad");
      $dpto->indicadores = $indicadores;

    }
    return $dptos;
  }

  public function actas_grupo($id_entidad)
  {
    if ($grupos = $this ->find('id_madre='.$id_entidad))
    {
      foreach ($grupos as $grupo)
      {
        $acta = new acta();
        $actas = $acta -> find('id_entidad='.$grupo->id_entidad);
        $grupo->numero_actas = count($actas);
      }
      return $grupos;
    }
    else
    {
      return false;
    }
  }

	public function seguimiento_dpto($periodos,$codigos) 
	{
		$dptos = $this->find("codigo LIKE 'UE01-%' ORDER BY nombre");
		foreach($codigos as $codigo)
		{
			$codes = $codes."codigo LIKE '".$codigo."'";
			if (next($codigos) == true){$codes = $codes." OR ";}
		}
		foreach($dptos as $dpto)
		{
			$indicador = new indicador();
			$indicadores = $indicador->find_valor("id_entidad = $dpto->id_entidad AND ($codes)");
			$dpto->indicadores = $indicadores;
		}
		return $dptos;
	}
	
	public function seguimiento_entidad($periodos,$codigos,$grupo,$dato)
	{	$db = $this->DB();
		$entidades = $this->find("codigo LIKE '$grupo-%'");
		foreach($entidades as $entidad)
		{
			foreach($codigos as $codigo)
    	{
      	foreach($periodos as $periodo)
      	{
					$sql ="SELECT i.id_indicador,i.codigo,year(from_unixtime(v.fecha_recogida)) AS fecha, count(*) as numero, v.valor as valor FROM entidad e 
								 LEFT JOIN indicador i ON i.id_entidad = e.id
								 LEFT JOIN valor v ON i.id_indicador = v.id_indicador
								 WHERE e.id = $entidad->id
								 AND i.codigo LIKE '$grupo-%-".$codigo."' 
								 AND year(from_unixtime(v.fecha_recogida)) = ".$periodo ;
					$cuenta = $db->execute($sql);
        	$code[$codigo][$periodo] = $cuenta->fields[$dato];
      	}
    	}
			$entidad->indicadores = $code;	
		}
		return $entidades;
	}
}
?>
