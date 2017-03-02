<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: plan_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de un plan estratégico
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad') AND filter_has_var(INPUT_GET, 'id_plan'))
{
    $id_plan = filter_input(INPUT_GET, 'id_plan', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del plan
    $plan = new Plan();
    if ($plan->load("id = $id_plan"))
    {
        $smarty->assign('plan', $plan);
    }
    else
    {
        $error = ERR_PLAN_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    //Obtenemos sus ejecuciones anuales
    $ejecucion = new Ejecucion();
    $ejecucion_anual = array();
    for ($i = $plan->anyo_inicio; $i <= ($plan->anyo_inicio + $plan->duracion - 1); $i++)
    {
        if ($ejecucion->Load("id_plan=$plan->id AND anyo=$i"))
        {
            $ejecucion_anual[$i] = $ejecucion->valor;
        }
        else
        {
            $ejecucion_anual[$i] = 0;
        }
    }
    $smarty->assign("ejecucion_anual", $ejecucion_anual);

    //Obtener todos los planes para avanzar o retroceder 
    $planes = $plan->Find("id_entidad = $id_entidad");
    $smarty->assign("planes", $planes);
    $cont = 0;
    foreach ($planes as $pln)
    {
        if ($id_plan == $pln->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Líneas
    $linea = new Linea();
    $lineas = $linea->Find("id_plan=$id_plan order by indice");
    $smarty->assign('lineas', $lineas);

    //Objetivos estratégicos
    $objest = new ObjetivoEstrategico();
    $objests = array();
    $objests_lineas = array();
    foreach ($lineas as $linea)
    {
        $objests = array_merge($objests, $objest->Find_joined("id_linea=$linea->id"));
        $objests_lineas[$linea->id] = $objest->Find("id_linea=$linea->id order by indice");
    }
    $smarty->assign('objests', $objests);
    $smarty->assign('objests_lineas', $objests_lineas);

    //Objetivos operacionales
    $objop = new ObjetivoOperacional();
    $objops = array();
    $objops_objests = array();
    foreach ($objests as $obj)
    {
        $objops = array_merge($objops, $objop->Find_joined("id_objest=$obj->id"));
        $objops_objests[$obj->id] = $objop->Find("id_objest=$obj->id order by indice");
    }
    $smarty->assign('objops', $objops);
    $smarty->assign('objops_objests', $objops_objests);

    //Indicadores y años de ejecución de los objetivos operacionales
    $objops_indicadores_correlacion = array();
    $objops_indicadores_control = array();
    $objops_anyos = array();
    foreach ($objops as $obj)
    {
        //Indicadores de correlación
        $objops_indicadores_correlacion[$obj->id] = array();
        foreach ($obj->indicadores_correlacion as $correlacion)
        {
            $indicador = new Indicador();
            $indicador->load("id=$correlacion->id_indicador");
            array_push($objops_indicadores_correlacion[$obj->id], $indicador);
        }

        //Indicadores de control
        $objops_indicadores_control[$obj->id] = array();
        foreach ($obj->indicadores_control as $controlador)
        {
            $indicador = new Indicador();
            $indicador->load("id=$controlador->id_indicador");
            array_push($objops_indicadores_control[$obj->id], $indicador);
        }

        //Años de ejecucion
        $objops_anyos[$obj->id] = array();
        $ejecuciones = $ejecucion->Find("id_objop=$obj->id order by anyo");
        foreach ($ejecuciones as $ejec)
        {
            if ($ejec->activo)
            {
                array_push($objops_anyos[$obj->id], $ejec->anyo);
            }
        }
    }
    $smarty->assign('objops_indicadores_correlacion', $objops_indicadores_correlacion);
    $smarty->assign('objops_indicadores_control', $objops_indicadores_control);
    $smarty->assign('objops_anyos', $objops_anyos);

    //Unidades de los objetivos operacionales
    $objop_unidad = new ObjetivoUnidad();
    $objops_unids = array();
    foreach ($objops as $obj)
    {
        $objops_unids[$obj->id] = $objop_unidad->Find("id_objop=$obj->id");
    }
    $smarty->assign('objops_unids', $objops_unids);

    //Archivos
    $archivo = new Fichero();
    $archivos = $archivo->find_joined("id_objeto = $id_plan AND tipo_objeto = 'plan' AND visible=1");
    $smarty->assign('archivos', $archivos);

    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('plan_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_PLAN . " " . $plan->anyo_inicio . " - " . ($plan->anyo_inicio + $plan->duracion - 1) . ': ' . $entidad->nombre);
    $plantilla = 'planes/plan_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
