<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: objest_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripción: muestra el formulario que permite crear un nuevo objetivo estratégico
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_linea') && $control)
{
    $id_linea = filter_input(INPUT_GET, 'id_linea', FILTER_SANITIZE_NUMBER_INT);
    $linea = new Linea();
    $linea->load("id=$id_linea");
    $smarty->assign('linea', $linea);

    $plan = new Plan();
    $plan->load("id=$linea->id_plan");
    $smarty->assign('plan', $plan);

    $entidad = new Entidad();
    $entidad->load("id=$plan->id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_nombre_pagina', TXT_OBJEST_CREAR . ': ' . FIELD_LINEA . " " . $linea->indice . '. ' . $linea->nombre);
    $plantilla = 'objest_crear.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
