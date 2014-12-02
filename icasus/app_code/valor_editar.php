<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: formulario_valor.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar valores de un indicador
//---------------------------------------------------------------------------------------------------
require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript', array('valor_validar', 'calcular'));

// Comprobamos si vienen los datos necesarios para editar el valor
//if (isset($_REQUEST['id_indicador']) && isset($_REQUEST['id_entidad']) && isset($_REQUEST['id_valor']))
if (filter_has_var(INPUT_GET, 'id_indicador') && filter_has_var(INPUT_GET, 'id_valor') && filter_has_var(INPUT_GET, 'id_entidad'))
{
//    $id_entidad = sanitize($_REQUEST['id_entidad'], 16);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
//    $id_indicador = sanitize($_REQUEST['id_indicador'], 16);
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
//    $id_valor = sanitize($_REQUEST['id_valor'], 32);
    $id_valor = filter_input(INPUT_GET, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $valor = new ado_valor();
    $valor->load("id_valor = $id_valor");
    $indicador = new ado_indicador();
    $indicador->load("id_indicador = $id_indicador");
    $smarty->assign('valor', $valor);
    $smarty->assign('indicador', $indicador);
    $smarty->assign('id_entidad', $id_entidad);
    $plantilla = 'valor_editar.tpl';
}
else // falta id_indicador o id_entidad
{
    $smarty->assign('error', ERR_PARAM);
    $smarty->assign('_nombre_pagina', ERR);
    $plantilla = 'error.tpl';
}

