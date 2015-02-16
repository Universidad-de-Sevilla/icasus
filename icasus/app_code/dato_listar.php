<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: dato_listar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de datos para una entidad determinada
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

//if ($_GET['id_entidad'] > '0')
if ($id_entidad != 0)
{
//	$id_entidad = sanitize($_GET["id_entidad"],INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $dato = new Indicador();
    $datos = $dato->Find_joined("id_entidad = $id_entidad AND id_proceso IS NULL");
    $smarty->assign('datos', $datos);
    $smarty->assign('_nombre_pagina', TXT_DATOS_LIST . ": " . $entidad->nombre);
    $plantilla = 'dato_listar.tpl';
}
else
{
    $error = ERR_UNID;
    header("location:index.php?page=error&error=$error");
}

