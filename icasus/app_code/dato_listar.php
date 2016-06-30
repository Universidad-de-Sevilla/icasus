<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: dato_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de datos para una entidad determinada
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
//Variables para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();
$logicaMedicion = new LogicaMedicion();

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $dato = new Indicador();
    $datos = $dato->Find_joined("id_entidad = $id_entidad AND id_proceso IS NULL AND archivado is NULL");
    $smarty->assign('datos', $datos);

    //Datos archivados
    $datos_archivados = $dato->Find_joined("id_entidad = $id_entidad AND id_proceso IS NULL AND archivado is NOT NULL");
    $smarty->assign('datos_archivados', $datos_archivados);

    // Datos bajo la responsabilidad de este usuario
    $datos_propios = $dato->Find_joined_ultima_medicion("(id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id) AND id_proceso IS NULL AND id_entidad = $id_entidad");
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
        $status = array();
        //Incializamos ambos arrays de referencias a null por defecto
        foreach ($datos_propios as $indicador)
        {
            $medicion_lim[$indicador->id] = NULL;
            $medicion_obj[$indicador->id] = NULL;
        }
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
                        if (strpos($valor_referencia_medicion->valor_referencia->nombre, 'mite'))
                        {
                            $medicion_lim[$indicador->id] = $valor_referencia_medicion->valor;
                        }
                        //Es la referencia Meta
                        if (strpos($valor_referencia_medicion->valor_referencia->nombre, 'eta'))
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
    $smarty->assign('_javascript', array('dato_listar'));
    $smarty->assign('_nombre_pagina', FIELD_DATOS . ": " . $entidad->nombre);
    $plantilla = 'dato_listar.tpl';
}
else
{
    $error = ERR_UNID;
    header("location:index.php?page=datos&error=$error");
}
