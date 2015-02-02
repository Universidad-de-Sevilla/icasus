<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_listar.php
// Desarrolladores: Joaquín Valonero Zaera (tecnibus1@us.es)
// 
//-------------------------------------------------------------------------------
// Muestra un listado de las mediciones establecidas para un indicador
//-------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

//if (isset($_REQUEST["id_indicador"]))
if (filter_has_var(INPUT_GET, 'id_indicador'))
{
//    $id_indicador = sanitize($_REQUEST["id_indicador"], INT);
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $tipo = "indicador";
}
//else if (isset($_REQUEST["id_dato"]))
else if (filter_has_var(INPUT_GET, 'id_dato'))
{
//    $id_indicador = sanitize($_REQUEST["id_dato"], INT);
    $id_indicador = filter_input(INPUT_GET, 'id_dato', FILTER_SANITIZE_NUMBER_INT);
    $tipo = "dato";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=entidad_listar&error=$error");
}

$indicador = new Indicador();
$indicador->load("id = $id_indicador");
$smarty->assign('indicador', $indicador);

$entidad = new Entidad();
$entidad->load("id = $indicador->id_entidad");
$smarty->assign('entidad', $entidad);
$smarty->assign('tipo', $tipo);

//Simplemente ver si hay mediciones
$medicion = new Medicion();
$mediciones = $medicion->Find("id_indicador = $id_indicador ORDER BY periodo_inicio");
$smarty->assign("mediciones", $mediciones);
if ($mediciones)
{
    //Prepara el panel de Valores/Subunidad
    $panel_res = new Panel();
    $panel_res->ancho = 16;
    $panel_res->nombre = TXT_VALS_SUBUNID;
    $panel_res->periodicidad = "anual";
    $smarty->assign("panel_res", $panel_res);

    //Prepara el resto de paneles
    $paneles = array();
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
        $panel->ancho = 8;
        $panel->nombre = TXT_2_ULT_ANYO;
        $panel->fecha_inicio = date("d-m")."-" . $anio_inicio;
        $panel->fecha_fin = date("Y-m-d");
        $panel->periodicidad = "todos";
        $paneles[] = clone($panel);
    }
    // Prepara el panel anual
    $anio_inicio = $indicador->historicos;
    $anio_fin = date('Y') - 1;
    $panel->id = 1;
    $panel->tipo->clase_css = "lineal";
    $panel->nombre = TXT_HISTORICO;
    $panel->fecha_inicio = "01-01-" . $indicador->historicos;
    $panel->fecha_fin = "31-12-" . $anio_fin;
    $panel->periodicidad = "anual";
    $paneles[] = clone($panel);
    $smarty->assign("paneles", $paneles);
}
//array de subunidades con las mediciones y sus valores
$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador, $entidad->id);
$smarty->assign('subunidades_mediciones', $subunidades_mediciones);

$smarty->assign('_nombre_pagina', TXT_MED_GESTION . ": $indicador->nombre");
$plantilla = 'medicion_listar.tpl';
