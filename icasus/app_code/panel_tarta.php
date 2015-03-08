<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: panel_tarta.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Controlador para la creación de paneles de tarta
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
    $indicadores = $indicador->find("id_entidad = $id_entidad ORDER BY nombre");
    $smarty->assign('indicadores', $indicadores);

    $smarty->assign('id_entidad', $id_entidad);
}
if ($modulo == 'mediciones_tarta')
{
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $medicion = new Medicion();
    $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
    $smarty->assign('mediciones', $mediciones);
}
$smarty->assign('modulo', $modulo);
$smarty->assign('_nombre_pagina', TXT_PANEL_NUEVO);
$plantilla = "$tipo.tpl";

