<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicadores.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de todos los indicadores
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
//Variables para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();
$logicaMedicion = new LogicaMedicion();

$indicador = new Indicador();
$indicadores = $indicador->Find_joined("id_proceso IS NOT NULL AND archivado is NULL");
$smarty->assign('indicadores', $indicadores);

//Indicadores archivados
$indicadores_archivados = $indicador->Find_joined("id_proceso IS NOT NULL AND archivado is NOT NULL");
$smarty->assign('indicadores_archivados', $indicadores_archivados);

// Indicadores bajo la responsabilidad de este usuario
$indicadores_propios = $indicador->Find_joined_ultima_medicion("(id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id) AND id_proceso IS NOT NULL AND archivado IS NULL");
$smarty->assign("indicadores_propios", $indicadores_propios);

if ($indicadores_propios)
{
    // Valores totales de las últimas mediciones
    $totales = array();
    $valor = new Valor();
    foreach ($indicadores_propios as $indicador)
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
    foreach ($indicadores_propios as $indicador)
    {
        $medicion_lim[$indicador->id] = NULL;
        $medicion_obj[$indicador->id] = NULL;
    }
    foreach ($indicadores_propios as $indicador)
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

$smarty->assign('_javascript', array('indicador_listar'));
$smarty->assign('_nombre_pagina', TXT_INDICS_US);
$plantilla = 'indicadores.tpl';
