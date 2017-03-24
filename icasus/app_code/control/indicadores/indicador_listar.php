<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicadores/indicador_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de indicadores para una entidad determinada
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    //Variable para operar con Procesos
    $logicaProceso = new LogicaProceso();
    //Variables para operar con Indicadores/Datos
    $logicaIndicador = new LogicaIndicador();
    $logicaMedicion = new LogicaMedicion();
    $indicador = new Indicador();

    //Todos los indicadores
    $indicadores_todos = $indicador->Find_joined("id_entidad = $id_entidad AND archivado is NULL");
    $smarty->assign('indicadores_todos', $indicadores_todos);

    //Permisos de procesos
    $permiso_proceso = array();
    foreach ($indicadores_todos as $indicador)
    {
        if ($logicaProceso->comprobar_responsable_proceso($usuario->id, $indicador->proceso))
        {
            $permiso_proceso[$indicador->id] = true;
        }
        else
        {
            $permiso_proceso[$indicador->id] = false;
        }
    }
    $smarty->assign('permiso_proceso', $permiso_proceso);

    //Indicadores de procesos
    $indicadores = $indicador->Find_joined("id_entidad = $id_entidad AND id_proceso IS NOT NULL AND archivado is NULL");
    $smarty->assign('indicadores', $indicadores);

    //Indicadores de control
    $indicadores_ctl = $indicador->Find_joined("id_entidad = $id_entidad AND control=1 AND archivado is NULL");
    $smarty->assign('indicadores_ctl', $indicadores_ctl);

    //Objetivos operacionales de indicadores de control
    $objops = array();
    $objetivo_indicador = new ObjetivoIndicador();
    foreach ($indicadores_ctl as $indicador)
    {
        if ($objetivo_indicador->load("id_indicador=$indicador->id AND control=1"))
        {
            $objop = new ObjetivoOperacional();
            $objop->load("id=$objetivo_indicador->id_objop");
            $objops[$indicador->id] = $objop;
        }
    }
    $smarty->assign('objops', $objops);

    //Indicadores (datos)
    $datos = $indicador->Find_joined("id_entidad = $id_entidad AND id_proceso IS NULL AND control=0 AND archivado is NULL");
    $smarty->assign('datos', $datos);

    //Indicadores archivados
    $indicadores_archivados = $indicador->Find_joined("id_entidad = $id_entidad AND archivado is NOT NULL");
    $smarty->assign('indicadores_archivados', $indicadores_archivados);

    //Indicadores bajo la responsabilidad de este usuario
    $indicadores_propios = $indicador->Find_joined_ultima_medicion("(id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id) AND id_entidad=$id_entidad AND archivado IS NULL");
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
    $smarty->assign('_nombre_pagina', FIELD_INDICS . '/' . FIELD_DATOS . ': ' . $entidad->nombre);
    $plantilla = 'indicadores/indicador_listar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
