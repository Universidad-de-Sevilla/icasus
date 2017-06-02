<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cartas/servicio_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripción: muestra el formulario que permite crear un nuevo Servicio
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_carta') && $control)
{
    $id_carta = filter_input(INPUT_GET, 'id_carta', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos de la Carta de Servicios
    $carta = new Carta();
    if ($carta->load("id = $id_carta"))
    {
        $smarty->assign('carta', $carta);
    }
    else
    {
        $error = ERR_CARTA_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    $entidad = new Entidad();
    $entidad->load("id=$carta->id_entidad");

    //Validar índice de un Servicio
    $servicio = new Servicio();
    $indices = array();
    $servicios = $servicio->Find("id_carta=$id_carta");
    foreach ($servicios as $serv)
    {
        array_push($indices, $serv->indice);
    }
    $smarty->assign('elementos', $indices);

    $smarty->assign('entidad', $entidad);
    $smarty->assign('_nombre_pagina', TXT_SERVICIO_CREAR . ': ' . FIELD_CARTA . " " . date("d-m-Y", strtotime($carta->fecha)));
    $plantilla = 'cartas/servicio_crear.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
