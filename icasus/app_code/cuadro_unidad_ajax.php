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

    //Nuevos gráficos
    //Simplemente ver si hay mediciones
    $medicion = new Medicion();
    $mediciones_indicador = array();
    $paneles_indicador = array();
    foreach ($indicadores as $indicador)
    {
        $mediciones_indicador[$indicador->id] = $medicion->Find("id_indicador = $indicador->id");
        if ($mediciones_indicador[$indicador->id])
        {
            $panel = new Panel();
            $panel->tipo = new Panel_tipo();
            $panel->ancho = 16;
            if ($indicador->periodicidad != "Anual")
            {
                // Prepara el panel intraanual
                $anio_inicio = date('Y') - 2;
                $anio_fin = date('Y');
                $panel->id = 2;
                $panel->tipo->clase_css = "lineal";
                $panel->ancho = 16;
                $panel->nombre = $indicador->nombre . " (" . $anio_inicio . " - " . $anio_fin . ")";
                $panel->fecha_inicio = $anio_inicio . "-01-01";
                $panel->fecha_fin = date("Y-m-d");
                $panel->periodicidad = "todos";
                $paneles_indicador[$indicador->id][] = clone($panel);
            }
            // Prepara el panel anual
            $anio_inicio = $indicador->historicos;
            $anio_fin = date('Y') - 1;
            $panel->id = 1;
            $panel->tipo->clase_css = "lineal";
            $panel->nombre = $indicador->nombre . " (" . $anio_inicio . " - " . $anio_fin . ")";
            $panel->fecha_inicio = $indicador->historicos . "-01-01";
            $panel->fecha_fin = $anio_fin . "-12-31";
            $panel->periodicidad = "anual";
            $paneles_indicador[$indicador->id][] = clone($panel);
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

    $indicador = new Indicador();
    $indicadores = $indicador->find("id_entidad = $entidad->id AND id_proceso = $id_proceso");
    $smarty->assign('indicadores_superior', $indicadores);

    $smarty->assign('modulo', $modulo);
}
$plantilla = 'cuadro_unidad_ajax.tpl';
$smarty->assign('_nombre_pagina', TXT_CUAD_RES);


