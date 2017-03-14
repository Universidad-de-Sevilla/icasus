<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: linea_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea/Edita una línea estratégica para un plan
//---------------------------------------------------------------------------------------------------

global $usuario;
//Variable para operar con los planes
$logicaPlan = new LogicaPlan();

if (filter_has_var(INPUT_POST, 'indice') && filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'id_plan'))
{
    $linea = new Linea();
    $plan = new Plan();
    $exito = MSG_LINEA_CREADA;
    // Si viene el id es que estamos editando una línea existente
    if (filter_has_var(INPUT_POST, 'id_linea'))
    {
        $id_linea = filter_input(INPUT_POST, 'id_linea', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_LINEA_EDITADA;
        if ($linea->load("id = $id_linea") == false)
        {
            $error = ERR_LINEA_EDIT;
            header("Location: index.php?page=error&error=error");
        }
    }
    else
    {
        $linea->ejecucion = 0;
    }
    // Guardamos los datos
    $id_plan = filter_input(INPUT_POST, 'id_plan', FILTER_SANITIZE_NUMBER_INT);
    $plan->load("id=$id_plan");
    $linea->id_plan = $id_plan;
    $linea->indice = filter_input(INPUT_POST, 'indice', FILTER_SANITIZE_NUMBER_INT);
    $linea->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $linea->save();

    //Si estamos creando una nueva línea estratégica
    if (!isset($id_linea))
    {
        //Actualizamos ejecuciones
        for ($i = $plan->anyo_inicio; $i <= ($plan->anyo_inicio + $plan->duracion - 1); $i++)
        {
            $logicaPlan->actualizar_ejecucion_anual_plan($id_plan, $i);
        }
        $logicaPlan->actualizar_ejecucion_global_plan($id_plan);
    }
    header("Location: index.php?page=linea_mostrar&id_entidad=$plan->id_entidad&id_linea=$linea->id&exito=$exito");
}
else
{
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=error");
}
