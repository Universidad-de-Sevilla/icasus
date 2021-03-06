<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: planes/linea_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de una línea estratégica
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_linea'))
{
    $id_linea = filter_input(INPUT_GET, 'id_linea', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos de la línea
    $linea = new Linea();
    if ($linea->load("id = $id_linea"))
    {
        $smarty->assign('linea', $linea);
    }
    else
    {
        $error = ERR_LINEA_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    //Obtener todas las líneas para avanzar o retroceder 
    $id_plan = $linea->id_plan;
    $lineas = $linea->Find("id_plan = $id_plan order by indice");
    $smarty->assign("lineas", $lineas);
    $cont = 0;
    foreach ($lineas as $ln)
    {
        if ($id_linea == $ln->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Obtenemos los datos del plan
    $plan = new Plan();
    $plan->load("id = $id_plan");
    $smarty->assign('plan', $plan);

    //Obtenemos sus ejecuciones y resultados anuales
    $ejecucion = new Ejecucion();
    $ejecucion_anual = array();
    $resultado_anual = array();
    for ($i = $plan->anyo_inicio; $i <= ($plan->anyo_inicio + $plan->duracion - 1); $i++)
    {
        if ($ejecucion->Load("id_linea=$linea->id AND anyo=$i"))
        {
            $ejecucion_anual[$i] = $ejecucion->valor;
            $resultado_anual[$i] = $ejecucion->resultado;
        }
        else
        {
            $ejecucion_anual[$i] = 0;
            $resultado_anual[$i] = "";
        }
    }
    $smarty->assign("ejecucion_anual", $ejecucion_anual);
    $smarty->assign("resultado_anual", $resultado_anual);

    //Objetivos estratégicos
    $objest = new ObjetivoEstrategico();
    $objests = $objest->Find_joined("id_linea=$id_linea");
    $smarty->assign('objests', $objests);

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

    //Años de ejecución de los objetivos operacionales
    $objops_anyos = array();
    foreach ($objops as $obj)
    {
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
    $smarty->assign('objops_anyos', $objops_anyos);

    //Unidades de los objetivos operacionales
    $objop_unidad = new ObjetivoUnidad();
    $objops_unids = array();
    foreach ($objops as $obj)
    {
        $objops_unids[$obj->id] = $objop_unidad->Find("id_objop=$obj->id");
    }
    $smarty->assign('objops_unids', $objops_unids);

    $entidad = new Entidad();
    $entidad->load("id = $plan->id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('linea_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_LINEA . ": " . $linea->indice . ". " . $linea->nombre);
    $plantilla = 'planes/linea_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
