<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: valor_referencia_ajax.php
//------------------------------------------------------------------------------
// Descripcion: Graba de manera asincrona los nuevos valores de referencias y 
// los actualiza desde la plantilla valor_referencia_crear.tpl
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

//$modulo = sanitize($_REQUEST["modulo"], SQL);
$modulo = filter_input(INPUT_GET, 'modulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
$vr = new Valor_referencia();
$db = $vr->DB();

if ($modulo == 'editar')
{
//    $id = sanitize($_REQUEST["id_valor"], INT);
    $id = filter_input(INPUT_POST, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $vr->load("id = $id");
//    $vr->id_indicador = sanitize($_REQUEST["id_indicador"], SQL);
    $vr->id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
//    $vr->etiqueta = sanitize($_REQUEST["etiqueta"], SQL);
    $vr->etiqueta = filter_input(INPUT_POST, 'etiqueta', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $vr->nombre = sanitize($_REQUEST["nombre"], SQL);
    $vr->nombre = filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $vr->grafica = sanitize($_REQUEST["grafica"], INT);
    $vr->grafica = filter_input(INPUT_POST, 'grafica', FILTER_SANITIZE_NUMBER_INT);
//    $vr->activo = sanitize($_REQUEST["activo"], INT);
    $vr->activo = filter_input(INPUT_POST, 'activo', FILTER_SANITIZE_NUMBER_INT);
    $db->execute("SET NAMES UTF8");
    $vr->save();
}
if ($modulo == 'crear')
{
//    $vr->id_indicador = sanitize($_REQUEST["id_indicador"], SQL);
    $vr->id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
//    $vr->etiqueta = sanitize($_REQUEST["etiqueta"], SQL);
    $vr->etiqueta = filter_input(INPUT_POST, 'etiqueta', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $vr->nombre = sanitize($_REQUEST["nombre"], SQL);
    $vr->nombre = filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $vr->grafica = sanitize($_REQUEST["grafica"], SQL);
    $vr->grafica = filter_input(INPUT_POST, 'grafica', FILTER_SANITIZE_NUMBER_INT);
//    $vr->activo = sanitize($_REQUEST["activo"], SQL);
    $vr->activo = filter_input(INPUT_POST, 'activo', FILTER_SANITIZE_NUMBER_INT);
    $db->execute("SET NAMES UTF8");
    $vr->save();
}
