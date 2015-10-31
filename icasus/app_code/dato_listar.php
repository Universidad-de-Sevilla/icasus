<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: dato_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de datos para una entidad determinada
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

if ($id_entidad != 0)
{
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $dato = new Indicador();
    $datos = $dato->Find_joined("id_entidad = $id_entidad AND id_proceso IS NULL");
    $smarty->assign('datos', $datos);
    $smarty->assign('_javascript', array('dato_listar'));
    $smarty->assign('_nombre_pagina', FIELD_DATOS . ": " . $entidad->nombre);
    $plantilla = 'dato_listar.tpl';
}
else
{
    $error = ERR_UNID;
    header("location:index.php?page=error&error=$error");
}
