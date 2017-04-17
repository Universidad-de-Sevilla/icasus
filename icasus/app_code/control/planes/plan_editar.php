<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: planes/plan_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar un plan estratégico existente
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_plan') && filter_has_var(INPUT_GET, 'id_entidad') && $control)
{
    $id_plan = filter_input(INPUT_GET, 'id_plan', FILTER_SANITIZE_NUMBER_INT);

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

    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id=$id_entidad");
    $smarty->assign('entidad', $entidad);

    //Calcular la duración mínima del plan: limitada a las ejecuciones anuales
    //que tengan recogidos valores (como mínimo dos años).
    $duracion_min = 2;
    $ejecucion = new Ejecucion();
    for ($i = $plan->anyo_inicio + 2; $i <= ($plan->anyo_inicio + $plan->duracion - 1); $i++)
    {
        $ejecuciones_anyo = $ejecucion->Find("anyo=$i and id_objop is not null");
        foreach ($ejecuciones_anyo as $ejecucion_anual)
        {
            if ($ejecucion_anual->valor > 0)
            {
                $duracion_min = $i - ($plan->anyo_inicio - 1);
                break;
            }
        }
    }
    $smarty->assign('duracion_min', $duracion_min);

    $smarty->assign('_nombre_pagina', TXT_PLAN_EDIT . ' ' . $plan->anyo_inicio . " - " . ($plan->anyo_inicio + $plan->duracion - 1) . ': ' . $entidad->nombre);
    $plantilla = 'planes/plan_editar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
