<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra los datos de un proceso y los indicadores asociados
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

// Si vienen datos suficientes cargamos proceso con sus indicadores
if (filter_has_var(INPUT_GET, 'id_proceso') AND filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_proceso = filter_input(INPUT_GET, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    // Datos del proceso
    $proceso = new Proceso();
    $proceso->load_joined("id = $id_proceso");
    $smarty->assign('proceso', $proceso);

    //Datos del proceso madre
    $proceso_madre = new Proceso();
    $proceso_madre->load("id = $proceso->id_madre");
    $smarty->assign('proceso_madre', $proceso_madre);

    //Datos del propietario
    $propietario = new Usuario();
    $propietario->load("id = $proceso->id_propietario");
    $smarty->assign('propietario', $propietario);

    // Listado de subprocesos
    $subprocesos = $proceso->Find_joined("id_madre = $id_proceso");
    $smarty->assign('subprocesos', $subprocesos);

    // Listado de indicadores
    $indicador = new Indicador();
    $indicadores = $indicador->Find_joined("id_proceso = $id_proceso");
    $smarty->assign('indicadores', $indicadores);

    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_nombre_pagina', TXT_PROC_FICHA . ": " . $proceso->nombre);
    $smarty->assign('_javascript', array('proceso_borrar'));
    $plantilla = 'proceso_mostrar.tpl';

    $flujograma = new Fichero();
    $condicion = "id_objeto= $id_proceso AND tipo_objeto = 'proceso' AND descripcion = 'flujograma' AND extension IN ('PNG','GIF','JPG','JPEG');";
    if ($flujograma->load($condicion))
    {
        $smarty->assign('flujograma', $flujograma);
    }

    $archivo = new Fichero();
    $archivos = $archivo->find_joined("id_objeto = $id_proceso AND tipo_objeto = 'proceso'");
    if ($archivos)
    {
        $smarty->assign('archivos', $archivos);
    }
}
else
{
    //Si se llama a esta pagina si un id de proceso o de entidad se redirecciona a la página de inicio
    $error = ERR_PARAM;
    header("Location:index.php?error=$error");
}

