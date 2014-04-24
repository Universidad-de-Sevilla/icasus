<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/valor.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los valores recogidos para cada indicador
//---------------------------------------------------------------------------------------------------

class valor extends ADOdb_Active_Record 
{
	public $_table = 'valores';
  public $entidad;
  public $usuario;
  public $medicion;
  public $indicador;
  public $autorizado;
	
	//Activa/desactiva los valores de una subunidad según parametros
	public function valores_activar_periodos($id_indicador,$id_subunidad,$activar,$inicio,$fin)
	{
		$medicion = new medicion();
		$mediciones = $medicion->find("id_indicador = $id_indicador AND date_format(periodo_inicio,'%Y') between '$inicio' AND '$fin' ORDER BY periodo_inicio");
		foreach($mediciones as $medicion)
		{
			$valor = new valor();
			$valor->load("id_medicion = $medicion->id AND id_entidad = $id_subunidad");
			$valor->activo = $activar;
			$valor->save();
		}
	}
	public function valores_activar($id_indicador,$id_subunidad,$activar)
	{
		$medicion = new medicion();
		$mediciones = $medicion->find("id_indicador = $id_indicador");
		foreach($mediciones as $medicion)
		{
			$valor = new valor();
			$valor->load("id_medicion = $medicion->id AND id_entidad = $id_subunidad");
			$valor->activo = $activar;
			$valor->save();
		}
	}
	public function puede_grabarse($id_valor,$id_usuario_activo)
	{
		$db = $this->DB();
		//El primer miembro de  WHERE comprueba que el usuario tiene asignada la medicion para la unidad en la tabla indicador_subunidad
		//El segundo miembro de WHERE comprueba si el usuario activo es el id_responsable de la tabla indicadores.
		$sql = "SELECT * FROM valores v 
            LEFT JOIN mediciones m ON v.id_medicion = m.id 
            LEFT JOIN indicadores i ON i.id = m.id_indicador 
            LEFT JOIN indicadores_subunidades isu ON  m.id_indicador = isu.id_indicador 
            WHERE
            (isu.id_usuario = $id_usuario_activo AND v.id_entidad = isu.id_entidad AND v.id = $id_valor)
            OR 
            (v.id = $id_valor AND i.id_responsable_medicion = $id_usuario_activo )
            OR 
            (v.id = $id_valor AND i.id_responsable = $id_usuario_activo )";

		$rs = $db->execute($sql);
		if ($rs->_numOfRows > 0 )
		{
			return  true;
		}
		else
		{
			return false;
		}
	}

 	public function Find_joined_jjmc($id_medicion,$id_usuario_activo)
  {
		if ($valores = $this->Find("id_medicion = $id_medicion"))
		{
			foreach ($valores as& $valor)
			{
				$valor->entidad = new entidad();
				$valor->entidad->load("id = $valor->id_entidad");

			  $valor->usuario = new usuario();
				$valor->usuario->load("id = $valor->id_usuario");

				$db = $this->DB();
				$sql = "SELECT * FROM valores v 
								LEFT JOIN mediciones m ON v.id_medicion = m.id 
								LEFT JOIN indicadores_subunidades i ON  m.id_indicador = i.id_indicador 
								WHERE (i.id_usuario = $id_usuario_activo OR 1=1)
								AND v.id_entidad = i.id_entidad AND v.id = $valor->id";
				$rs = $db->execute($sql);
				if ($rs->_numOfRows == 1)
				{
					$valor->autorizado = true;
				}
				else
				{
					$valor->autorizado = false;
				}
			}
      usort($valores, array( $this, "compara_por_etiquetas"));
			return $valores;
		}
		else
		{
			return false;
		}
	}
  
  public function Find_joined($condicion)
  {
		if ($valores = $this->Find($condicion))
		{
			foreach ($valores as& $valor)
			{
				$valor->entidad = new entidad();
				$valor->entidad->load("id = $valor->id_entidad");

			  $valor->usuario = new usuario();
				$valor->usuario->load("id = $valor->id_usuario");
			}
      usort($valores, array( $this, "compara_por_etiquetas"));
			return $valores;
		}
		else
		{
			return false;
		}
    
  }
  
  public function Find_joined_indicador($condicion)
  {
    if ($valores = $this->Find($condicion))
    {
      foreach ($valores as& $valor)
      {
        $valor->medicion = new medicion();
        $valor->medicion->load("id = $valor->id_medicion");
        $id_indicador = $valor->medicion->id_indicador;
        $valor->indicador = new indicador();
        $valor->indicador->load("id = $id_indicador");
      }
      return $valores;
    }
    else
    {
      return false;
    }
  }
  
	public function load_joined($id)
	{
		if($this->load("id = $id"))
		{
			$this->entidad = new entidad();
      $this->entidad->load("id = $this->id_entidad");
    
      $this->usuario = new usuario();
      $this->usuario->load("id = $this->id_usuario");

			return $this;
		}
		else
		{
			return false;
		}
	}

  // Calcula y graba en el valor los valores parcial y final
  public function calcular($id_valor, $valor_parcial)
  {
    $medicion = new medicion();
    $indicador = new indicador();
    $medicion->load("id = $this->id_medicion");
    $indicador->load("id = $medicion->id_indicador");
    $calculo = $indicador->calculo;
    // Vemos si este indicador es calculado o directo
    if (!is_null($calculo) AND $calculo != "")
    {
      // Recorremos la cadena $calculo para sacar y calcular las variables
      // Almacenamos el resultado en $formula
      $es_variable = false;
      $formula= "";
      $calculo = str_split($calculo);
      foreach ($calculo as $elemento)
      {
        if ($elemento == "[")
        {
          $variable = "";
          $es_variable = true;
          continue;
        }
        if ($elemento == "]")
        {
          if (is_numeric($variable))
          {
            $id_dato = (int)$variable;
            $medicion_dato = new medicion();
            //TODO: Comprueba que el dato existe y tiene un valor para la etiqueta actual
            $medicion_dato->load("id_indicador = $id_dato AND etiqueta = '$medicion->etiqueta'");
            $valor_dato = new valor();
            $valor_dato->load("id_medicion = $medicion_dato->id AND id_entidad = $this->id_entidad");
            $formula .= "$valor_dato->valor";
          }
          else
          {
            $formula .= "$valor_parcial";
          }
          $es_variable = false;
          continue;
        }
        if ($es_variable)
        {
          $variable .= $elemento; 
        }
        else
        {
          $formula .= $elemento;
        }
      }
      // Calcula el resultado de la formula y guarda el valor final 
      eval("\$valor_final = $formula;");
      $this->valor = $valor_final;
    }
		else
    {
      $this->valor = $valor_parcial;                           
    }
  }

  // Calcula el total de la medicion de un indicador, ya sea calculado o simple
  public function obtener_total_calculado($id_medicion, $calculo)
  {
    $elementos_calculo = array();
    // Recorremos la cadena $calculo para sacar y calcular las variables
    // Almacenamos el resultado en $formula
    $es_variable = false;
    $formula= "";
    $elementos_calculo = str_split($calculo);
    foreach ($elementos_calculo as $elemento)
    {
      if ($elemento == "[")
      {
        $variable = "";
        $es_variable = true;
        //continue;
      }
      if ($elemento == "]")
      {
        // Si el contenido de la variable es un número
        // nos indica que se trata de un indicador existente
        // en caso contrario sería un valor a introducir y en este 
        // contexto no tiene sentido (en realidad en un futuro no lo tendrá en ninguno)
        if (is_numeric($variable))
        {
          $id_indicador = (int)$variable;
          $total_simple = $this->obtener_total_simple($id_indicador, $id_medicion);
          $formula .= "$total_simple";
        }
        $es_variable = false;
        //continue;
      }
      if ($es_variable)
      {
        $variable .= $elemento; 
      }
      else
      {
        $formula .= $elemento;
      }
    }
    // Calcula el resultado de la formula y guarda el valor final 
    eval("\$valor_final = $formula;");
    return $valor_final;
  }

  public function obtener_total_simple($id_indicador, $id_medicion)
  {
    $operador = "SUM";
    $db = $this->DB();
    $query = "SELECT $operador(valores.valor) as valor 
              FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
              WHERE mediciones.id = $id_medicion AND valor IS NOT NULL 
              GROUP BY mediciones.id";
    $resultado = mysql_query($query);
    $registro = mysql_fetch_assoc($resultado))
    return $registro['valor'];
  }

  // Define la función personalizada para ordenar
  static function compara_por_etiquetas($a,$b) 
  {
    return $a->entidad->etiqueta > $b->entidad->etiqueta;
  }

	//función para mostrar los datos en control
	public function filtro_onlyear($fecha,$cadena)
	{
		$db = $this->DB();
		$sql = "SELECT  m.id as id_medicion,p.nombre as proceso,p.codigo as cod_proceso,e.etiqueta as unidad, i.nombre as indicador, i.id_entidad as entidad_del_indicador,i.id as id_indicador,e.id as id_entidad,m.etiqueta as fecha, v.valor
			FROM `valores` v
			LEFT JOIN mediciones m ON v.id_medicion = m.id
			LEFT JOIN entidades e ON v.id_entidad = e.id
			LEFT JOIN indicadores i ON m.id_indicador = i.id
			LEFT JOIN procesos p ON p.id = i.id_proceso
			WHERE v.valor IS NULL
			$cadena 
			AND v.activo = 1 
			AND DATE_FORMAT( m.periodo_inicio, '%Y' ) = $fecha
			ORDER BY e.etiqueta, i.nombre";
		return $db->getall($sql);
	}
}
?>
