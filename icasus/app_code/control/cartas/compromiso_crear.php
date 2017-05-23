<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cartas/compromiso_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripción: muestra el formulario que permite crear un nuevo Compromiso
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_servicio') && $control)
{
    $id_servicio = filter_input(INPUT_GET, 'id_servicio', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del Servicio
    $servicio = new Servicio();
    if ($servicio->load("id = $id_servicio"))
    {
        $smarty->assign('servicio', $servicio);
    }
    else
    {
        $error = ERR_SERVICIO_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    $carta = new Carta();
    $carta->load("id=$servicio->id_carta");
    $smarty->assign('carta', $carta);

    $entidad = new Entidad();
    $entidad->load("id=$carta->id_entidad");
    $smarty->assign('entidad', $entidad);

    //Validar índice de un Compromiso
    $compromiso = new Compromiso();
    $indices = array();
    $compromisos = $compromiso->Find("id_servicio=$id_servicio");
    foreach ($compromisos as $comp)
    {
        array_push($indices, $comp->indice);
    }
    $smarty->assign('elementos', $indices);

    //Indicadores del Compromiso
    $indicador = new Indicador();
    $indicadores = $indicador->Find("id_entidad=$entidad->id AND archivado IS NULL");
    $smarty->assign('indicadores', $indicadores);

    $smarty->assign('_nombre_pagina', TXT_COMPROMISO_CREAR . ': ' . FIELD_SERVICIO . " S." . $servicio->indice . "." . $servicio->nombre);
    $plantilla = 'cartas/compromiso_crear.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
