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

//$modulo = sanitize($_GET["modulo"], SQL);
$modulo = filter_input(INPUT_GET, 'modulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

//Módulo de propio
if ($modulo == 'propio')
{
    $i = new Indicador();
    $indicadores = $i->find("id_proceso = $id_proceso AND id_entidad = $id_entidad");
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('modulo', $modulo);

    //Gráficos
    //Simplemente ver si hay mediciones
    $medicion = new Medicion();
    $mediciones_indicador = array();
    $paneles_indicador = array();
    $panel_id = 0;
    foreach ($indicadores as $indicador)
    {
        $mediciones_indicador[$indicador->id] = $medicion->Find("id_indicador = $indicador->id");
        if ($mediciones_indicador[$indicador->id])
        {
            // Prepara el panel anual
            $panel = new Panel();
            $panel->tipo = new Panel_tipo();
            $panel->ancho = 16;
            $anio_inicio = $indicador->historicos;
            $anio_fin = date('Y') - 1;
            $panel->id = $panel_id;
            $panel_id++;
            $panel->tipo->clase_css = "lineal";
            $panel->nombre = TXT_HISTORICO;
            $panel->fecha_inicio = "01-01-" . $indicador->historicos;
            $panel->fecha_fin = "31-12-" . $anio_fin;
            $panel->periodicidad = "anual";
            $paneles_indicador[$indicador->id] = clone($panel);
        }
    }
    $smarty->assign("mediciones_indicador", $mediciones_indicador);
    $smarty->assign("paneles_indicador", $paneles_indicador);
}

//Módulo de segregado
if ($modulo == 'segregado')
{
    $indicador_segregado = new Indicador_subunidad();
    $indicadores_segregados = $indicador_segregado->indicador_segregado($id_unidad, $id_proceso);
    $smarty->assign('indicadores_segregados', $indicadores_segregados);
    $smarty->assign('modulo', $modulo);
}

//Módulo de unidad superior
if ($modulo == 'superior')
{
    $entidad = new Entidad();
    $entidad->load("id = $id_unidad");
    $entidad->load("id = $entidad->id_madre");

    $i = new Indicador();
    $indicadores_sup = $i->find("id_entidad = $entidad->id AND id_proceso = $id_proceso");
    $smarty->assign('indicadores_superior', $indicadores_sup);
    $smarty->assign('modulo', $modulo);

    //Gráficos
    //Simplemente ver si hay mediciones
    $medicion = new Medicion();
    $mediciones_indicador_sup = array();
    $paneles_indicador_sup = array();
    foreach ($indicadores_sup as $indicador)
    {
        $mediciones_indicador_sup[$indicador->id] = $medicion->Find("id_indicador = $indicador->id");
        if ($mediciones_indicador_sup[$indicador->id])
        {
            // Prepara el panel anual
            $panel = new Panel();
            $panel->tipo = new Panel_tipo();
            $panel->ancho = 16;
            $anio_inicio = $indicador->historicos;
            $anio_fin = date('Y') - 1;
            $panel->id = 1;
            $panel->tipo->clase_css = "lineal";
            $panel->nombre = TXT_HISTORICO;
            $panel->fecha_inicio = "01-01-" . $indicador->historicos;
            $panel->fecha_fin = "31-12-" . $anio_fin;
            $panel->periodicidad = "anual";
            $paneles_indicador_sup[$indicador->id] = clone($panel);
        }
        $smarty->assign("mediciones_indicador_sup", $mediciones_indicador_sup);
        $smarty->assign("paneles_indicador_sup", $paneles_indicador_sup);
    }
}
$plantilla = 'cuadro_unidad_ajax.tpl';
$smarty->assign('_nombre_pagina', TXT_CUAD_RES);


