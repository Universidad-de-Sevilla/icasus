<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: valor_referencia_ajax.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba de manera asincrona los nuevos valores de referencias y los actualiza desde la 
// plantilla valor_referencia_crear.tpl
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

//$modulo = sanitize($_REQUEST["modulo"], SQL);
$modulo = filter_input(INPUT_GET, 'modulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
$indicador_subunidad = new Indicador_subunidad();
//$db = $vr->DB();

if ($modulo == 'grabar')
{
//    $id = sanitize($_REQUEST["id"], INT);
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
//    $id_usuario = sanitize($_REQUEST["id_usuario"], INT);
    $id_usuario = filter_input(INPUT_POST, 'id_usuario', FILTER_SANITIZE_NUMBER_INT);

    if ($indicador_subunidad->load("id = $id"))
    {
        $indicador_subunidad->id_usuario = $id_usuario;
        $indicador_subunidad->save();
    }
}

