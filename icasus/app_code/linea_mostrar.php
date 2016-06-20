<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: linea_mostrar.php
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
    $linea->load("id = $id_linea");
    $smarty->assign('linea', $linea);

    //Obtener todas las líneas para avanzar o retroceder 
    $id_plan = $linea->id_plan;
    $lineas = $linea->Find("id_plan = $id_plan");
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

    //Obtenemos sus ejecuciones anuales
    $ejecucion = new Ejecucion();
    $ejecucion_anual = array();
    for ($i = $plan->anyo_inicio; $i <= ($plan->anyo_inicio + $plan->duracion); $i++)
    {
        if ($ejecucion->Load("id_linea=$linea->id AND anyo=$i"))
        {
            $ejecucion_anual[$i] = $ejecucion->valor;
        }
        else
        {
            $ejecucion_anual[$i] = 0;
        }
    }
    $smarty->assign("ejecucion_anual", $ejecucion_anual);

    //Objetivos estratégicos
    $objest = new ObjetivoEstrategico();
    $objests = $objest->Find_joined("id_linea=$id_linea");
    $smarty->assign('objests', $objests);

    //Objetivos operacionales
    $objop = new ObjetivoOperacional();
    $objops = array();
    foreach ($objests as $obj)
    {
        $objops = array_merge($objops, $objop->Find_joined("id_objest=$obj->id"));
    }
    $smarty->assign('objops', $objops);

    $entidad = new Entidad();
    $entidad->load("id = $plan->id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('linea_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_LINEA . ": " . $linea->indice . ". " . $linea->nombre);
    $plantilla = 'linea_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
