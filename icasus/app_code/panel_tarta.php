<?php

$modulo = sanitize($_REQUEST["modulo"], SQL);
$tipo = sanitize($_REQUEST["page"], SQL);

$panel_tipo = new Panel_tipo();
$panel_tipo->load("clase_css = '$tipo'");
$smarty->assign('panel', $panel_tipo);

if ($modulo == 'inicio')
{
    $id_entidad = sanitize($_REQUEST["id_entidad"], 2);

    $indicador = new Indicador();
    $indicadores = $indicador->find("id_entidad = $id_entidad ORDER BY nombre");
    $smarty->assign('indicadores', $indicadores);

    $smarty->assign('id_entidad', $id_entidad);
}
if ($modulo == 'mediciones_tarta')
{
    $id_indicador = sanitize($_REQUEST["id_indicador"], 2);
    $medicion = new Medicion();
    $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
    $smarty->assign('mediciones', $mediciones);
}
$smarty->assign('modulo', $modulo);
$smarty->assign('_nombre_pagina', TXT_NEW_PANEL);
$plantilla = "$tipo.tpl";

