<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/projects/icasus/)
// Archivo: clase/ado_entidad.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los cuadros de mandos o colecciones de indicadores 
//---------------------------------------------------------------------------------------------------

class ado_entidad extends ADOdb_Active_Record
{
	var $_table = 'entidad';
	var $indicadores;
function informe_entidad_indicador($condicion)
{
        $dptos = $this->find("codigo LIKE '$condicion%'");
        foreach($dptos as $dpto)
        {
        //indicadores de la unidad
                $indicador = new ado_indicador();
                $indicadores = $indicador->find_valor("id_entidad = $dpto->id_entidad");
                $dpto->indicadores = $indicadores;

        }
        return $dptos;
}
 function actas_grupo($id_entidad)
                {
                        if ($grupos = $this ->find('id_padre='.$id_entidad))
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

	function seguimiento_dpto($periodos,$codigos) 
	{
		$dptos = $this->find("codigo LIKE 'UE01-%' ORDER BY nombre");
		foreach($codigos as $codigo)
		{
			$codes = $codes."codigo LIKE '".$codigo."'";
			if (next($codigos) == true){$codes = $codes." OR ";}
		}
		foreach($dptos as $dpto)
		{
			$indicador = new ado_indicador();
			$indicadores = $indicador->find_valor("id_entidad = $dpto->id_entidad AND ($codes)");
			$dpto->indicadores = $indicadores;
		}
		return $dptos;
	}
	
	function seguimiento_entidad($periodos,$codigos,$grupo,$dato)
	{	$db = $this->DB();
		$entidades = $this->find("codigo LIKE '$grupo-%'");
		foreach($entidades as $entidad)
		{
			foreach($codigos as $codigo)
    	{
      	foreach($periodos as $periodo)
      	{
					$sql ="SELECT i.id_indicador,i.codigo,year(from_unixtime(v.fecha_recogida)) AS fecha, count(*) as numero, v.valor as valor FROM entidad e 
								 LEFT JOIN indicador i ON i.id_entidad = e.id_entidad 
								 LEFT JOIN valor v ON i.id_indicador = v.id_indicador
								 WHERE e.id_entidad = $entidad->id_entidad 
								 AND i.codigo LIKE '$grupo-%-".$codigo."' 
								 AND year(from_unixtime(v.fecha_recogida)) = ".$periodo ;
					$cuenta = $db->execute($sql);
        	$code[$codigo][$periodo] = $cuenta->fields[$dato];
        	//$code[$codigo][$periodo] = $cuenta->fields["valor"];
      	}
    	}
			$entidad->indicadores = $code;	
		}
		//print_r($entidades);
		return $entidades;
	}
/*
 function seguimiento_entidad($periodos,$codigos,$entidad)
  { $db = $this->DB();
    $entidades = $this->find("codigo LIKE '$entidad-%'");
    foreach($entidades as $entidad)
    {           
      foreach($codigos as $codigo)
      { 
        foreach($periodos as $periodo)
        {
          $sql ="SELECT i.id_indicador,i.codigo,year(from_unixtime(v.fecha_recogida)) AS fecha, count(*) as valor FROM entidad e 
                 LEFT JOIN indicador i ON i.id_entidad = e.id_entidad 
                 LEFT JOIN valor v ON i.id_indicador = v.id_indicador
                 WHERE e.id_entidad = $entidad->id_entidad 
                 AND i.codigo LIKE 'UE01-%-".$codigo."' 
                 AND year(from_unixtime(v.fecha_recogida)) = ".$periodo ;
          $cuenta = $db->execute($sql); 
       		$code[$codigo][$periodo] = $cuenta->fields["valor"];
        }
      }
      $entidad->indicadores = $code;
    }
    return $entidades;
}
*/
}
?>
