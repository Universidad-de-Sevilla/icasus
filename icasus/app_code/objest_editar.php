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

    //Validar índice de un objetivo estratégico
    $indices = array();
    foreach ($lineas as $ln)
    {
        $indices[$ln->indice] = array();
        $objests = $objest->Find("id_linea=$ln->id");
        foreach ($objests as $obj)
        {
            if ($objest->indice != $obj->indice)
            {
                array_push($indices[$ln->indice], $obj->indice);
            }
            else if ($id_linea != $ln->id)
            {
                array_push($indices[$ln->indice], $obj->indice);
            }
        }
    }
    $smarty->assign('elementos', $indices);

    $smarty->assign('_javascript', array('objest_editar'));
    $smarty->assign('_nombre_pagina', TXT_OBJEST_EDIT . ': ' . $linea->indice . '.' . $objest->indice . '. ' . $objest->nombre);
    $plantilla = 'objest_editar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
