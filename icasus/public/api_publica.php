<?php

// ---------------------------------------------------------------
// Proyecto: Icasus
// Archivo: public/api_publica.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
// ---------------------------------------------------------------
// Acceso público a los dato de Icasus
// Devuelve el resultado en formato JSON
// ---------------------------------------------------------------
// Métodos definidos:
//
// get_indicadores_panel($link,$id)
// get_subunidades_indicador($link,$id)
// get_valores_con_timestamp($link,$id, $fecha_inicio, $fecha_fin, $periodicidad)
// ---------------------------------------------------------------
// Funciones auxiliares
//
// obtener_total_calculado($link,$id_indicador, $fecha_inicio, $fecha_fin, $periodicidad)
// obtener_totales_simples($link,$id_indicador, $fecha_inicio, $fecha_fin, $periodicidad)
// ---------------------------------------------------------------
// Carga el app_config y conecta a la base de datos
// Es necesario porque este fichero no depende del controlador principal index.php
require_once("../app_code/app_config.php");
//Clase Utiilidad para los cálculos
require_once ('../class/Util.php');
//Fichero de idioma
require_once('../app_code/' . IC_LANG_FILE);

//Conexión con la BD
$link = mysqli_connect(IC_DB_HOST, IC_DB_LOGIN, IC_DB_CLAVE);
mysqli_query($link, "SET NAMES UTF8");

if (mysqli_select_db($link, IC_DB_DATABASE))
{
    // Capturamos y procesamos los datos de la petición
    if (filter_has_var(INPUT_GET, 'metodo'))
    {
        $metodo = filter_input(INPUT_GET, 'metodo', FILTER_SANITIZE_STRING);
        if (function_exists($metodo))
        {
            if (filter_has_var(INPUT_GET, 'id') && filter_has_var(INPUT_GET, 'fecha_inicio') && filter_has_var(INPUT_GET, 'fecha_fin'))
            {
                $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
                $fecha_inicio = filter_input(INPUT_GET, 'fecha_inicio', FILTER_SANITIZE_STRING);
                $fecha_fin = filter_input(INPUT_GET, 'fecha_fin', FILTER_SANITIZE_STRING);
                $periodicidad = filter_has_var(INPUT_GET, 'periodicidad') ? filter_input(INPUT_GET, 'periodicidad', FILTER_SANITIZE_STRING) : "todos";
                $metodo($link, $id, $fecha_inicio, $fecha_fin, $periodicidad);
            }
            else if (filter_has_var(INPUT_GET, 'id') && filter_has_var(INPUT_GET, 'periodicidad'))
            {
                $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
                $periodicidad = filter_input(INPUT_GET, 'periodicidad', FILTER_SANITIZE_STRING);
                $metodo($link, $id, 0, 0, $periodicidad);
            }
            else if (filter_has_var(INPUT_GET, 'id'))
            {
                $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
                $metodo($link, $id);
            }
            else
            {
                $metodo($link);
            }
        }
        else
        {
            echo MSG_NO_MET_SOL . ':' . $metodo;
        }
    }
}
else
{
    echo ERR_CON_BD;
}

// ---------------------------------------------------------------------------
// Devuelve los indicadores asociados a un panel de un cuadro de mando
// Se utiliza en cuadro_mostrar
function get_indicadores_panel($link, $id)
{
    $query = "SELECT indicadores.id, indicadores.codigo, indicadores.nombre, panel_indicadores.id_entidad
  FROM indicadores
  INNER JOIN panel_indicadores ON indicadores.id = panel_indicadores.id_indicador
  WHERE panel_indicadores.id_panel = $id ORDER BY codigo";

    $resultado = mysqli_query($link, $query);
    while ($registro = mysqli_fetch_assoc($resultado))
    {
        $datos[] = $registro;
    }
    $datos = json_encode($datos);
    echo $datos;
}

// ---------------------------------------------------------------------------
// Devuelve una lista de subunidades asociadas a la medición de un indicador
// Se utiliza en consulta_avanzada
function get_subunidades_indicador($link, $id)
{
    $query = "SELECT entidades.id, entidades.etiqueta, entidades.nombre, entidades.etiqueta_mini as etiqueta_mini
            FROM entidades INNER JOIN indicadores_subunidades ON entidades.id = indicadores_subunidades.id_entidad
            WHERE indicadores_subunidades.id_indicador = $id
            ORDER BY entidades.orden";
    $resultado = mysqli_query($link, $query);
    while ($registro = mysqli_fetch_assoc($resultado))
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
function get_valores_con_timestamp($link, $id, $fecha_inicio = 0, $fecha_fin = 0, $periodicidad = "todos")
{
    // ------------------------------------------------------------------------------------------
    // Preparamos el tipo de operador que vamos a usar para calcular totales y agrupados
    // --------------------------------------------------------------------------------------------------

    $query_operadores = "SELECT agregacion_unidad.operador as operador, agregacion_temporal.operador as operador_temporal, indicadores.id_entidad as id_entidad, indicadores.calculo as calculo
            FROM indicadores
            INNER JOIN tipo_agregacion as agregacion_unidad 
            ON agregacion_unidad.id = indicadores.id_tipo_agregacion
            INNER JOIN tipo_agregacion as agregacion_temporal 
            ON agregacion_temporal.id = indicadores.id_tipo_agregacion_temporal
            WHERE indicadores.id = $id";

    $operador = 'SUM'; // valor por defecto
    $operador_temporal = 'SUM'; // valor por defecto
    if ($resultado = mysqli_query($link, $query_operadores))
    {
        if ($registro = mysqli_fetch_assoc($resultado))
        {
            $operador = $registro['operador'];
            $operador_temporal = $registro['operador_temporal'];
            $id_entidad = $registro['id_entidad'];
            $calculo = $registro['calculo'];
        }
        else
        {
            echo ERR_CONSULTA_OP;
        }
    }
    else
    {
        echo ERR_CONSULTA_EXE;
    }

    //------------------------------------------------------------------------------
    // Devuelve los valores recogidos para todas las subunidades
    // mediciones.id as id_medicion, mediciones.etiqueta as medicion,
    // TRAMPA GORDA: uso el periodo de inicio como periodo de fin
    // para que las gráficas anuales sean más coherentes
    //-----------------------------------------------------------------------------------

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
    if ($periodicidad == "anual")
    {
        $query .= " GROUP BY id_unidad, YEAR(mediciones.periodo_inicio)";
    }
    else if ($periodicidad == "mensual")
    {
        $query .= " GROUP BY id_unidad, YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio)";
    }
    else if ($periodicidad == "todos" || $periodicidad = "bienal")
    {
        // Funcionará mientras icasus no tenga mediciones intradiarias
        $query .= " GROUP BY id_unidad, YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio), DAY(mediciones.periodo_inicio)";
    }
    $query .= " ORDER BY mediciones.periodo_inicio";

    if (!$resultado = mysqli_query($link, $query))
    {
        echo ERR_CONSULTA_EXE;
    }

    while ($registro = mysqli_fetch_assoc($resultado))
    {
        $datos[] = $registro;
    }

    //-----------------------------------------------------------------------------------
    // Aquí van los totales, si el indicador es calculado usamos obtener_total_calculado
    //------------------------------------------------------------------------------------
    //Indicadores/datos calculados
    if ($calculo)
    {
        $totales = obtener_total_calculado($link, $id, $fecha_inicio, $fecha_fin, $periodicidad);
        $datos = array_merge($datos, $totales);
    }
    //Indicadores/datos no calculados
    else
    {
        $query_unidades = "SELECT MIN(mediciones.id) as id_medicion,
		MIN(mediciones.etiqueta) as medicion,MIN(mediciones.periodo_inicio) 
                as periodo_fin, 'Total' as unidad, 0 as id_unidad, 
                $operador(valores.valor) as valor FROM mediciones 
                INNER JOIN valores ON mediciones.id = valores.id_medicion 
                WHERE mediciones.id_indicador = $id AND valor IS NOT NULL";

        //Indicadores/datos con agregación de unidades manual
        if ($operador === 'MANUAL')
        {
            // Si el operador de agregado es 'manual' cogemos del tirón los valores de la unidad madre
            $query_unidades = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion,
              UNIX_TIMESTAMP(MIN(mediciones.periodo_inicio))*1000 as periodo_fin,
              'Total' as unidad, 0 as id_unidad, valores.valor as valor
              FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion
              WHERE valores.id_entidad = $id_entidad AND mediciones.id_indicador = $id AND valor IS NOT NULL";
        }
        //Indicadores/datos con agregación de unidades manual y agregación temporal (vista anual)
        if ($operador === 'MANUAL' && $operador_temporal !== NULL && $periodicidad == "anual")
        {
            //Debido a la particularidad de este caso generaremos 
            //nuestro propio json
            $array_manual = calcular_manual_intranual($id_entidad, $id, $operador_temporal, $link);
        }

        if ($fecha_inicio > 0)
        {
            $query_unidades .= " AND mediciones.periodo_inicio >=  '$fecha_inicio'";
        }
        if ($fecha_fin > 0)
        {
            $query_unidades .= " AND mediciones.periodo_fin <= '$fecha_fin'";
        }

        $query_unidades .= " GROUP BY YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio)";
        $query_unidades .= " ORDER BY mediciones.periodo_inicio DESC";

        if ($operador_temporal === 'LAST')
        {
            $query_temporal = "SELECT MIN(id_medicion) as id_medicion, MIN(medicion) as medicion, 
                UNIX_TIMESTAMP(MIN(periodo_fin))*1000 as periodo_fin, 
                MIN(unidad) as unidad, MIN(id_unidad) as id_unidad, valor
                FROM ($query_unidades) unidades";
        }
        else
        {
            $query_temporal = "SELECT MIN(id_medicion) as id_medicion, MIN(medicion) as medicion, 
                UNIX_TIMESTAMP(MIN(periodo_fin))*1000 as periodo_fin, 
                MIN(unidad) as unidad, MIN(id_unidad) as id_unidad, $operador_temporal(valor) as valor
                FROM ($query_unidades) unidades";
        }

        if ($periodicidad == "anual")
        {
            $query_temporal .= " GROUP BY YEAR(periodo_fin)";
        }
        else if ($periodicidad == "mensual")
        {
            $query_temporal .= " GROUP BY YEAR(periodo_fin), MONTH(periodo_fin)";
        }
        else if ($periodicidad == "todos" || $periodicidad = "bienal")
        {
            // Truco para agrupar sin agrupar cuando se quieren todas las mediciones
            // Funcionará mientras icasus no tenga mediciones intradiarias
            $query_temporal .= " GROUP BY YEAR(periodo_fin), MONTH(periodo_fin), DAY(periodo_fin)";
        }
        $query_temporal .= " ORDER BY periodo_fin";

        // Si el operador de agregacion entre unidades es manual y la periodicidad
        // no es intranual no tenemos en cuenta la agregación temporal
        if ($operador === 'MANUAL')
        {
            $query_temporal = $query_unidades;
        }

        //Indicadores/datos intranuales: valores parciales unidad/año
        if ($operador_temporal !== NULL && $periodicidad == "todos")
        {
            //Debido a la particularidad de este caso generaremos 
            //nuestro propio json
            $array_parciales = calcular_parciales_intranual($id, $operador_temporal, $link);
            //Añadimos los datos
            foreach ($array_parciales as $array)
            {
                $datos[] = $array;
            }
        }

        //Indicadores/datos con agregación de unidades manual y agregación temporal (vista anual)
        if ($operador === 'MANUAL' && $operador_temporal !== NULL && $periodicidad == "anual")
        {
            foreach ($array_manual as $array)
            {
                $datos[] = $array;
            }
        }
        else
        {
            $resultado = mysqli_query($link, $query_temporal);
            while ($registro = mysqli_fetch_assoc($resultado))
            {
                $datos[] = $registro;
            }
        }
    }

    //-----------------------------------------------------------------------------------------
    // Valores de referencia: objetivos, mínimos, etc.
    //------------------------------------------------------------------------------------------

    if ($operador_temporal === 'LAST')
    {
        $query_ref = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion,
            UNIX_TIMESTAMP(mediciones.periodo_inicio)*1000 as periodo_fin,
            valores_referencia.etiqueta as unidad, NULL as id_unidad, valor, TRUE as referencia
            FROM valores_referencia
            INNER JOIN valores_referencia_mediciones ON valores_referencia_mediciones.id_valor_referencia = valores_referencia.id
            INNER JOIN mediciones ON valores_referencia_mediciones.id_medicion = mediciones.id
            WHERE mediciones.id_indicador = $id AND grafica = 1";
    }
    else
    {
        $query_ref = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion,
            UNIX_TIMESTAMP(mediciones.periodo_inicio)*1000 as periodo_fin,
            valores_referencia.etiqueta as unidad, NULL as id_unidad, $operador_temporal(valor) as valor, TRUE as referencia
            FROM valores_referencia
            INNER JOIN valores_referencia_mediciones ON valores_referencia_mediciones.id_valor_referencia = valores_referencia.id
            INNER JOIN mediciones ON valores_referencia_mediciones.id_medicion = mediciones.id
            WHERE mediciones.id_indicador = $id AND grafica = 1";
    }

    if ($fecha_inicio > 0)
    {
        $query_ref .= " AND mediciones.periodo_inicio >=  '$fecha_inicio'";
    }
    if ($fecha_fin > 0)
    {
        $query_ref .= " AND mediciones.periodo_fin <= '$fecha_fin'";
    }
    if ($periodicidad == "anual")
    {
        $query_ref .= " GROUP BY unidad, YEAR(mediciones.periodo_inicio)";

        if ($operador_temporal === 'LAST')
        {
            $query_ref = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion,
                    UNIX_TIMESTAMP(mediciones.periodo_inicio)*1000 as periodo_fin, 
                    valores_referencia.etiqueta as unidad, NULL as id_unidad, valor, TRUE as referencia
                    FROM mediciones 
                    INNER JOIN valores_referencia_mediciones ON valores_referencia_mediciones.id_medicion = mediciones.id
                    INNER JOIN valores_referencia ON valores_referencia_mediciones.id_valor_referencia = valores_referencia.id 
                    WHERE (periodo_inicio, id_valor_referencia) IN
                    (SELECT max(mediciones.periodo_inicio) as periodo_inicio, valores_referencia_mediciones.id_valor_referencia
                    FROM mediciones 
                    INNER JOIN valores_referencia_mediciones ON valores_referencia_mediciones.id_medicion = mediciones.id
                    WHERE mediciones.id_indicador = $id AND valor IS NOT NULL AND grafica = 1
                    GROUP BY valores_referencia_mediciones.id_valor_referencia, YEAR (periodo_inicio))";
        }
    }
    else if ($periodicidad == "mensual")
    {
        $query_ref .= " GROUP BY unidad, YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio)";
    }
    else if ($periodicidad == "todos")
    {
        // Truco para agrupar sin agrupar cuando se quieren todas las mediciones
        // Funcionará mientras Icasus no tenga mediciones intradiarias
        $query_ref .= " GROUP BY unidad, YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio), DAY(mediciones.periodo_inicio)";
    }
    $query_ref .= " ORDER BY mediciones.periodo_inicio";

    $resultado = mysqli_query($link, $query_ref);
    while ($registro = mysqli_fetch_assoc($resultado))
    {
        $datos[] = $registro;
    }

    // Convertimos las tres 'tacadas' de datos a json
    if ($datos = json_encode($datos))
    {
        echo $datos;
    }
    else
    {
        echo json_last_error_msg();
    }
}

// ---------------------------------------------------------------------------
// Realiza los cálculos para obtener los totales de un indicador calculado
// Ejemplo de llamada:
// http://localhost/icasus/api_publica.php?metodo=obtener_total_calculado&id=5035&fecha_inicio=2010-01-01&fecha_fin=2013-12-31&periodicidad=anual
// ---------------------------------------------------------------------------
function obtener_total_calculado($link, $id_indicador, $fecha_inicio, $fecha_fin, $periodicidad)
{
    $elementos_calculo = array();
    $query = "SELECT i.calculo, ta.operador FROM indicadores i INNER JOIN tipo_agregacion ta ON i.id_tipo_agregacion = ta.id  WHERE i.id = $id_indicador";
    $resultado = mysqli_query($link, $query);
    $registro = mysqli_fetch_assoc($resultado);
    $calculo = $registro['calculo'];
    $operador = $registro['operador'];

    // Recorremos la cadena $calculo para sacar y calcular las variables
    // Almacenamos el resultado en $formula
    $es_variable = false;
    $formula = "";
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
                $id_indicador_parcial = (int) $variable;
                $totales[$id_indicador_parcial] = obtener_totales_simples($link, $id_indicador_parcial, $fecha_inicio, $fecha_fin, $periodicidad);
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
            "id_medicion" => (int) $totales[$id_indicador_parcial][$i]['id_medicion'],
            "medicion" => (int) $totales[$id_indicador_parcial][$i]['medicion'],
            "periodo_fin" => (int) $totales[$id_indicador_parcial][$i]['periodo_fin'],
            "unidad" => "Total", "id_unidad" => 0,
            "valor" => $total_calculado);
    }
    return $totales_calculados;
}

// ---------------------------------------------------------------------------

function obtener_totales_simples($link, $id_indicador, $fecha_inicio = '0', $fecha_fin = '0', $periodicidad = 'todos')
{
    // Obtenemos el operador o tipo de agregación del indicador
    $query = "SELECT ta.operador FROM indicadores i INNER JOIN tipo_agregacion ta ON i.id_tipo_agregacion = ta.id  WHERE i.id = $id_indicador";
    $resultado = mysqli_query($link, $query);
    $registro = mysqli_fetch_assoc($resultado);
    $operador = $registro['operador'];

    // Aquí vienen los totales
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
    $resultado = mysqli_query($link, $query);
    while ($registro = mysqli_fetch_assoc($resultado))
    {
        $datos[] = $registro;
    }
    return $datos;
}

//Función que devuelve el array en formato json con el resultado del 
//calculo anual en indicadores/datos manuales intranuales
function calcular_manual_intranual($id_entidad, $id, $operador_temporal, $link)
{
    $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion,
              UNIX_TIMESTAMP(MIN(mediciones.periodo_inicio))*1000 as periodo_fin,
              'Total' as unidad, 0 as id_unidad, valores.valor as valor
              FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion
              WHERE valores.id_entidad = $id_entidad AND mediciones.id_indicador = $id "
            . "AND valor IS NOT NULL GROUP BY YEAR(mediciones.periodo_inicio), "
            . "MONTH(mediciones.periodo_inicio)";

    $result = mysqli_query($link, $query);

    //Años para los que se han recogido valores
    $anyos = array();
    //Valores recogidos durante un año
    $parciales = array();

    foreach ($result as $row)
    {
        $medicion = $row['medicion'];
        $anyo_intra = explode('.', $medicion);
        $anyo = $anyo_intra[0];
        if ($parciales[$anyo])
        {
            array_push($parciales[$anyo], $row['valor']);
        }
        else
        {
            $parciales[$anyo] = array();
            array_push($anyos, $anyo);
            array_push($parciales[$anyo], $row['valor']);
        }
    }

    //Totales recogidos durante un año
    $totales = array();
    $totales_json = array();
    foreach ($anyos as $a)
    {
        switch ($operador_temporal)
        {
            case 'LAST':
                $totales[$a] = $parciales[$a][count($parciales) - 1];
                break;
            case 'MAX':
                $totales[$a] = Util::maximo($parciales[$a]);
                break;
            case 'SUM':
                $totales[$a] = Util::sumatorio($parciales[$a]);
                break;
            case 'AVG':
                $totales[$a] = Util::media($parciales[$a]);
                break;
            default:
                break;
        }
        array_push($totales_json, array(
            "id_medicion" => 0,
            "medicion" => $a,
            "periodo_fin" => mktime(0, 0, 0, 12, 31, $a) * 1000,
            "unidad" => "Total",
            "id_unidad" => "0",
            "valor" => $totales[$a]
        ));
    }

    return $totales_json;
}

//Para indicadores/datos intranuales calcula los valores parciales del año por unidad
function calcular_parciales_intranual($id, $operador_temporal, $link)
{

    $query = "SELECT mediciones.id as id_medicion, mediciones.etiqueta as medicion,
            UNIX_TIMESTAMP(MIN(mediciones.periodo_inicio))*1000 as periodo_fin,
            entidades.etiqueta as unidad, entidades.id as id_unidad, valores.valor,
            entidades.etiqueta_mini as etiqueta_mini
            FROM mediciones INNER JOIN valores ON mediciones.id = valores.id_medicion
            INNER JOIN entidades ON entidades.id = valores.id_entidad
            WHERE mediciones.id_indicador = $id AND valor IS NOT NULL GROUP BY id_unidad, "
            . "YEAR(mediciones.periodo_inicio), MONTH(mediciones.periodo_inicio), "
            . "DAY(mediciones.periodo_inicio)";

    //Agrupamos por unidad y año
    $result = mysqli_query($link, $query);

    //Años para los que se han recogido valores
    $anyos = array();
    //Unidades para las que existen valores
    $unidades = array();
    //Valores recogidos durante un año por unidad
    $parciales = array();

    foreach ($result as $row)
    {
        $medicion = $row['medicion'];
        $id_unidad = $row['id_unidad'];
        $anyo_intra = explode('.', $medicion);
        $anyo = $anyo_intra[0];
        if ($parciales[$anyo][$id_unidad])
        {
            array_push($parciales[$anyo][$id_unidad], $row['valor']);
        }
        else
        {
            $unidades[$id_unidad] = $row['etiqueta_mini'];
            $parciales[$anyo][$id_unidad] = array();
            array_push($anyos, $anyo);
            array_push($parciales[$anyo][$id_unidad], $row['valor']);
        }
    }

    //Totales recogidos durante un año por unidad
    $totales = array();
    $totales_json = array();
    foreach ($anyos as $a)
    {
        foreach ($unidades as $id_unidad => $unidad)
        {
            //Comprobar si existen mediciones de esa unidad para ese año no procesadas
            if ($parciales[$a][$id_unidad] && $totales[$a][$id_unidad] == NULL)
            {
                switch ($operador_temporal)
                {

                    case 'LAST':
                        $totales[$a][$id_unidad] = $parciales[$a][$id_unidad][count($parciales[$a][$id_unidad]) - 1];
                        break;
                    case 'MAX':
                        $totales[$a][$id_unidad] = Util::maximo($parciales[$a][$id_unidad]);
                        break;
                    case 'SUM':
                        $totales[$a][$id_unidad] = Util::sumatorio($parciales[$a][$id_unidad]);
                        break;
                    case 'AVG':
                        $totales[$a][$id_unidad] = Util::media($parciales[$a][$id_unidad]);
                        break;
                    default:
                        break;
                }
                array_push($totales_json, array(
                    "id_medicion" => 0,
                    "medicion" => $a,
                    "periodo_fin" => mktime(0, 0, 0, 12, 31, $a) * 1000,
                    "unidad" => "Total_parcial",
                    "etiqueta_mini" => "$unidad",
                    "id_unidad" => $id_unidad,
                    "valor" => $totales[$a][$id_unidad]
                ));
            }
        }
    }

    return $totales_json;
}
