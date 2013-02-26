<?php

// Conexión a datos
require_once("../app_code/app_config.php");
@mysql_connect(IC_DB_HOST , IC_DB_LOGIN , IC_DB_CLAVE);
if (@mysql_select_db(IC_DB_DATABASE))
{
  // Capturamos y procesamos los datos de la petición
  require_once("../../cascara_core/function/sanitize.php");
  if (isset($_REQUEST["metodo"]) AND !empty($_REQUEST["metodo"]))
  {
    $metodo = $_REQUEST["metodo"];
    if (function_exists($metodo))
    {
      if (isset($_REQUEST["id"]))
      {
        $id = sanitize($_REQUEST["id"],INT);
        $metodo($id);
      }
      else
      {
        $metodo();
      }
    }
  }
}
else
{
  echo "Error de conexion a la base de datos";
}

/*             Métodos 
------------------------------------- */

function get_valores_indicador($id)
{
  $query = "SELECT tipo_agregacion.operador as operador FROM tipo_agregacion
            INNER JOIN indicadores ON tipo_agregacion.id = indicadores.id_tipo_agregacion
            WHERE indicadores.id = $id";
  if ($resultado = mysql_query($query))
  {
    if ($registro = mysql_fetch_assoc($resultado))
    {
      $operador = $registro['operador'];
    }
    else
    {
      $operador = 'SUM';
    }
  }
  else
  {
    $operador = 'SUM';
  }

  $query = "SELECT mediciones.etiqueta as medicion, entidades.etiqueta as unidad, entidades.id as id_unidad, valores.valor, valores.observaciones 
            FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
            INNER JOIN entidades ON entidades.id = valores.id_entidad
            WHERE mediciones.id_indicador = $id AND valor IS NOT NULL 
            ORDER BY mediciones.periodo_inicio";
  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  // Aquí van los totales
  $query = "SELECT mediciones.etiqueta as medicion, 'Total' as unidad, $operador(valores.valor) as valor 
            FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
            WHERE mediciones.id_indicador = $id AND valor IS NOT NULL
            GROUP BY mediciones.id ORDER BY mediciones.periodo_inicio";
  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  $datos = json_encode($datos);
  echo $datos;
}

function get_valores_indicador_suma($id)
{
  $query = "SELECT mediciones.etiqueta as medicion, SUM(valores.valor) 
            FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
            WHERE mediciones.id_indicador = $id AND valor IS NOT NULL
            GROUP BY mediciones.id ORDER BY mediciones.periodo_inicio";
  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  $datos = json_encode($datos);
  echo $datos;
}

function get_valores_indicador_media($id)
{
  $query = "SELECT mediciones.etiqueta as medicion, AVG(valores.valor) 
            FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
            WHERE mediciones.id_indicador = $id AND valor IS NOT NULL
            GROUP BY mediciones.id ORDER BY mediciones.periodo_inicio";
  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  $datos = json_encode($datos);
  echo $datos;
}

function get_subunidades_indicador($id)
{
  $query = "SELECT entidades.id, entidades.etiqueta, entidades.nombre 
            FROM entidades INNER JOIN indicadores_subunidades ON entidades.id = indicadores_subunidades.id_entidad
            WHERE indicadores_subunidades.id_indicador = $id 
            ORDER BY entidades.etiqueta"; 
  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  $datos = json_encode($datos);
  echo $datos;
}

// Devuelves las etiquetas de las mediciones existentes para este indicador por ordenadas por su fecha de inicio
function get_mediciones_indicador($id)
{
  $query = "SELECT mediciones.etiqueta
            FROM mediciones INNER JOIN indicadores 
            ON indicadores.id = mediciones.id_indicador
            WHERE mediciones.id_indicador = $id 
            ORDER BY mediciones.periodo_inicio"; 
  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  $datos = json_encode($datos);
  echo $datos;
}
?>