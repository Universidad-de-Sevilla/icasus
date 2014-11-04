<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: app_code/grafica_indicador_segregado.php 
//---------------------------------------------------------------------------------------------------
// Dibuja una gráfica de una medición concreta de un indicador que recibe valores de 
// varias subunidades. 
//---------------------------------------------------------------------------------------------------
global $usuario;

include("../../cascara_core/lib/pChart2/class/pDraw.class.php");
include("../../cascara_core/lib/pChart2/class/pImage.class.php");
include("../../cascara_core/lib/pChart2/class/pData.class.php");

if (isset($_REQUEST["id_indicador"]) & isset($_REQUEST["medicion"]))
{
  $id_indicador = sanitize($_REQUEST["id_indicador"], INT);
  $etiqueta_medicion = sanitize($_REQUEST["medicion"], SQL);

  $medicion = new medicion();
  $medicion->load("id_indicador = $id_indicador AND etiqueta = '$etiqueta_medicion'");

  $indicador = new indicador();
  $indicador->load("id = $id_indicador");
  $db = $indicador->DB();
  $query = "SELECT entidades.etiqueta as etiqueta, valor FROM valores INNER JOIN mediciones ON valores.id_medicion = mediciones.id INNER JOIN entidades ON valores.id_entidad = entidades.id WHERE mediciones.id_indicador = $id_indicador AND mediciones.etiqueta = '$medicion->etiqueta' ORDER BY entidades.etiqueta";
  $resultado = $db->getAll($query);

  foreach ($resultado as $registro)
  {
    $valores[] = $registro['valor'];
    $etiquetas[] = $registro['etiqueta'];
  }

  // Obtiene la media de todos los valores utilizando las funciones de SQL
  $query_media = "SELECT ROUND(AVG(valor),2) AS media FROM valores INNER JOIN mediciones ON valores.id_medicion = mediciones.id INNER JOIN entidades ON valores.id_entidad = entidades.id WHERE mediciones.id_indicador = $id_indicador AND mediciones.etiqueta = '$medicion->etiqueta'";
  $media_sql = $db->getAll($query_media);
  $media_sql = round($media_sql[0]['media'], 2);

  // Obtiene los valores de referencia asociados a esta medición
  // Dichas referencias han de estar activas y con grafica = 1
  $query_referencias = "SELECT etiqueta, valor 
    FROM valores_referencia_mediciones 
    INNER JOIN valores_referencia ON valores_referencia_mediciones.id_valor_referencia = valores_referencia.id
    WHERE activo = 1 AND grafica = 1 AND id_medicion = $medicion->id";
  $referencias = $db->getAll($query_referencias); 

  if ($resultado)
  {
    $myData = new pData();
    // Valores de la medición
    $myData->addPoints($valores, "Valores");
    $myData->addPoints($etiquetas, "Etiquetas");
    $myData->setAbscissa("Etiquetas");
    $myData->setSerieOnAxis("Valores", 0);
    // No usamos la siguiente función porque toma como "ceros" los valores "null" y se carga la media
    //$media = round($myData->getSerieAverage("Valores"),2);
    $media = $media_sql;
    // Colores de la serie de datos
    $serieSettings = array("R"=>163,"G"=>38,"B"=>56,"Alpha"=>70);
    $myData->setPalette("Valores",$serieSettings);
    // ancho, alto
    // El alto de la imgen depende del número de etiquetas
    $alto = 95 + count($etiquetas) * 20;
    $myPicture = new pImage(600,$alto,$myData);
    $myPicture->setFontProperties(array("FontName"=>"../../cascara_core/lib/pChart2/fonts/calibri.ttf","FontSize"=>9));

    // izquierda, arriba, ancho, alto
    $myPicture->setGraphArea(180,30,580,$alto - 40);
    //$myPicture->drawFilledRectangle(0,50,230,500,array("R"=>55,"G"=>255,"B"=>255,"Surrounding"=>-200,"Alpha"=>10)); 
    $ScaleSettings = array("Pos"=>SCALE_POS_TOPBOTTOM,"XMargin"=>20,"DrawSubTicks"=>TRUE,"GridR"=>155,"GridG"=>155,"GridB"=>155,"AxisR"=>0,"AxisG"=>0,"AxisB"=>0,"GridAlpha"=>30,"CycleBackground"=>TRUE);
    $myPicture->drawScale($ScaleSettings); 
    $myPicture->setShadow(TRUE,array("X"=>1,"Y"=>1,"R"=>163,"G"=>38,"B"=>56,"Alpha"=>10)); 
    $myPicture->drawThreshold("185", array("WriteCaption"=>TRUE, "Caption"=>"Prueba: 200", "R"=>80, "G"=>55, "B"=>25, "Alpha"=>150));
    $myPicture->drawBarChart(array("DisplayValues"=>TRUE,"DisplayColor"=>DISPLAY_AUTO)); 
    //$myPicture->drawText(20,530,"{$indicador->nombre} ({$medicion->etiqueta})",array("FontSize"=>13,"Align"=>TEXT_ALIGN_BOTTOMLEFT));
    //$myPicture->drawLegend(510,205,array("Style"=>LEGEND_NOBORDER,"Mode"=>LEGEND_HORIZONTAL));
    // Pintamos la línea con la media 
    $myPicture->drawThreshold($media,array("WriteCaption"=>TRUE, "Caption"=>"Media: $media_sql", "R"=>40, "G"=>55, "B"=>255, "Alpha"=>150));

    // Pinta los valores de referencia
    // Atención: estos valores no se pintan cuando se salen del rango de valores de las mediciones
    foreach ($referencias as $referencia)
    {
      $valor = $referencia["valor"];
      $etiqueta = $referencia["etiqueta"];
      $myPicture->drawThreshold("$valor", array("WriteCaption"=>TRUE, "Caption"=>"$etiqueta: $valor", "R"=>80, "G"=>55, "B"=>75, "Alpha"=>150));
    } 
    // Finalmente planta el dibujo en el lienzo
    $myPicture->Stroke();
  }
  else
  {
    echo "<h2>".MSG_INDIC_NO_DATOS."</h2>";
  }
}
else
{
  echo "<h2>".ERR_PARAM."</h2>";
}

