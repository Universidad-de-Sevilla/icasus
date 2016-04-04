<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: datos.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de todos los datos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

$dato = new Indicador();
$datos = $dato->Find_joined("id_proceso IS NULL");
$smarty->assign('datos', $datos);

// Datos bajo la responsabilidad de este usuario
$datos_propios = $dato->Find_joined_ultima_medicion("(id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id) AND id_proceso IS NULL");
$smarty->assign("datos_propios", $datos_propios);

if ($datos_propios)
{
    // Valores totales de las últimas mediciones
    $totales = array();
    $valor = new Valor();
    foreach ($datos_propios as $indicador)
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
    foreach ($datos_propios as $indicador)
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
                    if (strpos($valor_referencia_medicion->valor_referencia->etiqueta, 'mite') !== false)
                    {
                        $medicion_lim[$indicador->id] = $valor_referencia_medicion->valor;
                    }
                    //Es la referencia Meta
                    if (strpos($valor_referencia_medicion->valor_referencia->etiqueta, 'eta') !== false)
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

$smarty->assign('_javascript', array('dato_listar'));
$smarty->assign('_nombre_pagina', TXT_DATOS_US);
$plantilla = 'datos.tpl';
