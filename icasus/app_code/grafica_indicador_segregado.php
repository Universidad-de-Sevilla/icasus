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
  $medicion = sanitize($_REQUEST["medicion"], SQL);

  $indicador = new indicador();
  $indicador->load("id = $id_indicador");
  $db = $indicador->DB();
  $query = "SELECT entidades.etiqueta as etiqueta, valor FROM valores INNER JOIN mediciones ON valores.id_medicion = mediciones.id INNER JOIN entidades ON valores.id_entidad = entidades.id WHERE mediciones.id_indicador = $id_indicador AND mediciones.etiqueta = '$medicion'";
  $resultado = $db->getAll($query);

  foreach ($resultado as $registro)
  {
    $valores[] = $registro['valor'];
    $etiquetas[] = $registro['etiqueta'];
  }

  if ($resultado)
  {
    $myData = new pData();
    $myData->addPoints($valores, "Valores");
    $myData->addPoints($etiquetas, "Etiquetas");
    $myData->setAbscissa("Etiquetas");
    $myData->setSerieOnAxis("Valores", 0);
    $media = round($myData->getSerieAverage("Valores"),2);
    $serieSettings = array("R"=>163,"G"=>38,"B"=>56,"Alpha"=>10);
    //$MyData->setPalette("Valores",$serieSettings);
    // ancho, alto
    $myPicture = new pImage(600,550,$myData);
    $myPicture->setFontProperties(array("FontName"=>"../../cascara_core/lib/pChart2/fonts/calibri.ttf","FontSize"=>9));

    // izquierda, arriba, ancho, alto
    $myPicture->setGraphArea(180,50,580,500);
    //$myPicture->drawFilledRectangle(0,50,230,500,array("R"=>55,"G"=>255,"B"=>255,"Surrounding"=>-200,"Alpha"=>10)); 
    $ScaleSettings = array("Pos"=>SCALE_POS_TOPBOTTOM,"XMargin"=>20,"DrawSubTicks"=>TRUE,"GridR"=>155,"GridG"=>155,"GridB"=>155,"AxisR"=>0,"AxisG"=>0,"AxisB"=>0,"GridAlpha"=>30,"CycleBackground"=>TRUE);
    $myPicture->drawScale($ScaleSettings); 
    $myPicture->setShadow(TRUE,array("X"=>1,"Y"=>1,"R"=>163,"G"=>38,"B"=>56,"Alpha"=>10)); 
    $myPicture->drawBarChart(array("DisplayValues"=>TRUE,"DisplayColor"=>DISPLAY_AUTO)); 
    $myPicture->drawText(20,530,"{$indicador->nombre} ({$medicion})",array("FontSize"=>15,"Align"=>TEXT_ALIGN_BOTTOMLEFT));
    //$myPicture->drawLegend(510,205,array("Style"=>LEGEND_NOBORDER,"Mode"=>LEGEND_HORIZONTAL));
    $myPicture->drawThreshold($media,array("WriteCaption"=>TRUE));
    
    $myPicture->Stroke();
  }
  else
  {
    echo "<h2>NO HAY DATOS</h2>";
  }
}
else
{
  echo "<h2>FALTAN PARAMETROS</h2>";
}
?>
