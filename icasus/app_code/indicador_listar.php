<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicador_listar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de indicadores para una entidad determinada
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

//if ($_GET['id_entidad'] > '0')
if ($id_entidad > 0)
{
//	$id_entidad = sanitize($_GET["id_entidad"],INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $indicador = new Indicador();
    $indicadores = $indicador->Find_joined("id_entidad = $id_entidad AND id_proceso IS NOT NULL");
    $smarty->assign('indicadores', $indicadores);
    //$smarty->assign('barra_indicadores',$entidad->barra_indicadores()); 
    $smarty->assign('_nombre_pagina', TXT_INDIC_LIST . ': ' . $entidad->nombre);
    $plantilla = 'indicador_listar.tpl';
}
else
{
    $error = ERR_UNID_LIST_INDIC;
    header("location:index.php?page=error&error=$error");
}

