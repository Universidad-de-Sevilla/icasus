<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: plan_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea/Edita un plan estratégico para una unidad
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_POST, 'anyo_inicio') && filter_has_var(INPUT_POST, 'duracion') && filter_has_var(INPUT_POST, 'id_entidad'))
{
    $plan = new Plan();
    //Variable para operar con los planes
    $logicaPlan = new LogicaPlan();
    $exito = MSG_PLAN_CREADO;
    $duracion = filter_input(INPUT_POST, 'duracion', FILTER_SANITIZE_NUMBER_INT);

    //Si viene el id es que estamos editando un plan existente
    if (filter_has_var(INPUT_POST, 'id_plan'))
    {
        $id_plan = filter_input(INPUT_POST, 'id_plan', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_PLAN_EDITADO;
        if ($plan->load("id = $id_plan") == false)
        {
            $error = ERR_PLAN_EDIT;
            header("Location: index.php?page=error&error=error");
        }
        //Si cambia la duración del plan
        $duracion_old = $plan->duracion;
        if ($duracion_old != $duracion)
        {
            //Líneas
            $linea = new Linea();
            $lineas = $linea->Find("id_plan=$id_plan order by indice");

            //Objetivos estratégicos
            $objest = new ObjetivoEstrategico();
            $objests = array();
            foreach ($lineas as $linea)
            {
                $objests = array_merge($objests, $objest->Find_joined("id_linea=$linea->id"));
            }

            //Objetivos operacionales
            $objop = new ObjetivoOperacional();
            $objops = array();
            foreach ($objests as $obj)
            {
                $objops = array_merge($objops, $objop->Find_joined("id_objest=$obj->id"));
            }

            //Si la nueva duración es menor
            if ($duracion_old > $duracion)
            {
                //Eliminamos las ejecuciones sobrantes
                $ejecucion = new Ejecucion();
                for ($i = $plan->anyo_inicio + $duracion; $i <= ($plan->anyo_inicio + $plan->duracion - 1); $i++)
                {
                    while ($ejecucion->load("anyo = $i"))
                    {
                        $ejecucion->delete();
                    }
                }
            }
            //Si la nueva duración es mayor
            else
            {
                foreach ($objops as $objop)
                {
                    //Creamos nuevas ejecuciones para los nuevos años
                    for ($i = $plan->anyo_inicio + $duracion_old; $i <= ($plan->anyo_inicio + $duracion - 1); $i++)
                    {
                        $ejecucion = new Ejecucion();
                        $ejecucion->id_objop = $objop->id;
                        $ejecucion->anyo = $i;
                        $ejecucion->valor = 0;
                        $ejecucion->activo = 1;
                        $ejecucion->Save();
                    }
                }
                //Actualizar ejecuciones anuales (sólo si añadimos mas años al plan)
                foreach ($objests as $objest)
                {
                    for ($i = $plan->anyo_inicio + $duracion_old; $i <= ($plan->anyo_inicio + $duracion - 1); $i++)
                    {
                        $logicaPlan->actualizar_ejecucion_anual($objest->id, $i);
                    }
                }
            }
            //Actualizar ejecuciones globales
            foreach ($objops as $objop)
            {
                $logicaPlan->actualizar_ejecucion_global($objop->id);
            }
        }
    }
    // Estamos creando un nuevo plan
    else
    {
        $plan->ejecucion = 0;
    }
    // Guardamos el resto de los datos
    $plan->duracion = $duracion;
    $plan->id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $plan->anyo_inicio = filter_input(INPUT_POST, 'anyo_inicio', FILTER_SANITIZE_NUMBER_INT);
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
