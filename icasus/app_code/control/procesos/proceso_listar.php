<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: procesos/proceso_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los procesos definidos en esta unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;
//Variable para operar con Procesos
$logicaProceso = new LogicaProceso();

if (filter_has_var(INPUT_GET, 'id_entidad')) {
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id =  $id_entidad");
    $smarty->assign('entidad', $entidad);

    $proceso = new Proceso();
    $procesos = $proceso->Find_joined("id_entidad = $id_entidad");
    $smarty->assign('procesos', $procesos);

    // Procesos propiedad del usuario
    $procesos_propios = $proceso->Find_joined("id_propietario = $usuario->id AND id_entidad=$id_entidad");
    $smarty->assign('procesos_propios', $procesos_propios);

    //Permisos de procesos
    $permiso_proceso = array();
    foreach ($procesos as $proceso) {
        if ($logicaProceso->comprobar_responsable_proceso($usuario->id, $proceso)) {
            $permiso_proceso[$proceso->id] = true;
        } else {
            $permiso_proceso[$proceso->id] = false;
        }
    }

    //Mapa de procesos
    $mapa = new Fichero();
    $condicion = "id_objeto = $id_entidad AND tipo_objeto = 'unidad' AND descripcion = 'mapa' AND extension IN ('PNG','GIF','JPG','JPEG');";
    if ($mapa->load($condicion)) {
        $smarty->assign('mapa', $mapa);
        $areas = new Fichero();
        $condicion = "id_objeto= $id_entidad AND tipo_objeto = 'unidad' AND descripcion = 'areas' AND extension IN ('HTML','HTM','TXT','JPEG');";
        if ($areas->load($condicion)) {
            $smarty->assign('areas', $areas);
        }
    }

    $smarty->assign('permiso_proceso', $permiso_proceso);

    $smarty->assign('_javascript', array('proceso_listar'));
    $smarty->assign('_nombre_pagina', FIELD_PROCS . ": " . $entidad->nombre);
    $plantilla = 'procesos/proceso_listar.tpl';
} else {
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
