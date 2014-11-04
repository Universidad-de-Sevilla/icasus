<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: app_code/grafica_indicador_agregado.php 
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra una gráfica con las agregados de los valores de un indicador agregado
//---------------------------------------------------------------------------------------------------
global $usuario;

include("../../cascara_core/lib/pChart2/class/pDraw.class.php");
include("../../cascara_core/lib/pChart2/class/pImage.class.php");
include("../../cascara_core/lib/pChart2/class/pData.class.php");

$id_indicador = filter_input(INPUT_GET | INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);

//if (isset($_REQUEST["id_indicador"]))
if ($id_indicador) {
//  $id_indicador = sanitize($_REQUEST["id_indicador"], INT);
    // Inicio y fin marcan el rango de mediciones que vamos a tomar
//    $inicio = isset($_REQUEST["inicio"]) ? sanitize($_REQUEST["inicio"], INT) : 0;
    $inicio = filter_input(INPUT_GET | INPUT_POST, 'inicio', FILTER_SANITIZE_NUMBER_INT);
    if (!$inicio) {
        $inicio = 0;
    }
//    $fin = isset($_REQUEST["fin"]) ? sanitize($_REQUEST["fin"], INT) : 0;
    $fin = filter_input(INPUT_GET | INPUT_POST, 'fin', FILTER_SANITIZE_NUMBER_INT);
    if (!$fin) {
        $fin = 0;
    }
    $hoy = date("d-m-Y H:i:s");

    $indicador = new Indicador();
    $indicador->load("id = $id_indicador");
    $db = $indicador->DB();
    if ($indicador->id_tipo_agregacion == 2) {
        $query = "SELECT mediciones.etiqueta, SUM(valor) AS agregado FROM valores INNER JOIN mediciones ON valores.id_medicion = mediciones.id INNER JOIN entidades ON valores.id_entidad = entidades.id WHERE mediciones.id_indicador = $id_indicador GROUP BY id_medicion ORDER BY mediciones.periodo_inicio;";
    } else {
        // Por defecto suponemos que el tipo_agregado es 1
        $query = "SELECT mediciones.etiqueta, ROUND(AVG(valor),2) AS agregado FROM valores INNER JOIN mediciones ON valores.id_medicion = mediciones.id INNER JOIN entidades ON valores.id_entidad = entidades.id WHERE mediciones.id_indicador = $id_indicador GROUP BY id_medicion ORDER BY mediciones.periodo_inicio;";
    }
    $resultado = $db->getAll($query);

    foreach ($resultado as $registro) {
        $agregados[] = $registro['agregado'];
        $etiquetas[] = $registro['etiqueta'];
    }

    if ($resultado) {
        $myData = new pData();
        $myData->addPoints($agregados, FIELD_AGREG);
        $myData->addPoints($etiquetas, FIELD_PERIODO);
        $myData->setAbscissa(FIELD_PERIODO);
        $myData->setSerieOnAxis(FIELD_AGREG, 0);
        // Pinta los valores de referencia
        // Atención: estos valores no se pintan cuando se salen del rango de valores de las mediciones
        // Dichas referencias han de estar activas y con grafica = 1
        $query_referencias = "SELECT valores_referencia.id, valores_referencia.etiqueta     
      FROM valores_referencia 
      WHERE activo = 1 AND grafica = 1 AND id_indicador = $id_indicador;";
        $referencias = $db->getAll($query_referencias);
        foreach ($referencias as $referencia) {
            $id_referencia = $referencia["id"];
            $query_valores = "SELECT valores_referencia_mediciones.valor, mediciones.etiqueta 
        FROM valores_referencia_mediciones
        INNER JOIN valores_referencia ON valores_referencia_mediciones.id_valor_referencia = valores_referencia.id
        INNER JOIN mediciones ON mediciones.id = valores_referencia_mediciones.id_medicion
        WHERE valores_referencia.activo = 1 AND valores_referencia.grafica = 1 AND valores_referencia.id = $id_referencia";
            $referencia_valores = $db->getAll($query_valores);
            foreach ($referencia_valores as $valor) {
                $valores[] = $valor["valor"];
            }
            $etiqueta = $referencia["etiqueta"];
            $myData->addPoints($valores, $etiqueta);
            //$myPicture->drawThreshold("$valor", array("WriteCaption"=>TRUE, "Caption"=>"$etiqueta", "R"=>80, "G"=>55, "B"=>75, "Alpha"=>150));
        }

        $myPicture = new pImage(700, 270, $myData);
        $myPicture->setFontProperties(array("FontName" => "../../cascara_core/lib/pChart2/fonts/calibri.ttf", "FontSize" => 11));
        $myPicture->setGraphArea(60, 40, 670, 220);
        /* Draw the scale */
        $ScaleSettings = array("XMargin" => 35, "DrawSubTicks" => TRUE, "GridR" => 155, "GridG" => 155, "GridB" => 155, "AxisR" => 0, "AxisG" => 0, "AxisB" => 0, "GridAlpha" => 30, "CycleBackground" => TRUE);
        $myPicture->drawScale($ScaleSettings);
        //$agregado = round($myData->getSerieAverage("Agregado"),2);
        //$myPicture->drawThreshold($agregado,array("WriteCaption"=>TRUE));
        //$myPicture->drawBarChart(array("DisplayValues"=>TRUE,"DisplayColor"=>DISPLAY_AUTO));
        $myPicture->drawLineChart(array("DisplayValues" => TRUE, "DisplayColor" => DISPLAY_AUTO));
        $myPicture->drawPlotChart();
        $myPicture->drawText(20, 260, "{$indicador->nombre}", array("FontSize" => 11, "Align" => TEXT_ALIGN_BOTTOMLEFT));
        $myPicture->drawText(20, 270, "{$hoy}", array("FontSize" => 9, "Align" => TEXT_ALIGN_BOTTOMLEFT));
        $myPicture->Stroke();
    } else {
        $myPicture = new pImage(700, 200);
        $myPicture->setFontProperties(array("FontName" => "../../cascara_core/lib/pChart2/fonts/calibri.ttf", "FontSize" => 11));
        $myPicture->setGraphArea(60, 40, 670, 220);
        $myPicture->drawText(20, 100, MSG_INDIC_NO_VAL, array("FontSize" => 26, "Align" => TEXT_ALIGN_BOTTOMLEFT));
        $myPicture->Stroke();
    }
} else {
    $myPicture = new pImage(700, 200);
    $myPicture->setFontProperties(array("FontName" => "../../cascara_core/lib/pChart2/fonts/calibri.ttf", "FontSize" => 11));
    $myPicture->setGraphArea(60, 40, 670, 220);
    $myPicture->drawText(30, 100, ERR_PARAM_GRAFIC, array("FontSize" => 26, "Align" => TEXT_ALIGN_BOTTOMLEFT));
    $myPicture->Stroke();
}

