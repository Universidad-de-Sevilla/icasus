<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: plan_listar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los planes estratégicos de una Unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id =  $id_entidad");
    $smarty->assign('entidad', $entidad);

    //Planes de la Unidad
    $smarty->assign('planes', $planes);

    $smarty->assign('_javascript', array('plan_listar'));
    $smarty->assign('_nombre_pagina', FIELD_PLANES . ": " . $entidad->nombre);
    $plantilla = 'plan_listar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=procesos&error=$error");
}
