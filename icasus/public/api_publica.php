<?php
// ---------------------------------------------------------------
// Proyecto: Icasus
// Archivo: public/api_publica.php
// ---------------------------------------------------------------
// Acceso público a los dato de Icasus
// Devuelve el resultado en formato JSON
// ---------------------------------------------------------------

require_once("../../cascara_core/function/sanitize.php");

// Carga el app_config y conecta a la base de datos
// Es necesario porque este fichero no depende del controlador principal index.php
require_once("../app_code/app_config.php");
@mysql_connect(IC_DB_HOST , IC_DB_LOGIN , IC_DB_CLAVE);

if (@mysql_select_db(IC_DB_DATABASE))
{
  // Capturamos y procesamos los datos de la petición
  if (isset($_REQUEST["metodo"]) AND !empty($_REQUEST["metodo"]))
  {
    $metodo = $_REQUEST["metodo"];
    if (function_exists($metodo))
    {
      if (isset($_REQUEST["id"]) AND isset($_REQUEST["fecha_inicio"]) AND isset($_REQUEST["fecha_fin"])) 
      {
        $id = sanitize($_REQUEST["id"],INT);
        $fecha_inicio = sanitize($_REQUEST["fecha_inicio"],SQL);
        $fecha_fin = sanitize($_REQUEST["fecha_fin"],SQL);
        $periodicidad = sanitize($_REQUEST["periodicidad"],SQL);
        $metodo($id, $fecha_inicio, $fecha_fin, $periodicidad);
      }
      else if (isset($_REQUEST["id"]))
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

// Devuelve los indicadores asociados a un panel de un cuadro de mando
// Se utiliza en cuadro_mostrar
function get_indicadores_panel($id)
{
  $query = "SELECT indicadores.id, indicadores.codigo, indicadores.nombre, panel_indicadores.id_entidad, panel_indicadores.id_serietipo
  FROM indicadores 
  INNER JOIN panel_indicadores ON indicadores.id = panel_indicadores.id_indicador 
  WHERE panel_indicadores.id_panel = $id";

  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  $datos = json_encode($datos);
  echo $datos;
}

// Devuelves las etiquetas de las mediciones existentes para este indicador por ordenadas por su fecha de inicio
// Se utiliza en consulta_avanzada
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

// Devuelve una lista de subunidades asosciadas a la medición de un indicador
// Se utiliza en consulta_avanzada
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

// Es una nueva función que devuelve las fechas de las mediciones en formato timestamp de javascript
// Devuelve todos los valores recogidos para un indicador incluyendo los recogidos a nivel de subunidad (cuando exista)
// También devuelve los totales de dichos valores en función del operador definido en el indicador
// Se utiliza en consulta_avanzada y en cuadro_mostrar
// Ejemplo de llamada:
// http://URL_APLICACION/api_publica.php?metodo=get_valores_con_timestamp&id=5018&fecha_inicio=2012-01-01&fecha_fin=2012-12-31&periodicidad=anual
function get_valores_con_timestamp($id, $fecha_inicio = 0, $fecha_fin = 0, $periodicidad = "todo")
{
  // Preparamos el tipo de operador que vamos a usar para calcular totales y agrupados
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

  // Devuelve los valores recogidos para todas las subunidades
  // mediciones.id as id_medicion, mediciones.etiqueta as medicion,
  $query = "SELECT UNIX_TIMESTAMP(MIN(mediciones.periodo_inicio))*1000 as periodo_fin, 
            entidades.etiqueta as unidad, entidades.id as id_unidad, valores.valor
            FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
            INNER JOIN entidades ON entidades.id = valores.id_entidad
            WHERE mediciones.id_indicador = $id AND valor IS NOT NULL"; 
  if ($fecha_inicio > 0)
  {
    $query .= " AND mediciones.periodo_inicio >= '$fecha_inicio'";
  }
  if ($fecha_fin > 0)
  {
    $query .= " AND mediciones.periodo_fin <= '$fecha_fin'";
  }
  if ($periodicidad == "anual")
  {
    $query .= " GROUP BY id_unidad, YEAR(mediciones.periodo_inicio)";
  }
  else if ($periodicidad == "mensual")
  {
    $query .= " GROUP BY id_unidad, YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio)";
  }
  else if ($periodicidad == "todos")
  {
    // Truco para agrupar sin agrupar cuando se quieren todas las mediciones
    // Funcionará mientras icasus no tenga mediciones intradiarias
    $query .= " GROUP BY id_unidad, YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio), DAY(mediciones.periodo_inicio)";
  }
  $query .= " ORDER BY mediciones.periodo_inicio";
  // print($query);
  $resultado = mysql_query($query);

  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  // Aquí van los totales
  $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, 
            UNIX_TIMESTAMP(MIN(mediciones.periodo_inicio))*1000 as periodo_fin, 
            'Total' as unidad, 0 as id_unidad, $operador(valores.valor) as valor 
            FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
            WHERE mediciones.id_indicador = $id AND valor IS NOT NULL";
  if ($fecha_inicio > 0)
  {
    $query .= " AND mediciones.periodo_inicio >=  '$fecha_inicio'";
  }
  if ($fecha_fin > 0)
  {
    $query .= " AND mediciones.periodo_fin <= '$fecha_fin'";
  }
  if ($periodicidad == "anual")
  {
    $query .= " GROUP BY YEAR(mediciones.periodo_inicio)";
  }
  else if ($periodicidad == "mensual")
  {
    $query .= " GROUP BY YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio)";
  }
  else if ($periodicidad == "todos")
  {
    // Truco para agrupar sin agrupar cuando se quieren todas las mediciones
    // Funcionará mientras icasus no tenga mediciones intradiarias
    $query .= " GROUP BY YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio), DAY(mediciones.periodo_inicio)";
  }
  $query .= " ORDER BY mediciones.periodo_inicio";
  // print($query);
  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  $datos = json_encode($datos);
  echo $datos;
}

// Devuelve todos los valores recogidos para un indicador incluyendo los recogidos a nivel de subunidad (cuando exista)
// También devuelve los totales de dichos valores en función del operador definido en el indicador
// Se utiliza en consulta_avanzada
function get_valores_indicador($id, $fecha_inicio = 0, $fecha_fin = 0)
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

  //He quitado valores.observaciones porque da un molesto error en javascript cuando el contenido es null (casi siempre)
  //$query = "SELECT mediciones.etiqueta as medicion, entidades.etiqueta as unidad, entidades.id as id_unidad, valores.valor, valores.observaciones 
  $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, entidades.etiqueta as unidad, entidades.id as id_unidad, valores.valor
            FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
            INNER JOIN entidades ON entidades.id = valores.id_entidad
            WHERE mediciones.id_indicador = $id AND valor IS NOT NULL"; 
  if ($fecha_inicio > 0)
  {
    $query .= " AND mediciones.periodo_inicio >= '$fecha_inicio'";
  }
  if ($fecha_fin > 0)
  {
    $query .= " AND mediciones.periodo_fin <= '$fecha_fin'";
  }
  $query .= " ORDER BY mediciones.periodo_inicio";
  $resultado = mysql_query($query);

  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  // Aquí van los totales
  $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, 'Total' as unidad, 0 as id_unidad, $operador(valores.valor) as valor 
            FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
            WHERE mediciones.id_indicador = $id AND valor IS NOT NULL";
  if ($fecha_inicio > 0)
  {
    $query .= " AND mediciones.periodo_inicio >= '$fecha_inicio'";
  }
  if ($fecha_fin > 0)
  {
    $query .= " AND mediciones.periodo_fin <= '$fecha_fin'";
  }
  $query .= " GROUP BY mediciones.id ORDER BY mediciones.periodo_inicio";
  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  $datos = json_encode($datos);
  echo $datos;
}

// Devuelve las medias de los valores de un indicador ordenadas por su periodo de inicio
// Se utiliza en consulta_avanzada
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

?>
