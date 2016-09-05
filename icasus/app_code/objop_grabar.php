<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: objop_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea/Edita un objetivo operacional para un objetivo estratégico de una línea de un plan
//---------------------------------------------------------------------------------------------------

global $usuario;
//Variable para operar con los planes
$logicaPlan = new LogicaPlan();

if (filter_has_var(INPUT_POST, 'indice') && filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'id_objest') && filter_has_var(INPUT_POST, 'id_responsable') && filter_has_var(INPUT_POST, 'peso'))
{
    $id_objest = filter_input(INPUT_POST, 'id_objest', FILTER_SANITIZE_NUMBER_INT);
    $objest = new ObjetivoEstrategico();
    $objest->load_joined("id=$id_objest");
    $plan = $objest->linea->plan;
    $objop = new ObjetivoOperacional();
    $exito = MSG_OBJOP_CREADO . ' ' . $objest->linea->indice . '.' . $objest->indice . '. ' . $objest->nombre;
    // Si viene el id es que estamos editando un objetivo operacional existente
    if (filter_has_var(INPUT_POST, 'id_objop'))
    {
        $id_objop = filter_input(INPUT_POST, 'id_objop', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_OBJOP_EDITADO;
        if ($objop->load("id = $id_objop") == false)
        {
            $error = ERR_OBJOP_EDIT;
            header("Location: index.php?page=error&error=error");
        }
        //Guardamos su objetivo estratégico y peso por si cambia después
        $id_objest_old = $objop->id_objest;
        $peso_old = $objop->peso;
        //Eliminamos las unidades por si cambian luego
        $objetivo_unidad = new ObjetivoUnidad();
        while ($objetivo_unidad->load("id_objop = $id_objop"))
        {
            $objetivo_unidad->delete();
        }
        //Eliminamos los indicadores asociados por si cambian luego
        $objetivo_indicador = new ObjetivoIndicador();
        while ($objetivo_indicador->load("id_objop = $id_objop"))
        {
            $objetivo_indicador->delete();
        }
    }
    else
    {
        $objop->ejecucion = 0;
    }
    // Guardamos los datos
    $objop->id_objest = $id_objest;
    $objop->indice = filter_input(INPUT_POST, 'indice', FILTER_SANITIZE_NUMBER_INT);
    $objop->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $objop->id_responsable = filter_input(INPUT_POST, 'id_responsable', FILTER_SANITIZE_NUMBER_INT);
    $objop->descendente = filter_input(INPUT_POST, 'tipo_objop', FILTER_SANITIZE_NUMBER_INT);
    $objop->peso = filter_input(INPUT_POST, 'peso', FILTER_VALIDATE_FLOAT);
    $objop->save();

    $post_array = filter_input_array(INPUT_POST);
    //Grabamos unidades
    $subunidades = filter_has_var(INPUT_POST, 'subunidades') ? $post_array['subunidades'] : array();
    if (count($subunidades) > 0)
    {
        foreach ($subunidades as $subunidad)
        {
            $objetivo_unidad = new ObjetivoUnidad();
            $objetivo_unidad->id_objop = $objop->id;
            $objetivo_unidad->id_entidad = filter_var($subunidad, FILTER_SANITIZE_NUMBER_INT);
            $objetivo_unidad->save();
        }
    }

    //Grabamos indicadores/datos de correlación
    $indicadores_correlacion = filter_has_var(INPUT_POST, 'indicadores_correlacion') ? $post_array['indicadores_correlacion'] : array();
    if (count($indicadores_correlacion) > 0)
    {
        foreach ($indicadores_correlacion as $indicador)
        {
            $objetivo_indicador = new ObjetivoIndicador();
            $objetivo_indicador->id_objop = $objop->id;
            $objetivo_indicador->id_indicador = filter_var($indicador, FILTER_SANITIZE_NUMBER_INT);
            $objetivo_indicador->control = 0;
            $objetivo_indicador->save();
        }
    }

    //Grabamos indicadores/datos de control
    $indicadores_control = filter_has_var(INPUT_POST, 'indicadores_control') ? $post_array['indicadores_control'] : array();
    if (count($indicadores_control) > 0)
    {
        foreach ($indicadores_control as $indicador)
        {
            $objetivo_indicador = new ObjetivoIndicador();
            $objetivo_indicador->id_objop = $objop->id;
            $objetivo_indicador->id_indicador = filter_var($indicador, FILTER_SANITIZE_NUMBER_INT);
            $objetivo_indicador->control = 1;
            $objetivo_indicador->save();
        }
    }
    //Si estamos creando un nuevo objetivo operacional
    if (!isset($id_objop))
    {
        //Creamos ejecuciones anuales
        for ($i = $plan->anyo_inicio; $i <= ($plan->anyo_inicio + $plan->duracion - 1); $i++)
        {
            $ejecucion = new Ejecucion();
            $ejecucion->id_objop = $objop->id;
            $ejecucion->anyo = $i;
            $ejecucion->valor = 0;
            $ejecucion->activo = 1;
            $ejecucion->Save();
        }
        //Actualizamos ejecuciones
        for ($i = $plan->anyo_inicio; $i <= ($plan->anyo_inicio + $plan->duracion - 1); $i++)
        {
            $logicaPlan->actualizar_ejecucion_anual($id_objest, $i);
        }
        $logicaPlan->actualizar_ejecucion_global_objest($id_objest);
    }
    //Si hemos editado un objetivo operacional existente
    else
    {
        //Si hemos cambiado el objetivo estratégico al que pertenece
        if ($id_objest_old != $id_objest)
        {
            //Actualizamos ejecuciones
            for ($i = $plan->anyo_inicio; $i <= ($plan->anyo_inicio + $plan->duracion - 1); $i++)
            {
                $logicaPlan->actualizar_ejecucion_anual($id_objest_old, $i);
                $logicaPlan->actualizar_ejecucion_anual($id_objest, $i);
            }
            $logicaPlan->actualizar_ejecucion_global_objest($id_objest_old);
            $logicaPlan->actualizar_ejecucion_global_objest($id_objest);
        }
        //Si el peso cambio
        else if ($peso_old != $objop->peso)
        {
            //Actualizamos ejecuciones
            for ($i = $plan->anyo_inicio; $i <= ($plan->anyo_inicio + $plan->duracion - 1); $i++)
            {
                $logicaPlan->actualizar_ejecucion_anual($id_objest, $i);
            }
            $logicaPlan->actualizar_ejecucion_global_objest($id_objest);
        }
    }
    header("Location: index.php?page=objop_mostrar&id_objop=$objop->id&id_entidad=$plan->id_entidad&exito=$exito");
}
else
{
    // Avisamos de error por falta de parámetros
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=error");
}
