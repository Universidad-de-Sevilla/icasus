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
//Variables para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();
$logicaMedicion = new LogicaMedicion();

// Entidades de este usuario
$smarty->assign('entidades_usuario', $usuario->entidades);

// Entidad principal
if (filter_has_var(INPUT_GET, 'id_principal') && filter_has_var(INPUT_GET, 'id_usuario'))
{
    $id_principal = filter_input(INPUT_GET, 'id_principal', FILTER_SANITIZE_NUMBER_INT);
    $id_usuario = filter_input(INPUT_GET, 'id_usuario', FILTER_SANITIZE_NUMBER_INT);
    $usuario_entidad = new Usuario_entidad();
    $entidades_usuario = $usuario_entidad->Find_entidades("id_usuario = $id_usuario");
    //Desasignamos todas para evitar conflictos
    foreach ($entidades_usuario as $user_unid)
    {
        $usuario_entidad->Load("id=$user_unid->id");
        $usuario_entidad->principal = 0;
        $usuario_entidad->Save();
    }
    //Asignamos la unidad principal
    foreach ($entidades_usuario as $user_unid)
    {
        if ($user_unid->id == $id_principal)
        {
            $usuario_entidad->Load("id=$id_principal");
            $usuario_entidad->principal = 1;
            $usuario_entidad->Save();
        }
    }
    //Actualizamos el usuario
    if ($id_usuario == $usuario->id)
    {
        $usuario->entidades = $usuario_entidad->Find_entidades("id_usuario = $usuario->id");
    }
}

// Procesos propiedad del usuario
$proceso = new Proceso();
$procesos_propios = $proceso->Find_joined("id_propietario=$usuario->id");
$smarty->assign('procesos_propios', $procesos_propios);

// Indicadores bajo la responsabilidad de este usuario
$indicador = new Indicador();
$indicadores = $indicador->Find_joined_ultima_medicion("(id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id) AND id_proceso IS NOT NULL AND archivado IS NULL");
$smarty->assign("indicadores_propios", $indicadores);

// Datos bajo la responsabilidad de este usuario
$datos = $indicador->Find_joined_ultima_medicion("(id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id) AND id_proceso IS NULL AND archivado IS NULL");
$smarty->assign("datos_propios", $datos);

// Cuadros de mando del usuario
$cuadro = new Cuadro();
$cuadros = $cuadro->Find_joined("id_usuario = $usuario->id");
$smarty->assign('cuadros_propios', $cuadros);

// Objetivos operacionales bajo la responsabilidad de este usuario
$objop = new ObjetivoOperacional();
$objops = $objop->Find_joined("id_responsable = $usuario->id");
$smarty->assign('objops_propios', $objops);

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

if ($indicadores_datos)
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

    //Control (Status) de valores límite y metas
    $valor_referencia = new Valor_referencia();
    $valor_referencia_medicion = new Valor_referencia_medicion();
    $medicion_lim = array();
    $medicion_obj = array();
    $status = array();
    //Incializamos ambos arrays de referencias a null por defecto
    foreach ($indicadores_datos as $indicador)
    {
        $medicion_lim[$indicador->id] = NULL;
        $medicion_obj[$indicador->id] = NULL;
    }
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

$smarty->assign('_javascript', array('inicio'));
$smarty->assign('_nombre_pagina', TXT_INICIO);
$plantilla = 'inicio.tpl';
