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

$modulo = sanitize($_REQUEST["modulo"], SQL);
$vr = new Valor_referencia();
$db = $vr->DB();

if ($modulo == 'editar')
{
    $id = sanitize($_REQUEST["id_valor"], INT);
    $vr->load("id = $id");
    $vr->id_indicador = sanitize($_REQUEST["id_indicador"], SQL);
    $vr->etiqueta = sanitize($_REQUEST["etiqueta"], SQL);
    $vr->nombre = sanitize($_REQUEST["nombre"], SQL);
    $vr->grafica = sanitize($_REQUEST["grafica"], INT);
    $vr->activo = sanitize($_REQUEST["activo"], INT);
    $db->execute("SET NAMES UTF8");
    $vr->save();
}
if ($modulo == 'crear')
{
    $vr->id_indicador = sanitize($_REQUEST["id_indicador"], SQL);
    $vr->etiqueta = sanitize($_REQUEST["etiqueta"], SQL);
    $vr->nombre = sanitize($_REQUEST["nombre"], SQL);
    $vr->grafica = sanitize($_REQUEST["grafica"], SQL);
    $vr->activo = sanitize($_REQUEST["activo"], SQL);
    $db->execute("SET NAMES UTF8");
    $vr->save();
}
