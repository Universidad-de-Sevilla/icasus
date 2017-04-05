<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: planes/objest_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de un objetivo estratégico
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_objest'))
{
    $id_objest = filter_input(INPUT_GET, 'id_objest', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del objetivo estratégico
    $objest = new ObjetivoEstrategico();
    if ($objest->load("id = $id_objest"))
    {
        $smarty->assign('objest', $objest);
    }
    else
    {
        $error = ERR_OBJEST_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    //Obtener todos los objetivos estratégicos para avanzar o retroceder
    $id_linea = $objest->id_linea;
    $objests = $objest->Find("id_linea = $id_linea order by indice");
    $smarty->assign("objests", $objests);
    $cont = 0;
    foreach ($objests as $obj)
    {
        if ($id_objest == $obj->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Obtenemos los datos de la línea y del plan
    $linea = new Linea();
    $linea->load_joined("id = $id_linea");
    $smarty->assign('linea', $linea);
    $smarty->assign('plan', $linea->plan);

    //Obtenemos sus ejecuciones y resultados anuales
    $ejecucion = new Ejecucion();
    $ejecucion_anual = array();
    $resultado_anual = array();
    for ($i = $linea->plan->anyo_inicio; $i <= ($linea->plan->anyo_inicio + $linea->plan->duracion); $i++)
    {
        if ($ejecucion->Load("id_objest=$objest->id AND anyo=$i"))
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

    //Objetivos operacionales
    $objop = new ObjetivoOperacional();
    $objops = $objop->Find_joined("id_objest=$id_objest");
    $smarty->assign('objops', $objops);

    //Unidades de los objetivos operacionales
    $objop_unidad = new ObjetivoUnidad();
    $objops_unids = array();
    foreach ($objops as $obj)
    {
        $objops_unids[$obj->id] = $objop_unidad->Find("id_objop=$obj->id");
    }
    $smarty->assign('objops_unids', $objops_unids);

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

    $entidad = new Entidad();
    $id_entidad = $linea->plan->id_entidad;
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('objest_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_OBJ_EST . ": " . $linea->indice . "." . $objest->indice . ". " . $objest->nombre);
    $plantilla = 'planes/objest_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
