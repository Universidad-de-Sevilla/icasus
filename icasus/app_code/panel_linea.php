<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: panel_linea.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Controlador para la creación de paneles de lineas
//---------------------------------------------------------------------------------------------------

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

$tipo = filter_input(INPUT_GET, 'page', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

$panel_tipo = new Panel_tipo();
$panel_tipo->load("clase_css = '$tipo'");
$smarty->assign('panel', $panel_tipo);

if ($modulo == 'inicio')
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $indicador = new Indicador();
    $indicadores = $indicador->find("id_entidad = $id_entidad");
    $smarty->assign('indicadores', $indicadores);

    $smarty->assign('id_entidad', $id_entidad);
}
if ($modulo == 'fecha_fin')
{
    $fecha_inicio = filter_input(INPUT_GET, 'fecha_inicio', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $smarty->assign('fecha_inicio', $fecha_inicio);
}
if ($modulo == 'subunidades')
{
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);

    $nombre_indicador = filter_input(INPUT_GET, 'nombre_indicador', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

    $indicador_subunidad = new Indicador_subunidad();
    $indicador_subunidades = $indicador_subunidad->find_entidades("id_indicador = $id_indicador");
    $smarty->assign("indicador_subunidades", $indicador_subunidades);
    $smarty->assign("id_indicador", $id_indicador);
    $smarty->assign("nombre_indicador", $nombre_indicador);
}
$smarty->assign('modulo', $modulo);
$smarty->assign('_nombre_pagina', TXT_PANEL_NUEVO);
$plantilla = "$tipo.tpl";
