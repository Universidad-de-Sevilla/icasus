<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cartas/derecho_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar un Derecho existente
//---------------------------------------------------------------------------------------------------

global $control;

if (filter_has_var(INPUT_GET, 'id_derecho') && $control) {
    $id_derecho = filter_input(INPUT_GET, 'id_derecho', FILTER_SANITIZE_NUMBER_INT);
    //Obtenemos los datos del Derecho
    $derecho = new Derecho();
    if ($derecho->load("id = $id_derecho")) {
        $smarty->assign('derecho', $derecho);
    } else {
        $error = ERR_DERECHO_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }
    $id_carta = $derecho->id_carta;
    $carta = new Carta();
    $carta->load("id = $id_carta");
    $smarty->assign('carta', $carta);
    $entidad = new Entidad();
    $entidad->load("id=$carta->id_entidad");
    $smarty->assign('entidad', $entidad);
    $smarty->assign('_nombre_pagina', TXT_DERECHO_EDIT . ': ' . $derecho->nombre);
    $plantilla = 'cartas/derecho_editar.tpl';
} else {
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
