<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicadores.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de todos los indicadores
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$indicador = new Indicador();
$indicadores = $indicador->Find_joined("1 = 1 AND id_proceso IS NOT NULL");
$smarty->assign('indicadores', $indicadores);

$smarty->assign('_nombre_pagina', FIELD_INDICS);
$plantilla = 'indicadores.tpl';
