<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: procesos/proceso_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra los datos de un proceso y los indicadores asociados
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;
//Variable para operar con Procesos
$logicaProceso = new LogicaProceso();
//Variables para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();
$logicaMedicion = new LogicaMedicion();

// Si vienen datos suficientes cargamos proceso con sus indicadores
if (filter_has_var(INPUT_GET, 'id_proceso') AND filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_proceso = filter_input(INPUT_GET, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    // Datos del proceso
    $proceso = new Proceso();
    if ($proceso->load_joined("id = $id_proceso"))
    {
        $smarty->assign('proceso', $proceso);
    }
    else
    {
        $error = ERR_PROC_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    //Permisos del proceso
    $permiso_proceso = $logicaProceso->comprobar_responsable_proceso($usuario->id, $proceso);
    $smarty->assign('permiso_proceso', $permiso_proceso);

    //Obtener todos los procesos para avanzar o retroceder 
    $procesos = $proceso->Find("id_entidad = $id_entidad ORDER BY codigo");
    $smarty->assign("procesos", $procesos);
    $cont = 0;
    foreach ($procesos as $proc)
    {
        if ($id_proceso == $proc->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Datos del proceso madre
    $smarty->assign('proceso_madre', $proceso->madre);

    //Datos del propietario
    $smarty->assign('propietario', $proceso->propietario);

    // Listado de subprocesos
    $subprocesos = $proceso->Find_joined("id_madre = $id_proceso");
    $smarty->assign('subprocesos', $subprocesos);

    // Listado de indicadores
    $indicador = new Indicador();
    $indicadores = $indicador->Find_joined_ultima_medicion("id_proceso = $id_proceso AND archivado is NULL");
    $smarty->assign('indicadores', $indicadores);

    //Indicadores archivados
    $indicadores_archivados = $indicador->Find_joined("id_proceso = $id_proceso AND id_entidad = $id_entidad AND id_proceso IS NOT NULL AND archivado is NOT NULL");
    $smarty->assign('indicadores_archivados', $indicadores_archivados);

    if ($indicadores)
    {
        // Valores totales de las últimas mediciones
        $totales = array();
        $valor = new Valor();
        foreach ($indicadores as $indicador)
        {
            $valores = $valor->find("id_medicion=" . $indicador->medicion->id);
            $total = $logicaIndicador->calcular_total($indicador, $valores, $indicador->medicion->etiqueta);
            $totales[$indicador->id] = $total;
        }
        $smarty->assign('totales', $totales);

        //Control (Status) de valores límite y metas
        $valor_referencia = new Valor_referencia();
        $valor_referencia_medicion = new Valor_referencia_medicion();
        $medicion_lim = array();
        $medicion_obj = array();
        $status = array();
        //Incializamos ambos arrays de referencias a null por defecto
        foreach ($indicadores as $indicador)
        {
            $medicion_lim[$indicador->id] = NULL;
            $medicion_obj[$indicador->id] = NULL;
        }
        foreach ($indicadores as $indicador)
        {
            $valores_referencia = $valor_referencia->Find("id_indicador = $indicador->id");
            if ($valores_referencia)
            {
                foreach ($valores_referencia as $valor_referencia)
                {
                    $existe = $valor_referencia_medicion->Load("id_valor_referencia=$valor_referencia->id AND id_medicion=" . $indicador->medicion->id);
                    if (!$existe)
                    {
                        $valor_referencia_medicion = new Valor_referencia_medicion();
                        $valor_referencia_medicion->id_valor_referencia = $valor_referencia->id;
                        $valor_referencia_medicion->id_medicion = $indicador->medicion->id;
                        $valor_referencia_medicion->save();
                    }
                }
                $valores_referencia_medicion = $valor_referencia_medicion->Find_joined("id_medicion=" . $indicador->medicion->id);
                if ($valores_referencia_medicion)
                {
                    foreach ($valores_referencia_medicion as $valor_referencia_medicion)
                    {
                        //Es la referencia Límite
                        if (strpos($valor_referencia_medicion->valor_referencia->nombre, 'mite') !== false)
                        {
                            $medicion_lim[$indicador->id] = $valor_referencia_medicion->valor;
                        }
                        //Es la referencia Meta
                        if (strpos($valor_referencia_medicion->valor_referencia->nombre, 'eta') !== false)
                        {
                            $medicion_obj[$indicador->id] = $valor_referencia_medicion->valor;
                        }
                    }
                }
                $status[$indicador->id] = $logicaMedicion->calcular_status_medicion($indicador->inverso, $totales[$indicador->id], $medicion_lim[$indicador->id], $medicion_obj[$indicador->id]);
            }
        }

        $smarty->assign('medicion_obj', $medicion_obj);
        $smarty->assign('medicion_lim', $medicion_lim);
        $smarty->assign('status', $status);
    }

    //Flujograma
    $flujograma = new Fichero();
    $condicion = "id_objeto= $id_proceso AND tipo_objeto = 'proceso' AND descripcion = 'flujograma' AND extension IN ('PNG','GIF','JPG','JPEG');";
    if ($flujograma->load($condicion))
    {
        $smarty->assign('flujograma', $flujograma);
    }

    //Archivos
    $archivo = new Fichero();
    $archivos = $archivo->find_joined("id_objeto = $id_proceso AND tipo_objeto = 'proceso' AND visible=1");
    $smarty->assign('archivos', $archivos);

    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('inicio', 'proceso_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_PROC . ": " . $proceso->nombre);
    $plantilla = 'procesos/proceso_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
