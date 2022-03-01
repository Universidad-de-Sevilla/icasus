<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: planes/plan_listar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripción: Lista los planes estratégicos de una Unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id =  $id_entidad");
    $smarty->assign('entidad', $entidad);

    //Planes de la Unidad
    $planes_activos = array_filter($planes, function ($plan) {return null === $plan->archivado;});
    $planes_archivados = array_diff($planes, $planes_activos);
    $smarty->assign('planes_activos', $planes_activos);
    $smarty->assign('planes_archivados', $planes_archivados);
    //Objetivos operacionales bajo la responsabilidad del usuario en la Unidad
    $objop = new ObjetivoOperacional();
    $objops = $objop->Find_joined("id_responsable = $usuario->id");
    $objops_propios = [];
    foreach ($objops as $objop)
    {
        if ($objop->objest->linea->plan->id_entidad == $id_entidad)
        {
            $objops_propios[] = $objop;
        }
    }
    $smarty->assign('objops_propios', $objops_propios);

    //Años de ejecución de los objetivos operacionales
    $ejecucion = new Ejecucion();
    $objops_anyos = [];
    foreach ($objops_propios as $obj)
    {
        $objops_anyos[$obj->id] = array();
        $ejecuciones = $ejecucion->Find("id_objop=$obj->id order by anyo");
        foreach ($ejecuciones as $ejec)
        {
            if ($ejec->activo)
            {
                $objops_anyos[$obj->id][] = $ejec->anyo;
            }
        }
    }
    $smarty->assign('objops_anyos', $objops_anyos);

    //Unidades de los objetivos operacionales
    $objop_unidad = new ObjetivoUnidad();
    $objops_unids = [];
    foreach ($objops_propios as $obj)
    {
        $objops_unids[$obj->id] = $objop_unidad->Find("id_objop=$obj->id");
    }
    $smarty->assign('objops_unids', $objops_unids);

    $smarty->assign('_javascript', array('plan_listar'));
    $smarty->assign('_nombre_pagina', FIELD_PLANES . ": " . $entidad->nombre);
    $plantilla = 'planes/plan_listar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
