<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: linea_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripción: muestra el formulario que permite crear una nueva línea estratégica
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_plan') && $control)
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

    $entidad = new Entidad();
    $entidad->load("id=$plan->id_entidad");

    //Validar índice de una línea
    $linea = new Linea();
    $indices = array();
    $lineas = $linea->Find("id_plan=$id_plan");
    foreach ($lineas as $lin)
    {
        array_push($indices, $lin->indice);
    }
    $smarty->assign('elementos', $indices);

    $smarty->assign('entidad', $entidad);
    $smarty->assign('_nombre_pagina', TXT_LINEA_CREAR . ': ' . FIELD_PLAN . " " . $plan->anyo_inicio . " - " . ($plan->anyo_inicio + $plan->duracion - 1));
    $plantilla = 'linea_crear.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
