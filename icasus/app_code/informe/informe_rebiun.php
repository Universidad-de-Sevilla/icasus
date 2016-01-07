<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: informe_rebiun.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Consulta a los datos e indicadores, permitiendo hacer operaciones matemáticas sencillas entre ellos.
//  - Genera una tabla de resultados y una gráfica
//  - Permite elegir subunidades
//  - Permite acotar los periodos de medición deseados
//---------------------------------------------------------------------------------------------------
$indicador = new Indicador();
$rebiun_detalle = $indicador->rebiun_2012_detalle();
$smarty->assign("informe", $rebiun_detalle);

$rebiun_suma = $indicador->rebiun_2012_suma();
$smarty->assign("suma", $rebiun_suma);

$rebiun_promedio = $indicador->rebiun_2012_promedio();
$smarty->assign("promedio", $rebiun_promedio);

$smarty->assign("_nombre_pagina", TXT_INFORME_REBIUN);
$plantilla = "informe_rebiun.tpl";