<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: datos.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de todos los datos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$dato = new Indicador();
$datos = $dato->Find_joined("1 = 1 AND id_proceso IS NULL");
$smarty->assign('datos', $datos);

$smarty->assign('_nombre_pagina', FIELD_DATOS);
$plantilla = 'datos.tpl';
