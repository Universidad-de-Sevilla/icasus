<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cartas/carta_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar una Carta de Servicios existente
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_carta') && filter_has_var(INPUT_GET, 'id_entidad') && $control) {
    $id_carta = filter_input(INPUT_GET, 'id_carta', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos de la Carta
    $carta = new Carta();
    if ($carta->load("id = $id_carta")) {
        $smarty->assign('carta', $carta);

        //Cuadro de mando asociado
        $cuadro = new Cuadro();
        $cuadros_cartas = $cuadro->Find("privado = 0 AND id_entidad = $id_entidad");
        $smarty->assign('cuadros_cartas', $cuadros_cartas);
    } else {
        $error = ERR_CARTA_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    $entidad = new Entidad();
    $entidad->load("id=$id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_nombre_pagina', TXT_CARTA_EDIT . ' ' . date("d-m-Y", strtotime($carta->fecha)) . ': ' . $entidad->nombre);
    $plantilla = 'cartas/carta_editar.tpl';
} else {
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
