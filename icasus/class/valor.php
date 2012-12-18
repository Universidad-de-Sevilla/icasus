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
  public $autorizado;
	
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
      // Define la función personalizada para ordenar
      $customsort = function ($a,$b) {
        return $a->entidad->etiqueta > $b->entidad->etiqueta;
      };
      usort($valores, $customsort);
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
      // Define la función personalizada para ordenar
      $customsort = function ($a,$b) {
        return $a->entidad->etiqueta > $b->entidad->etiqueta;
      };
      usort($valores, $customsort);
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
}
?>
