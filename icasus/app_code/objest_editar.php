<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: objest_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar un objetivo estratégico existente
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_linea') && filter_has_var(INPUT_GET, 'id_objest') && $control)
{
    $id_linea = filter_input(INPUT_GET, 'id_linea', FILTER_SANITIZE_NUMBER_INT);
    $id_objest = filter_input(INPUT_GET, 'id_objest', FILTER_SANITIZE_NUMBER_INT);

    $objest = new ObjetivoEstrategico();
    $objest->load("id = $id_objest");
    $smarty->assign('objest', $objest);

    $linea = new Linea();
    $linea->load("id=$id_linea");
    $smarty->assign('linea', $linea);

    $lineas = $linea->Find("id_plan=$linea->id_plan");
    $smarty->assign('lineas', $lineas);

    $plan = new Plan();
    $plan->load("id=$linea->id_plan");
    $smarty->assign('plan', $plan);

    $entidad = new Entidad();
    $entidad->load("id=$plan->id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('objest_editar'));
    $smarty->assign('_nombre_pagina', TXT_OBJEST_EDIT . ' ' . $linea->indice . '.' . $objest->indice . '. ' . $objest->nombre . ': ' . FIELD_LINEA . " " . $linea->indice . ". " . $linea->nombre);
    $plantilla = 'objest_editar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
