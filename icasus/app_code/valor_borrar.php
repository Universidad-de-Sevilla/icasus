<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: valor_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un valor de un indicador
//---------------------------------------------------------------------------------------------------
require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;

//if (isset($_REQUEST['id_indicador']) && isset($_REQUEST['id_valor']) && isset($_REQUEST['id_entidad']))
if (filter_has_var(INPUT_GET, 'id_indicador') && filter_has_var(INPUT_GET, 'id_valor') && filter_has_var(INPUT_GET, 'id_entidad'))
{
//    $id_entidad = sanitize($_REQUEST['id_entidad'], 16);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
//    $id_indicador = sanitize($_REQUEST['id_indicador'], 16);
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
//    $id_valor = sanitize($_REQUEST['id_valor'], 16);
    $id_valor = filter_input(INPUT_GET, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $valor = new Valor($basedatos);

    // Borra el valor
    if ($valor->borrar($id_valor))
    {
        $aviso = MSG_VAL_BORRADO;
        header("Location: index.php?page=indicador_datos&id_indicador=$id_indicador&id_entidad=$id_entidad&aviso=$aviso");
    }
    else
    {
        $error = $valor->error;
        $smarty->assign('_nombre_pagina', ERR);
        $smarty->assign('error', $error);
        $plantilla = 'error.tpl';
    }
}
else // falta id_indicador o id_entidad
{
    $smarty->assign('error', ERR_PARAM);
    $smarty->assign('_nombre_pagina', ERR);
    $plantilla = 'error.tpl';
}

