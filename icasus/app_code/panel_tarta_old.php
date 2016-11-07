<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: panel_tarta.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Controlador para la creación de paneles de tarta
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'page') && filter_has_var(INPUT_GET, 'modulo'))
{
    $modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
    $tipo = filter_input(INPUT_GET, 'page', FILTER_SANITIZE_STRING);

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

        //Validar orden del panel dentro del cuadro de mando
        $id_cuadro = filter_input(INPUT_GET, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
        $panel = new Panel();
        $ordenes = array();
        $paneles = $panel->Find("id_cuadro=$id_cuadro");
        foreach ($paneles as $pl)
        {
            array_push($ordenes, $pl->orden);
        }
        $smarty->assign('elementos', $ordenes);
    }
    if ($modulo == 'mediciones_tarta')
    {
        $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
        $medicion = new Medicion();
        $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
        $smarty->assign('mediciones', $mediciones);
    }
    $smarty->assign('modulo', $modulo);
    $smarty->assign('_nombre_pagina', TXT_PANEL_CREAR);
    $plantilla = "$tipo.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
