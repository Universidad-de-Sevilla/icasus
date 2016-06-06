<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: plan_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar un plan estratégico existente
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_plan') && filter_has_var(INPUT_GET, 'id_entidad') && $control)
{
    $id_plan = filter_input(INPUT_GET, 'id_plan', FILTER_SANITIZE_NUMBER_INT);
    $plan = new Plan();
    $plan->load("id = $id_plan");
    $smarty->assign('plan', $plan);

    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id=$id_entidad");
    $smarty->assign('entidad', $entidad);

    //Validar año de inicio de un plan
    $anyos = array();
    $planes = $plan->Find("id_entidad=$id_entidad");
    foreach ($planes as $pl)
    {
        if ($pl->anyo_inicio != $plan->anyo_inicio)
        {
            array_push($anyos, $pl->anyo_inicio);
        }
    }
    $smarty->assign('elementos', $anyos);

    $smarty->assign('_nombre_pagina', TXT_PLAN_EDIT . ' ' . $plan->anyo_inicio . "-" . ($plan->anyo_inicio + $plan->duracion) . ': ' . $entidad->nombre);
    $plantilla = 'plan_editar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
