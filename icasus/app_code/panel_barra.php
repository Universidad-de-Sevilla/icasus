<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_barra.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Controlador para la creación de paneles de barras
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_cuadro') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_cuadro = filter_input(INPUT_GET, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $entidad = new Entidad();
    $entidad->load("id=$id_entidad");
    $smarty->assign('entidad', $entidad);

    $cuadro = new Cuadro();
    $cuadro->load("id=$id_cuadro");
    $smarty->assign('cuadro', $cuadro);

    //Tipo de panel: líneas
    $panel_tipo = new Panel_tipo();
    $panel_tipo->load("nombre = 'barras'");
    $smarty->assign('panel_tipo', $panel_tipo);

    //Validar orden del panel dentro del cuadro de mando
    $panel = new Panel();
    $ordenes = array();
    $paneles = $panel->Find("id_cuadro=$id_cuadro");
    foreach ($paneles as $pl)
    {
        array_push($ordenes, $pl->orden);
    }
    $smarty->assign('elementos', $ordenes);

    $smarty->assign('_javascript', array('panel_linea'));
    $smarty->assign('_nombre_pagina', TXT_PANEL_CREAR . ': ' . TXT_BARRAS);
    $plantilla = "panel_barra.tpl";
}
//Peticiones ajax
else if (filter_has_var(INPUT_GET, 'modulo'))
{
    $modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);

    //Búsqueda de indicadores/datos
    if ($modulo == 'buscar')
    {
        $cadena = filter_input(INPUT_GET, 'cadena', FILTER_SANITIZE_STRING);
        $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

        $indicador = new Indicador();
        $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%' AND archivado is NULL");
        $smarty->assign('indicadores', $indicadores);
    }

    //Cálculo de subunidades dato/indicador
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
    $smarty->assign('modulo', $modulo);
    $plantilla = "panel_barra.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
