<?php

//$modulo = sanitize($_REQUEST["modulo"], SQL);
$modulo = filter_input(INPUT_GET, 'modulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//$tipo = sanitize($_REQUEST["page"], SQL);
$tipo = filter_input(INPUT_GET, 'page', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

$panel_tipo = new Panel_tipo();
$panel_tipo->load("clase_css = '$tipo'");
$smarty->assign('panel', $panel_tipo);

if ($modulo == 'inicio')
{
//    $id_entidad = sanitize($_REQUEST["id_entidad"], 2);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $indicador = new Indicador();
    $indicadores = $indicador->find("id_entidad = $id_entidad");
    $smarty->assign('indicadores', $indicadores);

    $smarty->assign('id_entidad', $id_entidad);
}
if ($modulo == 'fecha_fin')
{
//    $fecha_inicio = sanitize($_REQUEST["fecha_inicio"], 2);
    $fecha_inicio = filter_input(INPUT_GET, 'fecha_inicio', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $smarty->assign('fecha_inicio', $fecha_inicio);
}
if ($modulo == 'subunidades')
{
//    $id_indicador = sanitize($_REQUEST["id_indicador"], 2);
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
//    $nombre_indicador = sanitize($_REQUEST["nombre_indicador"], SQL);
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
