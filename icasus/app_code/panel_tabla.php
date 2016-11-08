<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_tabla.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Controlador para la creación de paneles tabla
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_cuadro') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_cuadro = filter_input(INPUT_GET, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $entidad = new Entidad();
    $entidad->load("id=$id_entidad");
    $smarty->assign('entidad', $entidad);
    $subunidades = $entidad->Find("id_madre=$id_entidad ORDER BY etiqueta");
    $smarty->assign('subunidades', $subunidades);
    $smarty->assign('entidad', $entidad);

    $cuadro = new Cuadro();
    $cuadro->load("id=$id_cuadro");
    $smarty->assign('cuadro', $cuadro);

    //Tipo de panel: tabla
    $panel_tipo = new Panel_tipo();
    $panel_tipo->load("nombre = 'tabla'");
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

    //Indicadores
    $indicador = new Indicador();
    $indicadores = $indicador->find("id_entidad = $id_entidad AND id_proceso IS NOT NULL AND archivado is NULL");
    $smarty->assign('indicadores', $indicadores);

    //Datos
    $datos = $indicador->find("id_entidad = $id_entidad AND id_proceso is NULL AND archivado is NULL");
    $smarty->assign('datos', $datos);

    $smarty->assign('_javascript', array('panel_tabla'));
    $smarty->assign('_nombre_pagina', TXT_PANEL_CREAR . ': ' . TXT_TABLA);
    $plantilla = "panel_tabla.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
