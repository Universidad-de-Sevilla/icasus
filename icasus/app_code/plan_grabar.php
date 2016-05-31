<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: plan_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea un nuevo plan estratégico para una unidad
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_POST, 'anyo_inicio') && filter_has_var(INPUT_POST, 'duracion') && filter_has_var(INPUT_POST, 'id_entidad'))
{
    $plan = new Plan();
    $exito = MSG_PLAN_CREADO;
    // Si viene el id es que estamos editando un plan existente
    if (filter_has_var(INPUT_POST, 'id_plan'))
    {
        $id_plan = filter_input(INPUT_POST, 'id_plan', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_PLAN_EDITADO;
        if ($plan->load("id = $id_plan") == false)
        {
            $error = ERR_PLAN_EDIT;
            header("Location: index.php?page=error&error=error");
        }
    }
    else
    {
        $plan->ejecucion = 0;
    }
    // Guardamos los datos
    $plan->id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $plan->anyo_inicio = filter_input(INPUT_POST, 'anyo_inicio', FILTER_SANITIZE_NUMBER_INT);
    $plan->duracion = filter_input(INPUT_POST, 'duracion', FILTER_SANITIZE_NUMBER_INT);
    $plan->titulo = filter_input(INPUT_POST, 'titulo', FILTER_SANITIZE_STRING);
    $plan->mision = filter_input(INPUT_POST, 'mision', FILTER_SANITIZE_STRING);
    $plan->vision = filter_input(INPUT_POST, 'vision', FILTER_SANITIZE_STRING);
    $plan->valores = filter_input(INPUT_POST, 'valores', FILTER_SANITIZE_STRING);
    $plan->fce = filter_input(INPUT_POST, 'fce', FILTER_SANITIZE_STRING);
    $plan->save();
    header("Location: index.php?page=plan_mostrar&id_plan=$plan->id&id_entidad=$plan->id_entidad&exito=$exito");
}
else
{
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=error");
}
