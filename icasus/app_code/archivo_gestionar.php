<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: archivo_gestionar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestión de los archivos de unidades y procesos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $archivo = new Fichero();

    //Gestión de archivos de un proceso
    if (filter_has_var(INPUT_GET, 'id_proceso'))
    {
        $id_proceso = filter_input(INPUT_GET, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
        // Datos del proceso
        $proceso = new Proceso();
        $proceso->load_joined("id = $id_proceso");
        $tipo = 'proceso';
        $smarty->assign('_nombre_pagina', TXT_PROC_ARCHIVOS . ': ' . $proceso->nombre);
        $smarty->assign('proceso', $proceso);
        $archivos = $archivo->find_joined("id_objeto = $id_proceso");
    }
    //Gestión de archivos de una unidad
    else
    {
        $tipo = 'unidad';
        $smarty->assign('_nombre_pagina', TXT_ARCHIVOS_GESTION . ': ' . $entidad->nombre);
        $archivos = $archivo->find_joined("id_objeto = $id_entidad");
    }

    $smarty->assign('tipo', $tipo);
    $smarty->assign('archivos', $archivos);
    $smarty->assign('_javascript', array('archivo_gestionar'));
    $plantilla = "archivo_gestionar.tpl";
}
else
{
    //Si se llama a esta pagina si un id de entidad se redirecciona al listado de unidades
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
