<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadro_unidad.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los indicadores de la unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

//$id_unidad = sanitize($_GET["id_entidad"],2);
//$id_proceso = sanitize($_GET["id_proceso"],2);

$id_unidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
$id_proceso = filter_input(INPUT_GET, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);

$modulo = sanitize($_GET["modulo"], SQL);
//Módulo de propio
if ($modulo == 'propio') {
    $i = new indicador();
    $indicadores = $i->find("id_proceso = $id_proceso AND id_entidad = $id_entidad");
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('modulo', $modulo);
}

//Módulo de segregado
if ($modulo == 'segregado') {
    $indicador_segregado = new indicador_subunidad();
    $indicadores_segregados = $indicador_segregado->indicador_segregado($id_unidad, $id_proceso);
    $smarty->assign('indicadores_segregados', $indicadores_segregados);
    $smarty->assign('modulo', $modulo);
}

//Módulo de unidad superior
if ($modulo == 'superior') {
    $entidad = new entidad();
    $entidad->load("id = $id_unidad");
    $entidad->load("id = $entidad->id_madre");

    $indicador = new indicador();
    $indicadores = $indicador->find("id_entidad = $entidad->id AND id_proceso = $id_proceso");
    $smarty->assign('indicadores_superior', $indicadores);

    $smarty->assign('modulo', $modulo);
}
$plantilla = 'cuadro_unidad_ajax.tpl';
$smarty->assign('_nombre_pagina', 'Cuadro Resumen');


