<?php
// ---------------------------------------------------------------
// Proyecto: Icasus
// Archivo: public/api_publica.php
// ---------------------------------------------------------------
// Acceso público a los dato de Icasus
// Devuelve el resultado en formato JSON
// ---------------------------------------------------------------
// Métodos definidos:
//
// get_indicadores_panel($id)
// get_mediciones_indicador($id)
// get_subunidades_indicador($id)
// get_valores_con_timestamp($id, $fecha_inicio, $fecha_fin, $periodo)
// get_valores_indicador($id, $fecha_inicio, $fecha_fin)
// get_valores_indicador_agrupado($id, $fecha_inicio, $fecha_fin, $periodo)
// get_valores_indicador_media($id)
// get_valores_indicador_suma($id)
// get_valores_medicion($id_medicion)
// get_valores_indicador_por_fecha($id, $id_entidad, $fecha_inicio, $fecha_fin)
// get_indicadores_panel_con_datos($id_panel, $fecha_inicio, $fecha_fin)
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
      if (isset($_REQUEST["id"], $_REQUEST["fecha_inicio"], $_REQUEST["fecha_fin"])) 
      {
        $id = sanitize($_REQUEST["id"],INT);
        $fecha_inicio = sanitize($_REQUEST["fecha_inicio"], SQL);
        $fecha_fin = sanitize($_REQUEST["fecha_fin"], SQL);
        $periodo = isset($_REQUEST["periodicidad"])?sanitize($_REQUEST["periodicidad"], SQL):"todos";
        $metodo($id, $fecha_inicio, $fecha_fin, $periodo);
      }
      else if (isset($_REQUEST["id"]))
      {
        $id = sanitize($_REQUEST["id"], INT);
        $metodo($id);
      }
      else
      {
        $metodo();
      }
    }
    else
    {
      echo "No existe la funcion $metodo";
    }
  }
}
else
{
  echo "Error de conexion a la base de datos";
}

// --------------------------------------------------------------------------- 

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

// --------------------------------------------------------------------------- 

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

// --------------------------------------------------------------------------- 

// Devuelve una lista de subunidades asosciadas a la medición de un indicador
// Se utiliza en consulta_avanzada
function get_subunidades_indicador($id)
{
  $query = "SELECT entidades.id, entidades.etiqueta, entidades.nombre, entidades.etiqueta_mini as etiqueta_mini
            FROM entidades INNER JOIN indicadores_subunidades ON entidades.id = indicadores_subunidades.id_entidad
            WHERE indicadores_subunidades.id_indicador = $id 
            ORDER BY entidades.orden"; 
  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  $datos = json_encode($datos);
  echo $datos;
}

// --------------------------------------------------------------------------- 
// Es una nueva función que devuelve las fechas de las mediciones en formato timestamp de javascript
// Devuelve todos los valores recogidos para un indicador incluyendo los recogidos a nivel de subunidad (cuando exista)
// También devuelve los totales de dichos valores en función del operador definido en el indicador
// Se utiliza en consulta_avanzada, en ficha indicador, en mediciones y en cuadro_mostrar
// Ejemplo de llamada:
// http://localhost/icasus/api_publica.php?metodo=get_valores_con_timestamp&id=5018&fecha_inicio=2012-01-01&fecha_fin=2012-12-31&periodicidad=anual
// --------------------------------------------------------------------------- 
function get_valores_con_timestamp($id, $fecha_inicio = 0, $fecha_fin = 0, $periodo = "todos")
{
  // Preparamos el tipo de operador que vamos a usar para calcular totales y agrupados
  // También cogemos el id de la entidad para devolver la mediana (mediana con trampa que se coge directamente de la unidad madre)
  $query = "SELECT tipo_agregacion.operador as operador, indicadores.id_entidad as id_entidad , indicadores.calculo as calculo 
            FROM tipo_agregacion
            INNER JOIN indicadores ON tipo_agregacion.id = indicadores.id_tipo_agregacion
            WHERE indicadores.id = $id";
  $operador = 'SUM'; // valor por defecto
  if ($resultado = mysql_query($query))
  {
    if ($registro = mysql_fetch_assoc($resultado))
    {
      $operador = $registro['operador'];
      $id_entidad = $registro['id_entidad'];
      $calculo = $registro['calculo'];
    }
  }

  // Devuelve los valores recogidos para todas las subunidades
  // mediciones.id as id_medicion, mediciones.etiqueta as medicion,
  $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, 
            UNIX_TIMESTAMP(MIN(mediciones.periodo_inicio))*1000 as periodo_fin, 
            entidades.etiqueta as unidad, entidades.id as id_unidad, valores.valor, 
            entidades.etiqueta_mini as etiqueta_mini
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
  if ($periodo == "anual")
  {
    $query .= " GROUP BY id_unidad, YEAR(mediciones.periodo_inicio)";
  }
  else if ($periodo == "mensual")
  {
    $query .= " GROUP BY id_unidad, YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio)";
  }
  else if ($periodo == "todos")
  {
    // Funcionará mientras icasus no tenga mediciones intradiarias
    $query .= " GROUP BY id_unidad, YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio), DAY(mediciones.periodo_inicio)";
  }
  $query .= " ORDER BY mediciones.periodo_inicio";
  $resultado = mysql_query($query);

  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  // Aquí van los totales, si el indicador es calculado usamos obtener_total_calculado
  if ($calculo)
  {
    $totales = obtener_total_calculado($id, $fecha_inicio, $fecha_fin, $periodo);
    $datos = array_merge($datos, $totales);
  }
  else
  {
    if ($operador == 'MEDIANA')
    {
      // Si el operador de agregado es 'mediana' cogemos del tirón los valores de la unidad madre
      $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, 
              UNIX_TIMESTAMP(MIN(mediciones.periodo_inicio))*1000 as periodo_fin, 
              'Total' as unidad, 0 as id_unidad, valores.valor as valor 
              FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
              WHERE valores.id_entidad = $id_entidad AND mediciones.id_indicador = $id AND valor IS NOT NULL";
    }
    else
    {
      $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, 
              UNIX_TIMESTAMP(MIN(mediciones.periodo_inicio))*1000 as periodo_fin, 
              'Total' as unidad, 0 as id_unidad, $operador(valores.valor) as valor 
              FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
              WHERE mediciones.id_indicador = $id AND valor IS NOT NULL";
    } 
    if ($fecha_inicio > 0)
    {
      $query .= " AND mediciones.periodo_inicio >=  '$fecha_inicio'";
    }
    if ($fecha_fin > 0)
    {
      $query .= " AND mediciones.periodo_fin <= '$fecha_fin'";
    }
    if ($periodo == "anual")
    {
      $query .= " GROUP BY YEAR(mediciones.periodo_inicio)";
    }
    else if ($periodo == "mensual")
    {
      $query .= " GROUP BY YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio)";
    }
    else if ($periodo == "todos")
    {
      // Truco para agrupar sin agrupar cuando se quieren todas las mediciones
      // Funcionará mientras icasus no tenga mediciones intradiarias
      $query .= " GROUP BY YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio), DAY(mediciones.periodo_inicio)";
    }
    $query .= " ORDER BY mediciones.periodo_inicio";

    $resultado = mysql_query($query);
    while ($registro = mysql_fetch_assoc($resultado))
    {
      $datos[] = $registro;
    }
  }
  
  // TODO
  // Valores de referencia: objetivos, mínimos, etc.
  $query = "SELECT m.id as id_medicion, m.etiqueta as medicion, 
            UNIX_TIMESTAMP(m.periodo_inicio)*1000 as periodo_fin, 
            r.etiqueta as unidad, NULL as id_unidad, valor, TRUE as referencia 
            FROM valores_referencia r
            INNER JOIN `valores_referencia_mediciones` rm ON rm.`id_valor_referencia` = r.id
            INNER JOIN mediciones m ON rm.`id_medicion` = m.`id`
            WHERE m.`id_indicador` = $id AND grafica = 1
            ORDER BY periodo_inicio";
  
  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  
  // Convertimos las tres 'tacadas' de datos a json 
  $datos = json_encode($datos);
  echo $datos;
}
// --------------------------------------------------------------------------- 
// Devuelve todos los valores recogidos para un indicador incluyendo los recogidos a nivel de subunidad (cuando exista)
// También devuelve los totales de dichos valores en función del operador definido en el indicador
// En desuso, eliminar cuando se pueda
function get_valores_indicador($id, $fecha_inicio = 0, $fecha_fin = 0)
{
  $query = "SELECT tipo_agregacion.operador as operador FROM tipo_agregacion
            INNER JOIN indicadores ON tipo_agregacion.id = indicadores.id_tipo_agregacion
            WHERE indicadores.id = $id";
  $operador = 'SUM';
  if ($resultado = mysql_query($query))
  {
    if ($registro = mysql_fetch_assoc($resultado))
    {
      $operador = $registro['operador'];
    }
  }

  //Aquí van los valores de cada una de las subunidades
  $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, 
            entidades.etiqueta as unidad, entidades.id as id_unidad, valores.valor,
            entidades.etiqueta_mini as etiqueta_mini
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

// Parecido al anterior pero con agrupamiento anual, mensual, etc
// Se usa en cuadro_mostrar para los gráficos de barra
// http://icasus.dev/api_publica.php?metodo=get_valores_indicador_agrupado&id=5035&fecha_inicio=2010-01-01&fecha_fin=2013-12-31&periodo=anual
function get_valores_indicador_agrupado($id, $fecha_inicio = 0, $fecha_fin = 0, $periodo="todo")
{
  $query = "SELECT tipo_agregacion.operador as operador, indicadores.id_entidad as id_entidad, indicadores.calculo as calculo
            FROM tipo_agregacion
            INNER JOIN indicadores ON tipo_agregacion.id = indicadores.id_tipo_agregacion
            WHERE indicadores.id = $id";
  if ($resultado = mysql_query($query))
  {
    if ($registro = mysql_fetch_assoc($resultado))
    {
      $operador = $registro['operador'];
      $id_entidad = $registro['id_entidad'];
      $calculo = $registro['calculo'];
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

  //Aquí van los valores de todas las subunidades
  $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, 
            entidades.etiqueta as unidad, entidades.id as id_unidad, valores.valor,
            entidades.etiqueta_mini as etiqueta_mini
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
  if ($periodo == "anual")
  {
    $query .= " GROUP BY id_unidad, etiqueta_mini, YEAR(mediciones.periodo_inicio)";
  }
  else if ($periodo == "mensual")
  {
    $query .= " GROUP BY id_unidad, etiqueta_mini, YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio)";
  }
  else if ($periodo == "todos")
  {
    // Truco para agrupar sin agrupar cuando se quieren todas las mediciones
    // Funcionará mientras icasus no tenga mediciones intradiarias
    $query .= " GROUP BY id_unidad, etiqueta_mini, YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio), DAY(mediciones.periodo_inicio)";
  }
  $query .= " ORDER BY entidades.orden"; 
  $resultado = mysql_query($query);

  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  // Aquí van los totales, si el indicador es calculado usamos obtener_total_calculado
  if ($calculo)
  {
    $totales = obtener_total_calculado($id, $fecha_inicio, $fecha_fin, $periodo);
    $datos = array_merge($datos, $totales);
  }
  else
  {
    if ($operador == 'MEDIANA')
    {
      $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, 'Total' as unidad, 0 as id_unidad,  valores.valor
              FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
              WHERE mediciones.id_indicador = $id AND id_entidad = $id_entidad AND valor IS NOT NULL"; 
    }
    else
    {
      $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, 'Total' as unidad, 0 as id_unidad, $operador(valores.valor) as valor 
              FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
              WHERE mediciones.id_indicador = $id AND valor IS NOT NULL";
    }

    if ($fecha_inicio > 0)
    {
      $query .= " AND mediciones.periodo_inicio >= '$fecha_inicio'";
    }
    if ($fecha_fin > 0)
    {
      $query .= " AND mediciones.periodo_fin <= '$fecha_fin'";
    }
    if ($periodo == "anual")
    {
      $query .= " GROUP BY YEAR(mediciones.periodo_inicio)";
    }
    else if ($periodo == "mensual")
    {
      $query .= " GROUP BY YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio)";
    }
    else if ($periodo == "todos")
    {
      // Truco para agrupar sin agrupar cuando se quieren todas las mediciones
      // Funcionará mientras icasus no tenga mediciones intradiarias
      $query .= " GROUP BY YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio), DAY(mediciones.periodo_inicio)";
    }

    $resultado = mysql_query($query);
    while ($registro = mysql_fetch_assoc($resultado))
    {
      $datos[] = $registro;
    }
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

// Devuelve todos los valores recogidos para una medicion concreta de un indicador 
// Es útil sólo en aquellos indicadores que se midan por subunidades
// También devuelve el total de dichos valores en función del operador definido en el indicador
// Se utiliza en cuadro_mostrar
// Ejemplo:
// http://localhost/icasus/api_publica.php?metodo=api_publica.php&metodo=get_valores_medicion&id=218
function get_valores_medicion($id_medicion)
{
  // Vamos a ver que tipo de agregación tiene este indicador
  $query = "SELECT tipo_agregacion.operador as operador FROM tipo_agregacion
            INNER JOIN indicadores ON tipo_agregacion.id = indicadores.id_tipo_agregacion
            INNER JOIN mediciones ON mediciones.id_indicador = indicadores.id
            WHERE mediciones.id = $id_medicion";
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

  $query = "SELECT mediciones.etiqueta as medicion, entidades.etiqueta as unidad, 
            entidades.id as id_unidad, valores.valor,
            entidades.etiqueta_mini as etiqueta_mini
            FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
            INNER JOIN entidades ON entidades.id = valores.id_entidad
            WHERE mediciones.id = $id_medicion AND valor IS NOT NULL
            ORDER BY unidad";
  $resultado = mysql_query($query);

  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  // Aquí van los totales
  $query = "SELECT mediciones.etiqueta as medicion, 'Total' as unidad, 0 as id_unidad, $operador(valores.valor) as valor 
            FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
            WHERE mediciones.id = $id_medicion AND valor IS NOT NULL 
            GROUP BY mediciones.id";
  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  $datos = json_encode($datos);
  echo $datos;
}

function get_valores_indicador_por_fecha($id, $id_entidad, $fecha_inicio = 0, $fecha_fin = 0)
{
  $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, 
            entidades.etiqueta as unidad, entidades.id as id_unidad, valores.valor,
            entidades.etiqueta_mini as etiqueta_mini
            FROM mediciones 
            INNER JOIN valores ON mediciones.id = valores.id_medicion 
            INNER JOIN entidades ON entidades.id = valores.id_entidad
            WHERE mediciones.id_indicador = $id 
            AND entidades.id = $id_entidad
            AND valor IS NOT NULL"; 
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

// El id es el id del panel
// Se usa en las tablas múltiples de los cuadros de mando (la biblioteca en cifras)
// IMPORTANTE: De momento agrupa por años
// Ejemplo: http://localhost/icasus/api_publica.php?metodo=api_publica.php&metodo=get_indicadores_panel_con_datos&id_panel=748

function get_indicadores_panel_con_datos($id_panel, $fecha_inicio = 0, $fecha_fin = 0)
{
  $indicadores = array();

  $query = "SELECT indicadores.id as id_indicador, indicadores.codigo as codigo, 
            indicadores.nombre as nombre, panel_indicadores.id_entidad as entidad, 
            panel_indicadores.id_serietipo as id_serietipo, tipo_agregacion.operador as operador
            FROM indicadores 
            INNER JOIN panel_indicadores ON indicadores.id = panel_indicadores.id_indicador 
            INNER JOIN tipo_agregacion ON tipo_agregacion.id = indicadores.id_tipo_agregacion
            WHERE panel_indicadores.id_panel = $id_panel ORDER BY panel_indicadores.id";

  $resultado = mysql_query($query);
  while ($indicador = mysql_fetch_assoc($resultado))
  {
    $id_indicador = $indicador['id_indicador'];
    $id_entidad = $indicador['entidad'];
    $operador = $indicador['operador'];
    $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, 
              entidades.etiqueta as unidad, entidades.id as id_unidad, 
              $operador(valores.valor) as valor,
              entidades.etiqueta_mini as etiqueta_mini,
              YEAR(mediciones.periodo_inicio) as anio
              FROM mediciones 
              INNER JOIN valores ON mediciones.id = valores.id_medicion 
              INNER JOIN entidades ON entidades.id = valores.id_entidad
              WHERE mediciones.id_indicador = $id_indicador 
              AND entidades.id = $id_entidad
              AND valor IS NOT NULL"; 
    if ($fecha_inicio > 0)
    {
      $query .= " AND mediciones.periodo_inicio >= '$fecha_inicio'";
    }
    if ($fecha_fin > 0)
    {
      $query .= " AND mediciones.periodo_fin <= '$fecha_fin'";
    }
    // Agrupamos por año 
    // TODO: agrupar por otros periodos cuando se agregue la variables periodicidad a la función 
    $query .= " GROUP BY YEAR(mediciones.periodo_inicio) ORDER BY mediciones.periodo_inicio";
    $resultado2 = mysql_query($query);
    
    $valores = array();
    while ($valor = mysql_fetch_assoc($resultado2))
    {
      $valores[] = $valor;
    }
    $indicadores[] = array('indicador' => $indicador, 'valores' => $valores);
  }
  $datos = json_encode($indicadores);
  echo $datos;
}

// --------------------------------------------------------------------------- 
// Función para probar el funcionamiento de las dos siguientes
// --------------------------------------------------------------------------- 
function prueba_calculo($id_indicador, $fecha_inicio, $fecha_fin, $periodo)
{
  $datos =obtener_total_calculado($id_indicador, $fecha_inicio, $fecha_fin, $periodo);
  $datos = json_encode($datos);
  echo $datos;
}

// --------------------------------------------------------------------------- 
// Realiza los cálculos para obtener los totales de un indicador calculado
// Ejemplo de llamada:
// http://localhost/icasus/api_publica.php?metodo=get_valores_calculados&id=5035&fecha_inicio=2010-01-01&fecha_fin=2013-12-31&periodicidad=anual
// --------------------------------------------------------------------------- 
function obtener_total_calculado($id_indicador, $fecha_inicio, $fecha_fin, $periodo)
{
  $elementos_calculo = array();
  $query = "SELECT i.calculo, ta.operador FROM indicadores i INNER JOIN tipo_agregacion ta ON i.id_tipo_agregacion = ta.id  WHERE i.id = $id_indicador";
  $resultado = mysql_query($query);
  $registro = mysql_fetch_assoc($resultado);
  $calculo = $registro['calculo'];
  $operador = $registro['operador'];

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
      continue; //esto es para saltarnos el resto del bucle y volver al foreach
    }
    if ($elemento == "]")
    {
      // Si el contenido de la variable es un número
      // nos indica que se trata de un indicador existente
      // en caso contrario sería un valor a introducir y en este 
      // contexto no tiene sentido por lo que ponemos cero
      // (en realidad en un futuro no lo tendrá en ninguno)
      if (is_numeric($variable))
      {
        $id_indicador_parcial = (int)$variable;
        $totales[$id_indicador_parcial] = obtener_totales_simples($id_indicador_parcial, $operador, $fecha_inicio, $fecha_fin, $periodo);
        $formula .= "\$totales['$id_indicador_parcial'][\$i]['valor']";
      }
      else
      {
        $formula .= '0';
      }
      $es_variable = false;
      continue; //esto es para saltarnos el resto del bucle y volver al foreach
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
  for ($i = 0; $i < count($totales[$id_indicador_parcial]); $i++)
  {
    eval("\$total_calculado = $formula;");
    $totales_calculados[] = array(
                              "id_medicion" => (int)$totales[$id_indicador_parcial][$i]['id_medicion'], 
                              "medicion" => (int)$totales[$id_indicador_parcial][$i]['medicion'], 
                              "periodo_fin" => (int)$totales[$id_indicador_parcial][$i]['periodo_fin'], 
                              "unidad" => "Total", "id_unidad" => 0, 
                              "valor" => $total_calculado);
  }
  return $totales_calculados;
}

// --------------------------------------------------------------------------- 

function obtener_totales_simples($id_indicador, $operador='SUM', $fecha_inicio='0', $fecha_fin='0', $periodo='todos')
{
  $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion, 
            UNIX_TIMESTAMP(MIN(mediciones.periodo_inicio))*1000 as periodo_fin, 
            $operador(valores.valor) as valor  
            FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion 
            WHERE mediciones.id_indicador = $id_indicador AND valor IS NOT NULL"; 
  if ($fecha_inicio > 0)
  {
    $query .= " AND mediciones.periodo_inicio >=  '$fecha_inicio'";
  }
  if ($fecha_fin > 0)
  {
    $query .= " AND mediciones.periodo_fin <= '$fecha_fin'";
  }
  if ($periodo == "anual")
  {
    $query .= " GROUP BY YEAR(mediciones.periodo_inicio)";
  }
  else if ($periodo == "mensual")
  {
    $query .= " GROUP BY YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio)";
  }
  else if ($periodo == "todos")
  {
    // Truco para agrupar sin agrupar cuando se quieren todas las mediciones
    // Funcionará mientras icasus no tenga mediciones intradiarias
    $query .= " GROUP BY YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio), DAY(mediciones.periodo_inicio)";
  }
  $query .= " ORDER BY mediciones.periodo_inicio";
  $resultado = mysql_query($query);
  while ($registro = mysql_fetch_assoc($resultado))
  {
    $datos[] = $registro;
  }
  return $datos;
}
