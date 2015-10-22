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
    header("location:index.php?page=entidad_listar&error=$error");
}

$indicador = new Indicador();
$indicador->load("id = $id_indicador");
$smarty->assign('indicador', $indicador);

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
$mediciones = $medicion->Find("id_indicador = $id_indicador ORDER BY periodo_inicio");
$smarty->assign("mediciones", $mediciones);

//array de subunidades con las mediciones y sus valores
$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador, $entidad->id);
$smarty->assign('subunidades_mediciones', $subunidades_mediciones);

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
$smarty->assign('medicion_obj', $medicion_obj);
$smarty->assign('medicion_lim', $medicion_lim);

$smarty->assign('_javascript', array('medicion_listar'));
$smarty->assign('_nombre_pagina', TXT_MED_GESTION . ": $indicador->nombre");
$plantilla = 'medicion_listar.tpl';
