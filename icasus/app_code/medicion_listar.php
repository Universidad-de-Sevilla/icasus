<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//-------------------------------------------------------------------------------
// Muestra un listado de las mediciones establecidas para un indicador
//-------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_indicador'))
{
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $tipo = "indicador";
}
else if (filter_has_var(INPUT_GET, 'id_dato'))
{
    $id_indicador = filter_input(INPUT_GET, 'id_dato', FILTER_SANITIZE_NUMBER_INT);
    $tipo = "dato";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}

$indicador = new Indicador();
$indicador->load("id = $id_indicador");
$smarty->assign('indicador', $indicador);

//Avanzar entre indicadores/datos
if ($tipo == "indicador")
{
    //Obtener todos los indicadores para avanzar o retroceder 
    $indicadores = $indicador->Find_joined("id_entidad = $id_entidad AND id_proceso IS NOT NULL");
    $smarty->assign('_nombre_pagina', FIELD_INDIC . ": $indicador->nombre");
}
else
{
    //Obtener todos los datos para avanzar o retroceder 
    $indicadores = $indicador->Find_joined("id_entidad = $id_entidad AND id_proceso IS NULL");
    $smarty->assign('_nombre_pagina', FIELD_DATO . ": $indicador->nombre");
}
$smarty->assign("indicadores", $indicadores);
$cont = 0;
foreach ($indicadores as $ind)
{
    if ($id_indicador == $ind->id)
    {
        $indice = $cont;
        $smarty->assign("indice", $indice);
    }
    $cont++;
}

//Responsables
$responsable = false;
if ($indicador->id_responsable == $usuario->id
        OR $indicador->id_responsable_medicion == $usuario->id)
{
    $responsable = true;
}
$smarty->assign('responsable', $responsable);

//Vemos si influye en otros Indicadores/Datos
$indicadores_dependientes = $logicaIndicador->calcular_influencias($id_indicador);
$smarty->assign('indicadores_dependientes', $indicadores_dependientes);

//Si es calculado vemos los Indicadores/Datos de los que depende
$indicadores_influyentes = $logicaIndicador->calcular_dependencias($id_indicador);
$smarty->assign("indicadores_influyentes", $indicadores_influyentes);

$entidad = new Entidad();
$entidad->load("id = $indicador->id_entidad");
$smarty->assign('entidad', $entidad);
$smarty->assign('tipo', $tipo);

//Simplemente ver si hay mediciones
$medicion = new Medicion();
$mediciones = $medicion->Find("id_indicador = $id_indicador ORDER BY periodo_inicio DESC");
$smarty->assign("mediciones", $mediciones);

//array de subunidades con las mediciones y sus valores
$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador, $entidad->id);
$smarty->assign('subunidades_mediciones', $subunidades_mediciones);

//Totales
$totales = array();
$valor = new Valor();
foreach ($mediciones as $med)
{
    $valores = $valor->Find("id_medicion=$med->id");
    $total = $logicaIndicador->calcular_total($indicador, $valores, $med->etiqueta);
    $totales[$med->id] = $total;
}
$smarty->assign('totales', $totales);

//Si el indicador/dato tiene una periodicidad intranual
if ($indicador->id_tipo_agregacion_temporal != 0)
{
    $totales_anuales = array();
    //Calculamos el total del año en función del tipo de agregación temporal del
    //indicador
    for ($i = $indicador->historicos; $i != idate('Y') + 1; $i++)
    {
        //Lo calculamos para cada unidad del indicador/dato
        foreach ($subunidades_mediciones as $subunidad)
        {
            $totales_anuales[$subunidad->id][$i] = $logicaIndicador->calcular_total_temporal($indicador, $subunidad, $i);
        }
    }
    $smarty->assign('totales_anuales', $totales_anuales);
}

//Control (Status) de valores limite y objetivo
$valor_referencia = new Valor_referencia();
$valor_referencia_medicion = new Valor_referencia_medicion();
//Array que contiene las referencias para cada medicion del indicador
$mediciones_referencias = array();
$medicion_lim = array();
$medicion_obj = array();
$valores_referencia = $valor_referencia->Find("id_indicador = $id_indicador");
if ($valores_referencia)
{
    foreach ($mediciones as $med)
    {
        foreach ($valores_referencia as $valor_referencia)
        {
            $existe = $valor_referencia_medicion->Load("id_valor_referencia=$valor_referencia->id AND id_medicion=$med->id");
            if (!$existe)
            {
                $valor_referencia_medicion = new Valor_referencia_medicion();
                $valor_referencia_medicion->id_valor_referencia = $valor_referencia->id;
                $valor_referencia_medicion->id_medicion = $med->id;
                $valor_referencia_medicion->save();
            }
        }
        $mediciones_referencias[$med->id] = $valor_referencia_medicion->Find_joined("id_medicion=$med->id");
        foreach ($mediciones_referencias[$med->id] as $valores_referencia_medicion)
        {
            if ($valores_referencia_medicion)
            {
                //Es la referencia Limite
                if (strpos($valores_referencia_medicion->valor_referencia->etiqueta, 'mite') !== false)
                {
                    $medicion_lim[$med->id] = $valores_referencia_medicion->valor;
                }
                //Es la referencia Objetivo
                if (strpos($valores_referencia_medicion->valor_referencia->etiqueta, 'bjetivo') !== false)
                {
                    $medicion_obj[$med->id] = $valores_referencia_medicion->valor;
                }
            }
        }
    }
    //Si el indicador/dato tiene una periodicidad intranual
    if ($indicador->id_tipo_agregacion_temporal != 0)
    {
        $ref_anuales = array();
        //Calculamos el total del valor de referencia en función del tipo de 
        //agregación temporal del indicador
        for ($i = $indicador->historicos; $i != idate('Y') + 1; $i++)
        {
            $ref_anuales_lim[$i] = $logicaIndicador->calcular_ref_anual($indicador, $valores_referencia, $i, 'mite');
            $ref_anuales_obj[$i] = $logicaIndicador->calcular_ref_anual($indicador, $valores_referencia, $i, 'bjetivo');
        }
        $smarty->assign('ref_anuales_lim', $ref_anuales_lim);
        $smarty->assign('ref_anuales_obj', $ref_anuales_obj);
    }
}

$smarty->assign('medicion_obj', $medicion_obj);
$smarty->assign('medicion_lim', $medicion_lim);

$smarty->assign('_javascript', array('medicion_listar'));
$plantilla = 'medicion_listar.tpl';
