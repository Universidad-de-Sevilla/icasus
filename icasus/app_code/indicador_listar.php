<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicador_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de indicadores para una entidad determinada
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

if ($id_entidad > 0)
{
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $indicador = new Indicador();
    $indicadores = $indicador->Find_joined("id_entidad = $id_entidad AND id_proceso IS NOT NULL");
    $smarty->assign('indicadores', $indicadores);

    $smarty->assign('_javascript', array('indicador_listar'));
    $smarty->assign('_nombre_pagina', TXT_INDIC_LIST . ': ' . $entidad->nombre);
    $plantilla = 'indicador_listar.tpl';
}
else
{
    $error = ERR_UNID_LIST_INDIC;
    header("location:index.php?page=error&error=$error");
}
