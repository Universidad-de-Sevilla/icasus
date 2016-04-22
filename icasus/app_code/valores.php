<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: valores.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra una tabla con todas las mediciones de un indicador y sus valores, para poder editarlos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

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

if (isset($id_entidad))
{
    $indicador = new Indicador();
    $indicador->load("id = $id_indicador");
    $smarty->assign('indicador', $indicador);

    //Avanzar entre indicadores/datos
    if ($tipo == "indicador")
    {
        //Proceso del indicador
        $proceso = new Proceso();
        $proceso->load("id = $indicador->id_proceso");
        $smarty->assign('proceso', $proceso);
        //Obtener todos los indicadores del proceso para avanzar o retroceder 
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso=$proceso->id");
        $smarty->assign('_nombre_pagina', FIELD_INDIC . ": $indicador->nombre");
    }
    else
    {
        //Obtener todos los datos para avanzar o retroceder 
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso IS NULL");
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

    $entidad = new Entidad();
    $entidad->load("id = $indicador->id_entidad");
    $smarty->assign('entidad', $entidad);

    $medicion = new Medicion();
    $years = $medicion->find_year_mediciones($id_indicador);
    $smarty->assign('years', $years);

    $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio DESC");
    $smarty->assign('mediciones', $mediciones);

    $subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador, $entidad->id);
    $smarty->assign('subunidades_mediciones', $subunidades_mediciones);

    //Vemos si influye en otros Indicadores/Datos
    $indicadores_dependientes = $logicaIndicador->calcular_influencias($indicador->id);
    $smarty->assign('indicadores_dependientes', $indicadores_dependientes);

    //Si es calculado vemos los Indicadores/Datos de los que depende
    $indicadores_influyentes = $logicaIndicador->calcular_dependencias($id_indicador);
    $smarty->assign("indicadores_influyentes", $indicadores_influyentes);

    $smarty->assign("tipo", $tipo);
    $smarty->assign('_javascript', array('valores'));
    $plantilla = 'valores.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=entidad_listar&error=$error");
}
