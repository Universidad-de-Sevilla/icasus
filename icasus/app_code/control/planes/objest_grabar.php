<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: planes/objest_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea/Edita un objetivo estratégico para una línea de un plan
//---------------------------------------------------------------------------------------------------

global $usuario;
//Variable para operar con los planes
$logicaPlan = new LogicaPlan();

if (filter_has_var(INPUT_POST, 'indice') && filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'id_linea'))
{
    $id_linea = filter_input(INPUT_POST, 'id_linea', FILTER_SANITIZE_NUMBER_INT);
    $linea = new Linea();
    $linea->load_joined("id=$id_linea");
    $plan = $linea->plan;
    $objest = new ObjetivoEstrategico();
    $exito = MSG_OBJEST_CREADO . ' ' . $linea->indice . '. ' . $linea->nombre;
    // Si viene el id es que estamos editando un objetivo estratégico existente
    if (filter_has_var(INPUT_POST, 'id_objest'))
    {
        $id_objest = filter_input(INPUT_POST, 'id_objest', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_OBJEST_EDITADO;
        if ($objest->load("id = $id_objest") == false)
        {
            $error = ERR_OBJEST_EDIT;
            header("Location: index.php?page=error&error=error");
        }
        //Guardamos su linea actual por si cambia
        $id_linea_old = $objest->id_linea;
    }
    else
    {
        $objest->ejecucion = 0;
    }
    // Guardamos los datos
    $objest->id_linea = $id_linea;
    $objest->indice = filter_input(INPUT_POST, 'indice', FILTER_SANITIZE_NUMBER_INT);
    $objest->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $objest->save();

    //Si estamos creando un nuevo objetivo estratégico
    if (!isset($id_objest))
    {
        //Actualizamos ejecuciones
        for ($i = $plan->anyo_inicio; $i <= ($plan->anyo_inicio + $plan->duracion - 1); $i++)
        {
            $logicaPlan->actualizar_ejecucion_anual_linea($id_linea, $i);
        }
        $logicaPlan->actualizar_ejecucion_global_linea($id_linea);
    }
    //Si hemos editado un objetivo operacional existente
    else
    {
        //Si hemos cambiado la linea
        if ($id_linea_old != $id_linea)
        {
            //Actualizamos ejecuciones
            for ($i = $plan->anyo_inicio; $i <= ($plan->anyo_inicio + $plan->duracion - 1); $i++)
            {
                $logicaPlan->actualizar_ejecucion_anual_linea($id_linea_old, $i);
                $logicaPlan->actualizar_ejecucion_anual_linea($id_linea, $i);
            }
            $logicaPlan->actualizar_ejecucion_global_linea($id_linea_old);
            $logicaPlan->actualizar_ejecucion_global_linea($id_linea);
        }
    }
    header("Location: index.php?page=objest_mostrar&id_objest=$objest->id&id_entidad=$plan->id_entidad&exito=$exito");
}
else
{
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=error");
}
