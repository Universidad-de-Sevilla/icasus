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

    //Obtenemos los datos de la línea
    $linea = new Linea();
    if ($linea->load("id = $id_linea"))
    {
        $smarty->assign('linea', $linea);
    }
    else
    {

        $error = ERR_LINEA_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    $plan = new Plan();
    $plan->load("id=$linea->id_plan");
    $smarty->assign('plan', $plan);

    $entidad = new Entidad();
    $entidad->load("id=$plan->id_entidad");
    $smarty->assign('entidad', $entidad);

    //Validar índice de un objetivo estratégico
    $objest = new ObjetivoEstrategico();
    $indices = array();
    $objests = $objest->Find("id_linea=$id_linea");
    foreach ($objests as $obj)
    {
        array_push($indices, $obj->indice);
    }
    $smarty->assign('elementos', $indices);

    $smarty->assign('_nombre_pagina', TXT_OBJEST_CREAR . ': ' . FIELD_LINEA . " " . $linea->indice . '. ' . $linea->nombre);
    $plantilla = 'objest_crear.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
