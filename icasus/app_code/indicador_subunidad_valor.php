<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicador_subunidad_valor.php
//---------------------------------------------------------------------------------------------------
// Muestra una tabla con todas las mediciones de un indicador y sus valores, para poder editarlos
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

$id_entidad = sanitize($_REQUEST["id_entidad"], INT);

if (isset($_REQUEST["id_indicador"]))
{
    $id_indicador = sanitize($_REQUEST["id_indicador"], INT);
    $tipo = "indicador";
}
else if (isset($_REQUEST["id_dato"]))
{
    $id_indicador = sanitize($_REQUEST["id_dato"], INT);
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
    // responsable indicador, responsable medicion
    $usuario_entidad = new Usuario_entidad();
    if ($usuario_entidad->load("id_usuario=$usuario->id and id_entidad=$id_entidad and (id_rol=1 or id_rol=2)") || $indicador->id_responsable == $usuario->id || $indicador->id_responsable_medicion == $usuario->id)
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

        $smarty->assign("tipo", $tipo);
        $smarty->assign('_nombre_pagina', TXT_INDIC_SUBUNID_VAL . ": $indicador->nombre");
        $plantilla = 'indicador_subunidad_valor.tpl';
    }
    else
    {
        // El usuario no tiene permisos avisamos error
        $error = ERR_EDIT_INDIC_NO_AUT;
        header("Location:index.php?page=indicador_mostrar&id_indicador=$id_indicador&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=entidad_listar&error=$error");
}
