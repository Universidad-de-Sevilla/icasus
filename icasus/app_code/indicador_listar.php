<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicador_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de indicadores para una entidad determinada
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $indicador = new Indicador();
    $indicadores = $indicador->Find_joined("id_entidad = $id_entidad AND id_proceso IS NOT NULL");
    $smarty->assign('indicadores', $indicadores);

    // Indicadores bajo la responsabilidad de este usuario
    $indicadores_propios = $indicador->Find_joined_ultima_medicion("(id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id) AND id_proceso IS NOT NULL AND id_entidad=$id_entidad");
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
            }
        }

        $smarty->assign('medicion_obj', $medicion_obj);
        $smarty->assign('medicion_lim', $medicion_lim);
    }

    $smarty->assign('_javascript', array('indicador_listar'));
    $smarty->assign('_nombre_pagina', FIELD_INDICS . ': ' . $entidad->nombre);
    $plantilla = 'indicador_listar.tpl';
}
else
{
    $error = ERR_UNID_LIST_INDIC;
    header("location:index.php?page=indicadores&error=$error");
}
