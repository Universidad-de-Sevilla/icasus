<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Controlador principal para generar paneles
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

    $smarty->assign('_javascript', array('panel_crear'));
    $smarty->assign('_nombre_pagina', TXT_PANEL_CREAR);
    $plantilla = "panel_crear.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
