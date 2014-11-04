<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: datos_rebiun_grabar.php
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
global $usuario;
global $plantilla;
$plantilla = "datos_rebiun_grabar.tpl";

$autorizado = false;

$id_valor = filter_input(INPUT_GET | INPUT_POST, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
$id_entidad = filter_input(INPUT_GET | INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
$valor_parcial = filter_input(INPUT_GET | INPUT_POST, 'valor_parcial', FILTER_SANITIZE_NUMBER_FLOAT);

//if (isset($_REQUEST['id_valor']) && isset($_REQUEST['id_entidad']) && isset($_REQUEST['valor_parcial']))
if ($id_valor && $id_entidad && $valor_parcial) {
    //Comprobamos si el usuario es responsable en la unidad donde quiere grabar
    foreach ($usuario->entidades as $usuario_entidad) {
//        if ($usuario_entidad->id_entidad == $_REQUEST['id_entidad'] && $usuario_entidad->id_rol == 1)
        if ($usuario_entidad->id_entidad == $id_entidad && $usuario_entidad->id_rol == 1) {
            $autorizado = true;
        }
    }

    if ($autorizado) {
        $valor = new valor();
//        $id_valor = sanitize($_REQUEST['id_valor'], INT);
        $valor->load("id = $id_valor");
//        $valor->valor_parcial = sanitize($_REQUEST['valor_parcial'], FLOAT);
        $valor->valor_parcial = $valor_parcial;
        $valor->valor = $valor->valor_parcial;
        $valor->id_usuario = $usuario->id;
        $valor->fecha_recogida = date("Y-m-d");
        if ($valor->save()) {
            $smarty->assign("resultado", $valor->valor_parcial);
        }
    }
}

