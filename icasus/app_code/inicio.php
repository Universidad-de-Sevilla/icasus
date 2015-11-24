<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: inicio.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra las entidades, procesos e indicadores/datos bajo la responsabilidad del usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

// Entidades de este usuario
$smarty->assign('entidades_usuario', $usuario->entidades);

// Procesos propiedad del usuario
$proceso = new Proceso();
$procesos_propios = $proceso->Find_joined("id_propietario=$usuario->id");
$smarty->assign('procesos_propios', $procesos_propios);

// Indicadores bajo la responsabilidad de este usuario
$indicador = new Indicador();
$indicadores = $indicador->Find_joined_ultima_medicion("(id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id) AND id_proceso IS NOT NULL");
$smarty->assign("indicadores_propios", $indicadores);

// Datos bajo la responsabilidad de este usuario
$datos = $indicador->Find_joined_ultima_medicion("(id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id) AND id_proceso IS NULL");
$smarty->assign("datos_propios", $datos);

// Cuadros de mando del usuario
$cuadro = new Cuadro();
$cuadros = $cuadro->Find("id_usuario = $usuario->id");
$smarty->assign('cuadros_propios', $cuadros);

if (is_array($indicadores) && is_array($datos))
{
    $indicadores_datos = array_merge($indicadores, $datos);
}
if (is_array($indicadores) && !is_array($datos))
{
    $indicadores_datos = $indicadores;
}
if (is_array($datos) && !is_array($indicadores))
{
    $indicadores_datos = $datos;
}

if (isset($indicadores_datos))
{
// Valores totales de las últimas mediciones
    $totales = array();
    $valor = new Valor();
    foreach ($indicadores_datos as $indicador)
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
    foreach ($indicadores_datos as $indicador)
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

    $smarty->assign('medicion_obj', $medicion_obj);
    $smarty->assign('medicion_lim', $medicion_lim);
}
$smarty->assign('_javascript', array('inicio'));
$smarty->assign('_nombre_pagina', TXT_INICIO);
$plantilla = 'inicio.tpl';
