<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/projects/icasus/)
// Archivo: clase/cuadromando.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los cuadros de mandos o colecciones de indicadores 
//---------------------------------------------------------------------------------------------------

class cuadromando extends ADOdb_Active_Record
{
	var $_table = 'cuadromandos';

	/*
	// Devuelve los valores de una entidad en un periodo determinado 
	function valores_entidad($id_entidad,$inicio,$fin)
	{
		$db = $this->DB();
		$query = "SELECT i.id_indicador, i.nombre, v.valor, v.objetivo, v.fecha_entrada	
			FROM indicador i INNER JOIN valor v ON i.id_indicador = v.id_indicador
			WHERE i.id_entidad = $id_entidad AND fecha_entrada >= $inicio AND fecha_entrada <= $fin";
		$resultado = $db->Execute($query);
		while (!$resultado->EOF)
		{
			$datos[] = $resultado->fields;
			$resultado->MoveNext();
		}
		return $datos;
	}
	 */
	// Carga los indicadores, sus valores y genera los gráficos
	function carga_indicadores()
	{
		$db = $this->DB();
		// Obtiene un array de indicadores de este cuadro de mandos: id y nombre
		$query = "SELECT id_indicador FROM indicadores_cuadros WHERE id_cuadromando = $this->id";
		$resultado = $db->getAll($query);
		$where = '1 = 0';
		foreach ($resultado as $item)
		{
			$where .= " OR id_indicador = " .$item['id_indicador'];
		}
		$where .= " ORDER BY codigo";
		//echo $where;
		// Cargamos todos los indicadores en un array	
		$indicador = new ado_indicador();
		$indicadores = $indicador->Find($where);
		// Obtiene los valores para cada uno de los indicadores 
		foreach($indicadores as $indicador)
		{
			$proceso = new proceso();
			if($indicador->id_proceso > 0)
			{	
				$proceso->load("id_proceso = $indicador->id_proceso");
				$indicador->proceso = $proceso;
			}
			$indicador->obtener_valores();
			// Crea la imagen con la grafica
			if ($indicador->valores > 0) 
			{
				$grafica = new grafica(500,150);
				$indicador->ruta_imagen = 'cache/indicador' . $indicador->id_indicador . '.png';
				$grafica->dibuja_indicador($indicador->ruta_imagen, $indicador->valores);
			}
		}
		return $indicadores;
	}

	// Devuelve un array con los indicadores incluidos en este cuadro de mando
	function indicadores_dentro()
	{
		$indicador = new ado_indicador();
		$where = "id_indicador IN (SELECT id_indicador FROM indicadores_cuadros 
			WHERE id_cuadromando = $this->id)";
		$indicadores = $indicador->Find($where);
		if (sizeof($indicadores) > 0)
		{
			return $indicadores;
		}
		else
		{
			return false;
		}
	}


    /*
    function entidades_conhijas($entidades)
    {
        $entidades_totales = $entidades;
        foreach ($entidades as $entidad_madre)
        {
            //devuelve entidades que tengan a la actual como madre
            //no hace falta si ya es un objeto: $entidad = new entidad();
            if ($entidades_hijas = $entidad->Find("id_madre = $entidad->id"))
            {
                $entidades_connietas = $this->entidades_conhijas($entidades_hijas);  
            }
        }
        array_merge($entidades, $entidades_connietas);
        return $entidades;
    }
    */


	// Devuelve un array con los indicadores que no están en este cuadro de mando
	function indicadores_fuera($entidades, $filtro=false)
	{
		//$db = $this->DB();
		// Recorre todas las entidades del usuario para mostrar sus indicadores
		$where = "(1 = 0 ";
		foreach ($entidades as $entidad)
		{
			$where .= ' OR id_entidad = ' . $entidad['id_entidad'];
		}
		$where .= ')';
		// Aplica el filtro si es necesario
		if ($filtro)
		{
			$where .= " AND nombre LIKE '%$filtro%'";  
		}
		// Descarta los indicadores que ya están en el cuadro de mando
		$where .= " AND id_indicador NOT IN (SELECT id_indicador 
			FROM indicadores_cuadros WHERE id_cuadromando = $this->id)";

		//$query = "SELECT * FROM indicador WHERE $where ORDER BY codigo";
		$indicador = new ado_indicador();
		$indicadores = $indicador->Find($where); 	
		//$resultado = $db->Execute($query);
		return $indicadores;
	}

	// Asocia un indicador al cuadro de mandos actual
	function pon_indicador($id_indicador)
	{
		$db = $this->DB();
		$id_cuadromando = $this->id;
		$query = "INSERT INTO indicadores_cuadros (id_indicador, id_cuadromando) 
			VALUES ($id_indicador,$id_cuadromando)";
		$resultado = $db->Execute($query);
	}

	// Elimina la asociacion de un indicador al cuadro de mandos actual
	function quita_indicador($id_indicador)
	{
		$db = $this->DB();
		$id_cuadromando = $this->id;
		$query = "DELETE FROM indicadores_cuadros WHERE id_cuadromando = $id_cuadromando 
			AND id_indicador = $id_indicador";
		$resultado = $db->Execute($query);
	}
function listar_cuadromandos_contar_indicadores($condicion)
        {
                if ($cuadros = $this->Find($condicion))
                {
                        foreach($cuadros as $cuadro)
                        {
                                $indicadores = new ado_indicadores_cuadros();
                                $cuadro->numero_indicadores = count($indicadores->Find('id_cuadromando = '.$cuadro->id));
                        }
                        return $cuadros;
                }
                else
                {
                return false;
                }
        }

}
?>
