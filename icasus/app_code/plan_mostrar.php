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
    $plan->load("id = $id_plan");
    $smarty->assign('plan', $plan);

    //Obtenemos sus ejecuciones anuales
    $ejecucion = new Ejecucion();
    $ejecucion_anual = array();
    for ($i = $plan->anyo_inicio; $i <= ($plan->anyo_inicio + $plan->duracion); $i++)
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
    $lineas = $linea->Find("id_plan=$id_plan");
    $smarty->assign('lineas', $lineas);

    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('plan_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_PLAN . " " . $plan->anyo_inicio . "-" . ($plan->anyo_inicio + $plan->duracion) . ': ' . $entidad->nombre);
    $plantilla = 'plan_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
