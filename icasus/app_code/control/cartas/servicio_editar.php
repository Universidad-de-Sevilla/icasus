<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cartas/servicio_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar un Servicio existente
//---------------------------------------------------------------------------------------------------
global $control;

if (filter_has_var(INPUT_GET, 'id_servicio') && $control) {
    $id_servicio = filter_input(INPUT_GET, 'id_servicio', FILTER_SANITIZE_NUMBER_INT);
    //Obtenemos los datos del Servicio
    $servicio = new Servicio();
    if ($servicio->load("id = $id_servicio")) {
        $smarty->assign('servicio', $servicio);
    } else {
        $error = ERR_SERVICIO_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }
    $id_carta = $servicio->id_carta;
    $carta = new Carta();
    $carta->load("id = $id_carta");
    $smarty->assign('carta', $carta);
    $entidad = new Entidad();
    $entidad->load("id=$carta->id_entidad");
    $smarty->assign('entidad', $entidad);
    //Validar índice de un Servicio
    $indices = array();
    $servicios = $servicio->Find("id_carta=$id_carta");
    foreach ($servicios as $serv) {
        if ($servicio->indice != $serv->indice) {
            array_push($indices, $serv->indice);
        }
    }
    $smarty->assign('elementos', $indices);
    $smarty->assign('_nombre_pagina', TXT_SERVICIO_EDIT . ': S.' . $servicio->indice . '. ' . $servicio->nombre);
    $plantilla = 'cartas/servicio_editar.tpl';
} else {
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
