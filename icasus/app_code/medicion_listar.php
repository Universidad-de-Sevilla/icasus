<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_listar.php
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


$medicion = new Medicion();
$mediciones = $medicion->Find("id_indicador = $id_indicador ORDER BY periodo_inicio");
$smarty->assign("mediciones", $mediciones);
if ($mediciones)
{
    $smarty->assign('mediciones', $mediciones);
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
        $panel->fecha_inicio = $anio_inicio . "-01-01";
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
    $panel->fecha_inicio = $indicador->historicos . "-01-01";
    $panel->fecha_fin = $anio_fin . "-12-31";
    $panel->periodicidad = "anual";
    $paneles[] = clone($panel);
    $smarty->assign("paneles", $paneles);
}
//array de subunidades con las mediciones y sus valores
$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador, $entidad->id);
$smarty->assign('subunidades_mediciones', $subunidades_mediciones);

$smarty->assign('_nombre_pagina', TXT_MED_GESTION . ": $indicador->nombre");
$plantilla = 'medicion_listar.tpl';
