<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: entidad_editar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edición de entidades existentes
//---------------------------------------------------------------------------------------------------
//require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;

//$id_entidad = sanitize($_REQUEST['id_entidad'],16);
$id_entidad = filter_input(INPUT_GET | INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
$entidad = new Entidad();

$entidad->load_joined("id = $id_entidad");
$smarty->assign('entidad', $entidad);

$smarty->assign('_nombre_pagina', $entidad->nombre);

// Si vienen todos los datos necesarios del formulario grabamos
//if (isset($_POST['nombre']) and isset($_POST['codigo']) and isset($_POST['id_padre'])) 
if (filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'codigo') && filter_has_var(INPUT_POST, 'id_padre'))
{
//    $nombre = $_POST['nombre'];
    $nombre = filter_input(INPUT_POST, 'nombre');
//    $id_padre = sanitize($_POST['id_padre'], 16);
    $id_padre = filter_input(INPUT_POST, 'id_padre', FILTER_SANITIZE_NUMBER_INT);
//    $web = $_POST['web'] ? sanitize($_POST['web'], 2) : '';
    $web = filter_has_var(INPUT_POST, 'web') ? filter_input(INPUT_POST, 'web', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
//    $codigo = $_POST['codigo'] ? sanitize($_POST['codigo'], 2) : '';
    $codigo = filter_has_var(INPUT_POST, 'codigo') ? filter_input(INPUT_POST, 'codigo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
    if ($entidad->actualizar($id_entidad, $id_padre, $nombre, $web, $codigo))
    {
        $smarty->assign('entidad', $entidad);
        $smarty->assign('aviso', MSG_UNID_EDITADA);
    }
    else
    {
        $smarty->assign('error', ERR_MOD_UNID);
    }
    $plantilla = "entidad_datos.tpl";
    header("location:index.php?page=entidad_datos&id_entidad=$entidad->id");
}
// Si no vienen datos mostramos el formulario
else
{
    $entidades = $entidad->find('id_madre = 1');
    //$entidades = $entidad->find(' WHERE LENGTH(codigo) = 4 ');
    $smarty->assign('entidades', $entidades);
    $plantilla = 'entidad_editar.tpl';
}


