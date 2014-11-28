<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicador_mostrar.php
//-------------------------------------------------------------------------------
// Muestra la ficha del indicador y los gráficos con los valores
//-------------------------------------------------------------------------------

global $smarty;
global $plantilla;

//if (isset($_REQUEST['id_indicador']))
if (filter_has_var(INPUT_GET, 'id_indicador'))
{
//  $id_indicador = sanitize($_REQUEST['id_indicador'],16);
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $indicador = new Indicador();
    if ($indicador->load_joined("id = $id_indicador"))
    {
        $smarty->assign('indicador', $indicador);
    }
    else
    {
        $error = ERR_INDIC_MOSTRAR;
        header("location:index.php?error=$error");
    }
    $indicador->load_joined("id = $id_indicador");
    $smarty->assign('indicador', $indicador);

    $entidad = new Entidad();
    $entidad->load("id = $indicador->id_entidad");
    $smarty->assign('entidad', $entidad);

    //Subunidades asignadas a la medicion de este indicador
    $indicador_subunidad = new Indicador_subunidad();
    $indicador_subunidades = $indicador_subunidad->Find_entidades("id_indicador = $id_indicador");
    $smarty->assign("indicador_subunidades", $indicador_subunidades);

    //Simplemente ver si hay mediciones
    $medicion = new Medicion();
    $mediciones = $medicion->Find("id_indicador = $id_indicador");
    if ($mediciones)
    {
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
            $panel->ancho = 16;
            $panel->nombre = $indicador->nombre . " (" . $anio_inicio . " - " . $anio_fin . ")";
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
        $panel->nombre = $indicador->nombre . " (" . $anio_inicio . " - " . $anio_fin . ")";
        $panel->fecha_inicio = $indicador->historicos . "-01-01";
        $panel->fecha_fin = $anio_fin . "-12-31";
        $panel->periodicidad = "anual";
        $paneles[] = clone($panel);
        $smarty->assign("paneles", $paneles);
        $smarty->assign("mediciones", $mediciones);
    }

    $smarty->assign('_nombre_pagina', TXT_INDIC_FICHA . ': ' . $indicador->nombre);
    $plantilla = 'indicador_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}
