<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: valor_referencia_ajax.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Descripcion: Graba de manera asincrona los nuevos valores de referencias y 
// los actualiza desde la plantilla valor_referencia_crear.tpl
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
$vr = new Valor_referencia();
$db = $vr->DB();

if ($modulo == 'editar')
{
    $id = filter_input(INPUT_POST, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $vr->load("id = $id");
    $vr->id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $vr->etiqueta = filter_input(INPUT_POST, 'etiqueta', FILTER_SANITIZE_STRING);
    $vr->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $vr->grafica = filter_input(INPUT_POST, 'grafica', FILTER_SANITIZE_NUMBER_INT);
    $vr->activo = filter_input(INPUT_POST, 'activo', FILTER_SANITIZE_NUMBER_INT);
    $db->execute("SET NAMES UTF8");
    $vr->save();
}
if ($modulo == 'crear')
{
    $vr->id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $vr->etiqueta = filter_input(INPUT_POST, 'etiqueta', FILTER_SANITIZE_STRING);
    $vr->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $vr->grafica = filter_input(INPUT_POST, 'grafica', FILTER_SANITIZE_NUMBER_INT);
    $vr->activo = filter_input(INPUT_POST, 'activo', FILTER_SANITIZE_NUMBER_INT);
    $db->execute("SET NAMES UTF8");
    $vr->save();
}
if ($modulo == 'grafica')
{
    $id = filter_input(INPUT_POST, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $vr->load("id = $id");
    $vr->grafica = filter_input(INPUT_POST, 'grafica', FILTER_SANITIZE_NUMBER_INT);
    $db->execute("SET NAMES UTF8");
    $vr->save();
}
if ($modulo == 'activar')
{
    $id = filter_input(INPUT_POST, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $vr->load("id = $id");
    $vr->activo = filter_input(INPUT_POST, 'activo', FILTER_SANITIZE_NUMBER_INT);
    $db->execute("SET NAMES UTF8");
    $vr->save();
}
