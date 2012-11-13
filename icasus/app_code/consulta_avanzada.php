<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: consulta_avanzada.php
//---------------------------------------------------------------------------------------------------
// Consulta a los datos e indicadores, permitiendo hacer operaciones matemáticas sencillas entre ellos.
//  - Genera una tabla de resultados y una gráfica
//  - Permite elegir subunidades
//  - Permite acotar los periodos de medición deseados
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (isset($_REQUEST["id_unidad"]))
{
  $id_unidad = sanitize($_REQUEST["id_unidad"], INT);
  $indicador = new indicador();
  $indicadores = $indicador->Find("id_entidad = $id_unidad");
  $smarty->assign("indicadores", $indicadores);
  $operaciones = array(
    array('cotejar','= Cotejar'),
    array('suma','+ Suma'),
    array('cociente','/ Cociente'),
    array('porcentaje','% Porcentaje')
  );  
  $smarty->assign("operaciones", $operaciones);
  $smarty->assign("_nombre_pagina", "Consulta avanzada de datos e indicadores");
  $plantilla = "consulta_avanzada.tpl";
}
else
{
  $error = "Parametros insuficientes para realizar la consulta";
  header("location:index.php?page=error&error=$error");
}
?>
