<?php

/* ----------------------------------------------------------------------------------------
  // Proyecto: Icasus
  // Archivo: public/api_publica.php
  // Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
  // Joaquín Valonero Zaera (tecnibus1@us.es)
  // --------------------------------------------------------------------------------------
  // Acceso público a los dato de Icasus
  // Devuelve el resultado en formato JSON
  // No utiliza adodb
  // --------------------------------------------------------------------------------------
  // Métodos definidos:
  //
  // get_indicadores_panel($link,$id)
  // get_subunidades_indicador($link,$id)
  // get_valores_con_timestamp($link,$id, $fecha_inicio, $fecha_fin, $periodicidad)
  // -------------------------------------------------------------------------------------
  // Funciones auxiliares
  //
  // obtener_total_calculado($link,$id_indicador, $fecha_inicio, $fecha_fin, $periodicidad)
  // obtener_totales_simples($link,$id_indicador, $fecha_inicio, $fecha_fin, $periodicidad)
  // --------------------------------------------------------------------------------------
 */

// Carga el app_config y conecta a la base de datos
// Es necesario porque este fichero no depende del controlador principal index.php 
require_once("../app_code/app_config.php");
//Clase Utilidad para los cálculos
require_once('../app_code/util/Util.php');
//Fichero de idioma
require_once('../app_code/' . IC_LANG_FILE);

//Conexión con la BD
$link = mysqli_connect(IC_DB_HOST, IC_DB_LOGIN, IC_DB_CLAVE);
mysqli_query($link, "SET NAMES UTF8");

if (mysqli_select_db($link, IC_DB_DATABASE)) {
    // Capturamos y procesamos los datos de la petición
    if (filter_has_var(INPUT_GET, 'metodo')) {
        $metodo = filter_input(INPUT_GET, 'metodo', FILTER_SANITIZE_STRING);
        if (function_exists($metodo)) {
            if (filter_has_var(INPUT_GET, 'id') && filter_has_var(INPUT_GET, 'fecha_inicio') && filter_has_var(INPUT_GET, 'fecha_fin')) {
                $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
                $fecha_inicio = filter_input(INPUT_GET, 'fecha_inicio', FILTER_SANITIZE_STRING);
                $fecha_fin = filter_input(INPUT_GET, 'fecha_fin', FILTER_SANITIZE_STRING);
                $periodicidad = filter_has_var(INPUT_GET, 'periodicidad') ? filter_input(INPUT_GET, 'periodicidad', FILTER_SANITIZE_STRING) : "todos";
                $metodo($link, $id, $fecha_inicio, $fecha_fin, $periodicidad);
            } else if (filter_has_var(INPUT_GET, 'id') && filter_has_var(INPUT_GET, 'periodicidad')) {
                $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
                $periodicidad = filter_input(INPUT_GET, 'periodicidad', FILTER_SANITIZE_STRING);
                $metodo($link, $id, 0, 0, $periodicidad);
            } else if (filter_has_var(INPUT_GET, 'id')) {
                $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
                $metodo($link, $id);
            } else {
                $metodo($link);
            }
        } else {
            echo MSG_NO_MET_SOL . ':' . $metodo;
        }
    }
} else {
    echo ERR_CON_BD;
}

// ---------------------------------------------------------------------------
// Devuelve el número de planes estratégicos, procesos, indicadores/datos y 
// cuadros de mando de la unidad cuyo identificador recibe como parámetro
function info_unidad($link, $id)
{
    $query_unidad = "SELECT e.nombre FROM icasus_entidad e WHERE e.id=$id";
    $query_planes = "SELECT * FROM icasus_plan p WHERE p.id_entidad=$id";
    $query_cartas = "SELECT * FROM icasus_carta c WHERE c.id_entidad=$id";
    $query_procesos = "SELECT * FROM icasus_proceso p WHERE p.id_entidad=$id";
    $query_indicadores = "SELECT * FROM icasus_indicador i WHERE i.id_entidad=$id AND i.archivado is NULL";
    $query_cuadros = "SELECT * FROM icasus_cuadro c WHERE c.id_entidad=$id AND c.privado=0";

    $unidad = mysqli_fetch_assoc(mysqli_query($link, $query_unidad))['nombre'];
    $num_planes = mysqli_num_rows(mysqli_query($link, $query_planes));
    $num_cartas = mysqli_num_rows(mysqli_query($link, $query_cartas));
    $num_procesos = mysqli_num_rows(mysqli_query($link, $query_procesos));
    $num_indicadores = mysqli_num_rows(mysqli_query($link, $query_indicadores));
    $num_cuadros = mysqli_num_rows(mysqli_query($link, $query_cuadros));

    //Añadimos al array de resultados como json
    $datos = array(
        "unidad" => $unidad,
        "num_planes" => $num_planes,
        "num_cartas" => $num_cartas,
        "num_procesos" => $num_procesos,
        "num_indicadores" => $num_indicadores,
        "num_cuadros" => $num_cuadros
    );
    $json = json_encode($datos, JSON_UNESCAPED_UNICODE);
    echo $json;
}

// ---------------------------------------------------------------------------
// Devuelve los indicadores asociados a un panel de un cuadro de mando
// Se utiliza en cuadro_mostrar
function get_indicadores_panel($link, $id)
{
    $query = "SELECT i.id, i.codigo, i.nombre, pi.id_entidad
              FROM icasus_indicador i
              INNER JOIN icasus_panel_indicador pi ON i.id = pi.id_indicador
              WHERE pi.id_panel = $id 
              ORDER BY i.codigo";

    $resultado = mysqli_query($link, $query);
    while ($registro = mysqli_fetch_assoc($resultado)) {
        $datos[] = $registro;
    }
    $datos = json_encode($datos, JSON_UNESCAPED_UNICODE);
    echo $datos;
}

// ---------------------------------------------------------------------------
// Devuelve una lista de subunidades asociadas a la medición de un indicador
// Se utiliza en consulta_avanzada
function get_subunidades_indicador($link, $id)
{
    $query = "SELECT e.id, e.etiqueta, e.nombre, e.etiqueta_mini as etiqueta_mini
              FROM icasus_entidad e 
              INNER JOIN icasus_indicador_subunidad i ON e.id = i.id_entidad
              WHERE i.id_indicador = $id
              ORDER BY e.orden";
    $resultado = mysqli_query($link, $query);
    while ($registro = mysqli_fetch_assoc($resultado)) {
        $datos[] = $registro;
    }
    $datos = json_encode($datos, JSON_UNESCAPED_UNICODE);
    echo $datos;
}

/**
 * Es una nueva función que devuelve las fechas de las mediciones en formato timestamp de javascript
 * Devuelve todos los valores recogidos para un indicador incluyendo los recogidos a nivel de subunidad (cuando exista)
 * También devuelve los totales de dichos valores en función del operador definido en el indicador
 * Se utiliza en consulta_avanzada, en ficha de indicador, en mediciones y en cuadro_mostrar
 * Ejemplo de llamada:
 * https://localhost/icasus/api_publica.php?metodo=get_valores_con_timestamp&id=5018&fecha_inicio=2012-01-01&fecha_fin=2012-12-31&periodicidad=anual
 * @param $link
 * @param int $id
 * @param string $fecha_inicio
 * @param string $fecha_fin
 * @param string $periodicidad
 * @return void
 */
function get_valores_con_timestamp($link, int $id, string $fecha_inicio = '', string $fecha_fin = '', string $periodicidad = "todos"): void
{
    // ------------------------------------------------------------------------------------------
    // Preparamos el tipo de operador que vamos a usar para calcular totales y agrupados
    // --------------------------------------------------------------------------------------------------

    $datos = $array_manual = [];
    $query_operadores = "SELECT agregacion_unidad.operador as operador, agregacion_temporal.operador as operador_temporal, 
            i.id_entidad as id_entidad, i.calculo as calculo
            FROM icasus_indicador i
            INNER JOIN icasus_tipo_agregacion as agregacion_unidad ON agregacion_unidad.id = i.id_tipo_agregacion
            INNER JOIN icasus_tipo_agregacion as agregacion_temporal ON agregacion_temporal.id = i.id_tipo_agregacion_temporal
            WHERE i.id = $id";

    $operador = 'SUM'; // valor por defecto
    $operador_temporal = 'SUM'; // valor por defecto
    if ($resultado = mysqli_query($link, $query_operadores)) {
        if ($registro = mysqli_fetch_assoc($resultado)) {
            $operador = $registro['operador'];
            $operador_temporal = $registro['operador_temporal'];
            $id_entidad = $registro['id_entidad'];
            $calculo = $registro['calculo'];
        } else {
            echo ERR_CONSULTA_OP;
        }
    } else {
        echo ERR_CONSULTA_EXE;
    }

    //------------------------------------------------------------------------------
    // Devuelve los valores recogidos para todas las subunidades
    // m.id as id_medicion, m.etiqueta as medicion,
    // TRAMPA GORDA: uso el periodo de inicio como periodo de fin
    // para que las gráficas anuales sean más coherentes
    //-----------------------------------------------------------------------------------

    $valor = (in_array($operador, ['AVG', 'SUM', 'MAX']) && in_array($periodicidad, ['anual', 'bienal'])) ? "$operador(v.valor)" : "v.valor";
    $query = "SELECT m.id as id_medicion, m.etiqueta as medicion,
            UNIX_TIMESTAMP(MIN(m.periodo_inicio))*1000 as periodo_fin,
            e.etiqueta as unidad, e.id as id_unidad, $valor as valor,
            e.etiqueta_mini as etiqueta_mini
            FROM icasus_medicion m 
            INNER JOIN icasus_valor v ON m.id = v.id_medicion
            INNER JOIN icasus_entidad e ON e.id = v.id_entidad
            WHERE m.id_indicador = $id AND valor IS NOT NULL";

    if ($fecha_inicio !== '') {
        $query .= " AND m.periodo_inicio >= '$fecha_inicio'";
    }
    if ($fecha_fin !== '') {
        $query .= " AND m.periodo_fin <= '$fecha_fin'";
    }
    switch ($periodicidad) {
        case "bienal":
            $query .= " GROUP BY id_unidad, YEAR(m.periodo_inicio) DIV 2 * 2";
            break;
        case "anual":
            $query .= " GROUP BY id_unidad, YEAR(m.periodo_inicio)";
            break;
        case "mensual":
            $query .= " GROUP BY id_unidad, YEAR(m.periodo_inicio), MONTH(m.periodo_inicio)";
            break;
        case "todos":
            // Funcionará mientras icasus no tenga mediciones intradiarias
            $query .= " GROUP BY id_unidad, YEAR(m.periodo_inicio), MONTH(m.periodo_inicio), DAY(m.periodo_inicio)";
    }
    $query .= " ORDER BY m.periodo_inicio";
    if (!$resultado = mysqli_query($link, $query)) {
        echo ERR_CONSULTA_EXE;
    }

    while ($registro = mysqli_fetch_assoc($resultado)) {
        $datos[] = $registro;
    }

    //-----------------------------------------------------------------------------------
    // Aquí van los totales, si el indicador es calculado por herencia 
    // usamos obtener_total_calculado
    //------------------------------------------------------------------------------------
    //Indicadores/datos calculados con herencia
    if ($operador === 'INHERIT') {
        $totales = obtener_total_calculado($link, $id, $fecha_inicio, $fecha_fin, $periodicidad);
        $datos = array_merge($datos, $totales);
    } //Indicadores/datos no calculados con herencia
    else {
        $query_unidades = "SELECT MIN(m.id) as id_medicion, MIN(m.etiqueta) as medicion, MIN(m.periodo_inicio) as periodo_fin, 
                'Total' as unidad, 0 as id_unidad, $operador(v.valor) as valor 
                FROM icasus_medicion m 
                INNER JOIN icasus_valor v ON m.id = v.id_medicion 
                WHERE m.id_indicador = $id AND v.valor IS NOT NULL";

        //Indicadores/datos con agregación de unidades manual
        if ($operador === 'MANUAL') {
            // Si el operador de agregado es 'manual' cogemos del tirón los icasus_valor v de la unidad madre
            $query_unidades = "SELECT m.id as id_medicion, m.etiqueta as medicion,
              UNIX_TIMESTAMP(MIN(m.periodo_inicio))*1000 as periodo_fin,
              'Total' as unidad, 0 as id_unidad, v.valor as valor
              FROM icasus_medicion m 
              INNER JOIN icasus_valor v ON m.id = v.id_medicion
              WHERE v.id_entidad = $id_entidad AND m.id_indicador = $id AND v.valor IS NOT NULL";
        }
        //Indicadores/datos con agregación de unidades manual y agregación temporal (vista anual)
        if ($operador === 'MANUAL' && $operador_temporal !== NULL && $periodicidad === "anual") {
            //Debido a la particularidad de este caso generaremos 
            //nuestro propio json
            $array_manual = calcular_manual_intranual($id_entidad, $id, $operador_temporal, $link);
        }

        if ($fecha_inicio !== '') {
            $query_unidades .= " AND m.periodo_inicio >=  '$fecha_inicio'";
        }
        if ($fecha_fin !== '') {
            $query_unidades .= " AND m.periodo_fin <= '$fecha_fin'";
        }

        $query_unidades .= " GROUP BY YEAR(m.periodo_inicio), MONTH(m.periodo_inicio)";
        $query_unidades .= " ORDER BY m.periodo_inicio DESC";

        if ($operador_temporal === 'LAST') {
            $query_temporal = "SELECT MIN(id_medicion) as id_medicion, MIN(medicion) as medicion, 
                UNIX_TIMESTAMP(MIN(periodo_fin))*1000 as periodo_fin, 
                MIN(unidad) as unidad, MIN(id_unidad) as id_unidad, valor
                FROM ($query_unidades) unidades";
        } else {
            $query_temporal = "SELECT MIN(id_medicion) as id_medicion, MIN(medicion) as medicion, 
                UNIX_TIMESTAMP(MIN(periodo_fin))*1000 as periodo_fin, 
                MIN(unidad) as unidad, MIN(id_unidad) as id_unidad, $operador_temporal(valor) as valor
                FROM ($query_unidades) unidades";
        }

        switch ($periodicidad) {
            case "bienal":
                $query_temporal .= " GROUP BY YEAR(periodo_fin) DIV 2 * 2";
                break;
            case "anual":
                $query_temporal .= " GROUP BY YEAR(periodo_fin)";
                break;
            case "mensual":
                $query_temporal .= " GROUP BY YEAR(periodo_fin), MONTH(periodo_fin)";
                break;
            case "todos":
                // Truco para agrupar sin agrupar cuando se quieren todas las mediciones
                // Funcionará mientras icasus no tenga mediciones intradiarias
                $query_temporal .= " GROUP BY YEAR(periodo_fin), MONTH(periodo_fin), DAY(periodo_fin)";
        }
        $query_temporal .= " ORDER BY periodo_fin";

        // Si el operador de agregación entre unidades es manual y la periodicidad
        // no es intranual no tenemos en cuenta la agregación temporal
        if ($operador === 'MANUAL') {
            $query_temporal = $query_unidades;
        }

        //Indicadores/datos intranuales: valores parciales unidad/año
        if ($operador_temporal !== NULL && $periodicidad === "todos") {
            //Debido a la particularidad de este caso generaremos 
            //nuestro propio json
            $array_intranual = calcular_intranual($id, $operador_temporal, $link, $fecha_inicio, $fecha_fin);
            //Añadimos los datos
            $datos = array_merge($datos, $array_intranual);
        }

        //Indicadores/datos con agregación de unidades manual y agregación temporal (vista anual)
        if ($operador === 'MANUAL' && $operador_temporal !== NULL && $periodicidad === "anual") {
            //Añadimos los datos
            $datos = array_merge($datos, $array_manual);
        } else {
            $resultado = mysqli_query($link, $query_temporal);
            while ($registro = mysqli_fetch_assoc($resultado)) {
                $datos[] = $registro;
            }
        }
    }

    //-----------------------------------------------------------------------------------------
    // Valores de referencia: objetivos, mínimos, etc.
    //------------------------------------------------------------------------------------------

    if ($operador_temporal === 'LAST') {
        $query_ref = "SELECT m.id as id_medicion, m.etiqueta as medicion,
            UNIX_TIMESTAMP(m.periodo_inicio)*1000 as periodo_fin,
            vr.etiqueta as unidad, vr.nombre as nombre_ref, NULL as id_unidad, valor, TRUE as referencia
            FROM icasus_valor_referencia vr
            INNER JOIN icasus_valor_referencia_medicion vrm ON vrm.id_valor_referencia = vr.id
            INNER JOIN icasus_medicion m ON vrm.id_medicion = m.id
            WHERE m.id_indicador = $id AND grafica = 1";
    } else {
        $query_ref = "SELECT m.id as id_medicion, m.etiqueta as medicion,
            UNIX_TIMESTAMP(m.periodo_inicio)*1000 as periodo_fin,
            vr.etiqueta as unidad,vr.nombre as nombre_ref, NULL as id_unidad, $operador_temporal(valor) as valor, TRUE as referencia
            FROM icasus_valor_referencia vr
            INNER JOIN icasus_valor_referencia_medicion vrm ON vrm.id_valor_referencia = vr.id
            INNER JOIN icasus_medicion m ON vrm.id_medicion = m.id
            WHERE m.id_indicador = $id AND grafica = 1";
    }

    if ($fecha_inicio !== '') {
        $query_ref .= " AND m.periodo_inicio >=  '$fecha_inicio'";
    }
    if ($fecha_fin !== '') {
        $query_ref .= " AND m.periodo_fin <= '$fecha_fin'";
    }
    switch ($periodicidad) {
        case "bienal":
            $query_ref .= " GROUP BY unidad, YEAR(m.periodo_inicio) DIV 2 * 2";
            break;
        case "anual":
            $query_ref .= " GROUP BY unidad, YEAR(m.periodo_inicio)";

            if ($operador_temporal === 'LAST') {
                $query_ref = "SELECT m.id as id_medicion, m.etiqueta as medicion,
                    UNIX_TIMESTAMP(m.periodo_inicio)*1000 as periodo_fin, 
                    vr.etiqueta as unidad, vr.nombre as nombre_ref, NULL as id_unidad, valor, TRUE as referencia
                    FROM icasus_medicion m 
                    INNER JOIN icasus_valor_referencia_medicion vrm ON vrm.id_medicion = m.id
                    INNER JOIN icasus_valor_referencia vr ON vrm.id_valor_referencia = vr.id 
                    WHERE (m.periodo_inicio, vrm.id_valor_referencia) IN
                    (SELECT max(m.periodo_inicio) as periodo_inicio, vrm.id_valor_referencia
                    FROM icasus_medicion m 
                    INNER JOIN icasus_valor_referencia_medicion vrm ON vrm.id_medicion = m.id
                    WHERE m.id_indicador = $id AND vrm.valor IS NOT NULL AND vr.grafica = 1
                    GROUP BY vrm.id_valor_referencia, YEAR (m.periodo_inicio))"
                    . " AND m.periodo_inicio >=  '$fecha_inicio'"
                    . " AND m.periodo_fin <= '$fecha_fin'";
            }
            break;
        case "mensual":
            $query_ref .= " GROUP BY unidad, YEAR(m.periodo_inicio), MONTH(m.periodo_inicio)";
            break;
        case "todos":
            // Truco para agrupar sin agrupar cuando se quieren todas las mediciones
            // Funcionará mientras Icasus no tenga mediciones intradiarias
            $query_ref .= " GROUP BY unidad, YEAR(m.periodo_inicio), MONTH(m.periodo_inicio), DAY(m.periodo_inicio)";
    }
    $query_ref .= " ORDER BY m.periodo_inicio";
    $resultado = mysqli_query($link, $query_ref);
    while ($registro = mysqli_fetch_assoc($resultado)) {
        $datos[] = $registro;
    }

    // Convertimos las tres 'tacadas' de datos a json
    if ($datos = json_encode($datos, JSON_UNESCAPED_UNICODE)) {
        echo $datos;
    } else {
        echo json_last_error_msg();
    }
}

// ---------------------------------------------------------------------------
// Realiza los cálculos para obtener los totales de un indicador calculado
// ---------------------------------------------------------------------------
function obtener_total_calculado($link, $id_indicador, $fecha_inicio, $fecha_fin, $periodicidad)
{
    $elementos_calculo = array();
    $totales_calculados = array();
    $query = "SELECT i.calculo, ta.operador FROM icasus_indicador i 
              INNER JOIN icasus_tipo_agregacion ta ON i.id_tipo_agregacion = ta.id  
              WHERE i.id = $id_indicador";
    $resultado = mysqli_query($link, $query);
    $registro = mysqli_fetch_assoc($resultado);
    $calculo = $registro['calculo'];
    $operador = $registro['operador'];

    // Recorremos la cadena $calculo para sacar y calcular las variables
    // Almacenamos el resultado en $formula
    $es_variable = false;
    $formula = "";
    $elementos_calculo = str_split($calculo);
    foreach ($elementos_calculo as $elemento) {
        if ($elemento == "[") {
            $variable = "";
            $es_variable = true;
            continue; //esto es para saltarnos el resto del bucle y volver al foreach
        }
        if ($elemento == "]") {
            // Si el contenido de la variable es un número
            // nos indica que se trata de un indicador existente
            // en caso contrario sería un valor a introducir y en este
            // contexto no tiene sentido por lo que ponemos cero
            // (en realidad en un futuro no lo tendrá en ninguno)
            if (is_numeric($variable)) {
                $id_indicador_parcial = (int)$variable;
                $totales[$id_indicador_parcial] = obtener_totales_simples($link, $id_indicador_parcial, $fecha_inicio, $fecha_fin, $periodicidad);
                $formula .= "\$totales['$id_indicador_parcial'][\$i]['valor']";
            } else {
                $formula .= '0';
            }
            $es_variable = false;
            continue; //esto es para saltarnos el resto del bucle y volver al foreach
        }
        if ($es_variable) {
            $variable .= $elemento;
        } else {
            $formula .= $elemento;
        }
    }
    // Calcula el resultado de la formula y guarda el valor final
    for ($i = 0; $i < count($totales[$id_indicador_parcial]); $i++) {
        eval("\$total_calculado = $formula;");
        $totales_calculados[] = array(
            "id_medicion" => (int)$totales[$id_indicador_parcial][$i]['id_medicion'],
            "medicion" => $totales[$id_indicador_parcial][$i]['medicion'],
            "periodo_fin" => (int)$totales[$id_indicador_parcial][$i]['periodo_fin'],
            "unidad" => "Total",
            "id_unidad" => 0,
            "valor" => $total_calculado);
    }

    return $totales_calculados;
}

// ---------------------------------------------------------------------------

function obtener_totales_simples($link, $id_indicador, $fecha_inicio = '0', $fecha_fin = '0', $periodicidad = 'todos')
{
    // Obtenemos el operador o tipo de agregación del indicador
    $query = "SELECT ta.operador 
              FROM icasus_indicador i 
              INNER JOIN icasus_tipo_agregacion ta ON i.id_tipo_agregacion = ta.id  
              WHERE i.id = $id_indicador";
    $resultado = mysqli_query($link, $query);
    $registro = mysqli_fetch_assoc($resultado);
    $operador = $registro['operador'];

    //TODO: si el indicador/dato es calculado o de agregación manual
    if ($operador === 'INHERIT' || $operador === 'MANUAL') {
        $operador = NULL;
    }

    // Aquí vienen los totales
    $query = "SELECT m.id as id_medicion, m.etiqueta as medicion,
            UNIX_TIMESTAMP(MIN(m.periodo_inicio))*1000 as periodo_fin,
            $operador(v.valor) as valor
            FROM icasus_medicion m 
            INNER JOIN icasus_valor v ON m.id = v.id_medicion
            WHERE m.id_indicador = $id_indicador AND v.valor IS NOT NULL";
    if ($fecha_inicio > 0) {
        $query .= " AND m.periodo_inicio >=  '$fecha_inicio'";
    }
    if ($fecha_fin > 0) {
        $query .= " AND m.periodo_fin <= '$fecha_fin'";
    }
    if ($periodicidad == "anual") {
        $query .= " GROUP BY YEAR(m.periodo_inicio)";
    } else if ($periodicidad == "mensual") {
        $query .= " GROUP BY YEAR(m.periodo_inicio), MONTH(m.periodo_inicio)";
    } else if ($periodicidad == "todos") {
        // Truco para agrupar sin agrupar cuando se quieren todas las mediciones
        // Funcionará mientras icasus no tenga mediciones intradiarias
        $query .= " GROUP BY YEAR(m.periodo_inicio), MONTH(m.periodo_inicio), DAY(m.periodo_inicio)";
    }
    $query .= " ORDER BY m.periodo_inicio";
    $resultado = mysqli_query($link, $query);
    while ($registro = mysqli_fetch_assoc($resultado)) {
        $datos[] = $registro;
    }
    return $datos;
}

//Función que devuelve el array en formato json con el resultado del 
//calculo anual en indicadores/datos manuales intranuales
function calcular_manual_intranual($id_entidad, $id, $operador_temporal, $link)
{
    $query = "SELECT m.id as id_medicion, m.etiqueta as medicion,
              UNIX_TIMESTAMP(MIN(m.periodo_inicio))*1000 as periodo_fin,
              'Total' as unidad, 0 as id_unidad, v.valor as valor
              FROM icasus_medicion m INNER JOIN icasus_valor v ON m.id = v.id_medicion
              WHERE v.id_entidad = $id_entidad AND m.id_indicador = $id AND valor IS NOT NULL 
              GROUP BY YEAR(m.periodo_inicio), MONTH(m.periodo_inicio)";

    $result = mysqli_query($link, $query);

    //Años para los que se han recogido valores
    $anyos = array();
    //Valores recogidos durante un año
    $parciales = array();

    foreach ($result as $row) {
        $medicion = $row['medicion'];
        $anyo = explode('.', $medicion)[0];
        if ($parciales[$anyo]) {
            array_push($parciales[$anyo], $row['valor']);
        } else {
            $parciales[$anyo] = array();
            array_push($anyos, $anyo);
            array_push($parciales[$anyo], $row['valor']);
        }
    }

    //Totales recogidos durante un año
    $totales = array();

    foreach ($anyos as $anyo) {
        switch ($operador_temporal) {
            case 'LAST':
                $totales[$anyo] = $parciales[$anyo][count($parciales) - 1];
                break;
            case 'MAX':
                $totales[$anyo] = Util::maximo($parciales[$anyo]);
                break;
            case 'SUM':
                $totales[$anyo] = Util::sumatorio($parciales[$anyo]);
                break;
            case 'AVG':
                $totales[$anyo] = Util::media($parciales[$anyo]);
                break;
            default:
                break;
        }
        //Añadimos al array de resultados como json
        $array_json[] = array(
            "id_medicion" => 0,
            "medicion" => $anyo,
            "periodo_fin" => mktime(0, 0, 0, 12, 31, $anyo) * 1000,
            "unidad" => "Total",
            "id_unidad" => "0",
            "valor" => $totales[$anyo]
        );
    }

    return $array_json;
}

//Para indicadores/datos intranuales calcula los valores anuales por unidad y totales
function calcular_intranual($id, $operador_temporal, $link, $fecha_inicio, $fecha_fin)
{

    $query = "SELECT m.id as id_medicion, m.etiqueta as medicion, 
            UNIX_TIMESTAMP(MIN(m.periodo_inicio))*1000 as periodo_fin,
            e.etiqueta as unidad, e.id as id_unidad, v.valor, e.etiqueta_mini as etiqueta_mini
            FROM icasus_medicion m 
            INNER JOIN icasus_valor v ON m.id = v.id_medicion
            INNER JOIN icasus_entidad e ON e.id = v.id_entidad
            WHERE m.id_indicador = $id AND v.valor IS NOT NULL 
            GROUP BY id_unidad, YEAR(m.periodo_inicio), MONTH(m.periodo_inicio), DAY(m.periodo_inicio)";

    //Agrupamos por unidad y año
    $result = mysqli_query($link, $query);

    //Años para los que se han recogido valores
    $anyos = array();
    //Comprobamos las fechas si existen y obtenemos los años de inicio y fin
    if ($fecha_inicio != 0 && $fecha_fin != 0) {
        $anyo_inicio = explode('-', $fecha_inicio)[0];
        $anyo_fin = explode('-', $fecha_fin)[0];
    }

    //Unidades para las que existen valores
    $unidades = array();
    //Valores recogidos durante un año por unidad
    $parciales = array();

    foreach ($result as $row) {
        $medicion = $row['medicion'];
        $id_unidad = $row['id_unidad'];
        $anyo = explode('.', $medicion)[0];
        //Comprobamos si el año está dentro de nuestras fechas si éstas son dadas
        if ($anyo_inicio && $anyo_fin) {
            if ($anyo >= $anyo_inicio && $anyo <= $anyo_fin) {
                if ($parciales[$anyo][$id_unidad]) {
                    array_push($parciales[$anyo][$id_unidad], $row['valor']);
                } else {
                    $unidades[$id_unidad] = $row['etiqueta_mini'];
                    $parciales[$anyo][$id_unidad] = array();
                    array_push($anyos, $anyo);
                    array_push($parciales[$anyo][$id_unidad], $row['valor']);
                }
            }
        } //Si no hay fechas dadas añadimos todos los años
        else {
            if ($parciales[$anyo][$id_unidad]) {
                array_push($parciales[$anyo][$id_unidad], $row['valor']);
            } else {
                $unidades[$id_unidad] = $row['etiqueta_mini'];
                $parciales[$anyo][$id_unidad] = array();
                array_push($anyos, $anyo);
                array_push($parciales[$anyo][$id_unidad], $row['valor']);
            }
        }
    }

    //Totales recogidos durante un año por unidad
    $totales = array();

    foreach ($anyos as $anyo) {
        foreach ($unidades as $id_unidad => $unidad) {
            //Comprobar si existen mediciones de esa unidad para ese año no procesadas
            if ($parciales[$anyo][$id_unidad] && $totales[$anyo][$id_unidad] == NULL) {
                switch ($operador_temporal) {

                    case 'LAST':
                        $totales[$anyo][$id_unidad] = $parciales[$anyo][$id_unidad][count($parciales[$anyo][$id_unidad]) - 1];
                        break;
                    case 'MAX':
                        $totales[$anyo][$id_unidad] = Util::maximo($parciales[$anyo][$id_unidad]);
                        break;
                    case 'SUM':
                        $totales[$anyo][$id_unidad] = Util::sumatorio($parciales[$anyo][$id_unidad]);
                        break;
                    case 'AVG':
                        $totales[$anyo][$id_unidad] = Util::media($parciales[$anyo][$id_unidad]);
                        break;
                    default:
                        break;
                }
                //Añadimos al array de resultados como json
                $array_json[] = array(
                    "id_medicion" => 0,
                    "medicion" => $anyo,
                    "periodo_fin" => mktime(0, 0, 0, 12, 31, $anyo) * 1000,
                    "unidad" => "Total_parcial",
                    "etiqueta_mini" => "$unidad",
                    "id_unidad" => $id_unidad,
                    "valor" => $totales[$anyo][$id_unidad]
                );
            }
        }
    }

    return $array_json;
}
