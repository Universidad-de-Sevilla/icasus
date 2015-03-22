<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: archivo_gestionar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_proceso') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_proceso = filter_input(INPUT_GET, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);
    
    // Datos del proceso
    $proceso = new Proceso();
    $proceso->load_joined("id = $id_proceso");
    $smarty->assign('_nombre_pagina', TXT_ARCHIVOS_PROC . $proceso->nombre);
    $smarty->assign('proceso', $proceso);

    $archivo = new Fichero();
    $archivos = $archivo->find_joined("id_objeto = $id_proceso");
    $smarty->assign('archivos', $archivos);
    $smarty->assign('_javascript', array('archivo_gestionar'));
    $plantilla = "archivo_gestionar.tpl";
}
else
{
    //Si se llama a esta pagina si un id de proceso o de entidad se redirecciona al listado de unidades
    header('Location:index.php?page=entidad_listar');
}

