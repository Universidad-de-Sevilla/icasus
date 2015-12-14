<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: panel_barra.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Controlador para la creación de paneles de barras
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'page') && filter_has_var(INPUT_GET, 'modulo'))
{
    $modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
    $tipo = filter_input(INPUT_GET, 'page', FILTER_SANITIZE_STRING);

    $panel_tipo = new Panel_tipo();
    $panel_tipo->load("clase_css = '$tipo'");
    $smarty->assign('panel', $panel_tipo);

    $periodo = new Periodo();
    $periodos = $periodo->Find("1 = 1");
    $smarty->assign("periodos", $periodos);

    $smarty->assign('modulo', $modulo);
    $smarty->assign('_nombre_pagina', TXT_PANEL_NUEVO);
    $plantilla = "$tipo.tpl";

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
        $fecha_inicio = filter_input(INPUT_GET, 'fecha_inicio', FILTER_SANITIZE_NUMBER_INT);
        $smarty->assign('fecha_inicio', $fecha_inicio);
    }

    if ($modulo == 'subunidades')
    {
        $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);

        $nombre_indicador = filter_input(INPUT_GET, 'nombre_indicador', FILTER_SANITIZE_STRING);
        $indicador_subunidad = new Indicador_subunidad();
        $indicador_subunidades = $indicador_subunidad->find_entidades("id_indicador = $id_indicador");
        $smarty->assign("indicador_subunidades", $indicador_subunidades);
        $smarty->assign("id_indicador", $id_indicador);
        $smarty->assign("nombre_indicador", $nombre_indicador);
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
