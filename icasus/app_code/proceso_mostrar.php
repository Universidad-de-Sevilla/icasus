<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra los datos de un proceso y los indicadores asociados
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

// Si vienen datos suficientes cargamos proceso con sus indicadores
if (filter_has_var(INPUT_GET, 'id_proceso') AND filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_proceso = filter_input(INPUT_GET, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    // Datos del proceso
    $proceso = new Proceso();
    $proceso->load_joined("id = $id_proceso");
    $smarty->assign('proceso', $proceso);

    //Obtener todos los procesos para avanzar o retroceder 
    $procesos = $proceso->Find_joined("id_entidad = $id_entidad ORDER BY codigo");
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
    $proceso_madre = new Proceso();
    $proceso_madre->load("id = $proceso->id_madre");
    $smarty->assign('proceso_madre', $proceso_madre);

    //Datos del propietario
    $propietario = new Usuario();
    $propietario->load("id = $proceso->id_propietario");
    $smarty->assign('propietario', $propietario);

    // Listado de subprocesos
    $subprocesos = $proceso->Find_joined("id_madre = $id_proceso");
    $smarty->assign('subprocesos', $subprocesos);

    // Listado de indicadores
    $indicador = new Indicador();
    $indicadores = $indicador->Find_joined_ultima_medicion("id_proceso = $id_proceso");
    $smarty->assign('indicadores', $indicadores);

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

        //Control (Status) de valores limite y objetivo
        $valor_referencia = new Valor_referencia();
        $valor_referencia_medicion = new Valor_referencia_medicion();
        $medicion_lim = array();
        $medicion_obj = array();
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
                        //Es la referencia Limite
                        if (strpos($valor_referencia_medicion->valor_referencia->etiqueta, 'mite') !== false)
                        {
                            $medicion_lim[$indicador->id] = $valor_referencia_medicion->valor;
                        }
                        //Es la referencia Objetivo
                        if (strpos($valor_referencia_medicion->valor_referencia->etiqueta, 'bjetivo') !== false)
                        {
                            $medicion_obj[$indicador->id] = $valor_referencia_medicion->valor;
                        }
                    }
                }
            }
        }

        $smarty->assign('medicion_obj', $medicion_obj);
        $smarty->assign('medicion_lim', $medicion_lim);
    }

    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('inicio'));
    $smarty->assign('_nombre_pagina', TXT_PROC_FICHA . ": " . $proceso->nombre);
    $plantilla = 'proceso_mostrar.tpl';

    $flujograma = new Fichero();
    $condicion = "id_objeto= $id_proceso AND tipo_objeto = 'proceso' AND descripcion = 'flujograma' AND extension IN ('PNG','GIF','JPG','JPEG');";
    if ($flujograma->load($condicion))
    {
        $smarty->assign('flujograma', $flujograma);
    }

    $archivo = new Fichero();
    $archivos = $archivo->find_joined("id_objeto = $id_proceso AND tipo_objeto = 'proceso'");
    if ($archivos)
    {
        $smarty->assign('archivos', $archivos);
    }
}
else
{
    //Si se llama a esta pagina si un id de proceso o de entidad se redirecciona a la página de inicio
    $error = ERR_PARAM;
    header("Location:index.php?error=$error");
}
