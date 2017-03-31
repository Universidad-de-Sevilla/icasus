<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: archivos/archivo_gestionar.php
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

    //Gestión de archivos de un plan estratégico
    if (filter_has_var(INPUT_GET, 'id_plan'))
    {
        $id_plan = filter_input(INPUT_GET, 'id_plan', FILTER_SANITIZE_NUMBER_INT);
        if ($control)
        {
            $plan = new Plan();
            $plan->load("id = $id_plan");
            $tipo = 'plan';
            $smarty->assign('_nombre_pagina', TXT_ARCHIVOS_GESTION . ': ' . FIELD_PLAN . " " . $plan->anyo_inicio . " - " . ($plan->anyo_inicio + $plan->duracion - 1));
            $smarty->assign('plan', $plan);
            $archivos = $archivo->find_joined("id_objeto = $id_plan AND tipo_objeto = 'plan'");
        }
        else
        {
            $error = ERR_PERMISOS;
            header("Location: index.php?page=plan_mostrar&id_plan=$id_plan&id_entidad=$id_entidad&error=$error");
        }
    }

    //Gestión de archivos de un proceso
    else if (filter_has_var(INPUT_GET, 'id_proceso'))
    {
        //Variable para operar con Procesos
        $logicaProceso = new LogicaProceso();
        $id_proceso = filter_input(INPUT_GET, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
        $proceso = new Proceso();
        $proceso->load_joined("id = $id_proceso");
        //Permisos del proceso
        $permiso_proceso = $logicaProceso->comprobar_responsable_proceso($usuario->id, $proceso);
        if ($control OR $permiso_proceso)
        {
            $tipo = 'proceso';
            $smarty->assign('_nombre_pagina', TXT_ARCHIVOS_GESTION . ': ' . $proceso->nombre);
            $smarty->assign('proceso', $proceso);
            $archivos = $archivo->find_joined("id_objeto = $id_proceso AND tipo_objeto = 'proceso'");
        }
        else
        {
            $error = ERR_PERMISOS;
            header("Location: index.php?page=proceso_mostrar&id_proceso=$id_proceso&id_entidad=$id_entidad&error=$error");
        }
    }

    //Gestión de archivos de una unidad
    else
    {
        if ($control)
        {
            $tipo = 'unidad';
            $smarty->assign('_nombre_pagina', TXT_ARCHIVOS_GESTION . ': ' . $entidad->nombre);
            $archivos = $archivo->find_joined("id_objeto = $id_entidad AND tipo_objeto = 'unidad'");
        }
        else
        {
            $error = ERR_PERMISOS;
            header("Location: index.php?page=entidad_mostrar&id_entidad=$id_entidad&error=$error");
        }
    }

    $smarty->assign('tipo', $tipo);
    $smarty->assign('archivos', $archivos);
    $smarty->assign('_javascript', array('archivo_gestionar'));
    $plantilla = "archivos/archivo_gestionar.tpl";
}
else
{
    //Si se llama a esta pagina si un id de entidad se redirecciona al listado de unidades
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}