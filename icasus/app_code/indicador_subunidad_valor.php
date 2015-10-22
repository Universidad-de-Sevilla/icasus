<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicador_subunidad_valor.php
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
    header("location:index.php?page=entidad_listar&error=$error");
}

if (isset($id_entidad))
{
    $indicador = new Indicador();
    $indicador->load("id = $id_indicador");
    $smarty->assign('indicador', $indicador);

    // Comprueba permisos para el usuario: responsable unidad, responsable delegado, 
    // responsable indicador
    if ($control || $indicador->id_responsable == $usuario->id)
    {
        $entidad = new Entidad();
        $entidad->load("id = $indicador->id_entidad");
        $smarty->assign('entidad', $entidad);

        $medicion = new Medicion();
        $years = $medicion->find_year_mediciones($id_indicador);
        $smarty->assign('years', $years);

        $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
        $smarty->assign('mediciones', $mediciones);

        $subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador, $entidad->id);
        $smarty->assign('subunidades_mediciones', $subunidades_mediciones);

        //Vemos si influye en otros Indicadores/Datos
        $indicadores_dependientes = $logicaIndicador->calcular_influencias($indicador->id);
        $smarty->assign('indicadores_dependientes', $indicadores_dependientes);

        $smarty->assign("tipo", $tipo);
        $smarty->assign('_javascript', array('indicador_subunidad_valor'));
        $smarty->assign('_nombre_pagina', TXT_VAL_EDIT . ": $indicador->nombre");
        $plantilla = 'indicador_subunidad_valor.tpl';
    }
    else
    {
        // El usuario no tiene permisos avisamos error
        $error = ERR_INDIC_EDIT_NO_AUT;
        header("Location:index.php?page=$tipo _mostrar&id_$tipo=$id_indicador&id_entidad=$id_entidad&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=entidad_listar&error=$error");
}
