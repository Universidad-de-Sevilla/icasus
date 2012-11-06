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

$smarty->assign("_nombre_pagina", "Consulta avanzada de datos e indicadores");
$plantilla = "consulta_avanzada.tpl";
?>
