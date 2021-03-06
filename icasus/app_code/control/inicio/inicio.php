<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: inicio/inicio.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra las entidades, procesos e indicadores/datos bajo la responsabilidad del usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Procesos
$logicaProceso = new LogicaProceso();
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
$indicadores = $indicador->Find_joined_ultima_medicion("(id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id) AND archivado IS NULL");
$smarty->assign("indicadores_propios", $indicadores);

// Cuadros de mando del usuario
$cuadro = new Cuadro();
$cuadros = $cuadro->Find_joined("id_usuario = $usuario->id");
$smarty->assign('cuadros_propios', $cuadros);

// Objetivos operacionales bajo la responsabilidad de este usuario
$objop = new ObjetivoOperacional();
$objops = $objop->Find_joined("id_responsable = $usuario->id");
$smarty->assign('objops_propios', $objops);

//Años de ejecución de los objetivos operacionales
$ejecucion = new Ejecucion();
$objops_anyos = array();
foreach ($objops as $obj)
{
    $objops_anyos[$obj->id] = array();
    $ejecuciones = $ejecucion->Find("id_objop=$obj->id order by anyo");
    foreach ($ejecuciones as $ejec)
    {
        if ($ejec->activo)
        {
            array_push($objops_anyos[$obj->id], $ejec->anyo);
        }
    }
}
$smarty->assign('objops_anyos', $objops_anyos);

//Unidades de los objetivos operacionales
$objop_unidad = new ObjetivoUnidad();
$objops_unids = array();
foreach ($objops as $obj)
{
    $objops_unids[$obj->id] = $objop_unidad->Find("id_objop=$obj->id");
}
$smarty->assign('objops_unids', $objops_unids);

if ($indicadores)
{
    //Permisos de procesos
    $permiso_proceso = array();
    foreach ($indicadores as $indicador)
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

$smarty->assign('_javascript', array('inicio'));
$smarty->assign('_nombre_pagina', TXT_INICIO);
$plantilla = 'inicio/inicio.tpl';
