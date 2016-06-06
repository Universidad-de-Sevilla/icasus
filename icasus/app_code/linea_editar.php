<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: linea_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar una línea estratégica existente
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_linea') && filter_has_var(INPUT_GET, 'id_plan') && $control)
{
    $id_linea = filter_input(INPUT_GET, 'id_linea', FILTER_SANITIZE_NUMBER_INT);
    $id_plan = filter_input(INPUT_GET, 'id_plan', FILTER_SANITIZE_NUMBER_INT);

    $linea = new Linea();
    $linea->load("id=$id_linea");
    $smarty->assign('linea', $linea);

    $plan = new Plan();
    $plan->load("id = $id_plan");
    $smarty->assign('plan', $plan);

    $entidad = new Entidad();
    $entidad->load("id=$plan->id_entidad");
    $smarty->assign('entidad', $entidad);

    //Validar índice de una línea
    $indices = array();
    $lineas = $linea->Find("id_plan=$id_plan");
    foreach ($lineas as $lin)
    {
        if ($lin->indice != $linea->indice)
        {
            array_push($indices, $lin->indice);
        }
    }
    $smarty->assign('elementos', $indices);

    $smarty->assign('_nombre_pagina', TXT_LINEA_EDIT . ': ' . $linea->indice . '. ' . $linea->nombre);
    $plantilla = 'linea_editar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
