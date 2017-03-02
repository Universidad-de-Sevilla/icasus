<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: plan_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripción: muestra el formulario que permite crear un nuevo plan estratégico
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_entidad') && $control)
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id=$id_entidad");

    //Validar año de inicio de un plan
    $plan = new Plan();
    $anyos = array();
    $planes = $plan->Find("id_entidad=$id_entidad");
    foreach ($planes as $pl)
    {
        array_push($anyos, $pl->anyo_inicio);
    }
    $smarty->assign('elementos', $anyos);

    $smarty->assign('entidad', $entidad);
    $smarty->assign('_nombre_pagina', TXT_PLAN_CREAR . ": " . $entidad->nombre);
    $plantilla = 'planes/plan_crear.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
