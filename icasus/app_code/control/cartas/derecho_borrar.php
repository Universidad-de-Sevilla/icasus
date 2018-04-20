<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cartas/derecho_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un Derecho de una Carta de Servicios
//---------------------------------------------------------------------------------------------------

global $control;

if (filter_has_var(INPUT_GET, 'id_derecho') && filter_has_var(INPUT_GET, 'id_entidad')) {
    $id_derecho = filter_input(INPUT_GET, 'id_derecho', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del Derecho
    $derecho = new Derecho();
    if ($derecho->load_joined("id = $id_derecho")) {
        $carta = $derecho->carta;
        if ($control) {
            $exito = MSG_DERECHO_BORRADO . " " . $derecho->nombre;
            $derecho->delete();

            header("Location: index.php?page=carta_mostrar&id_carta=$carta->id&id_entidad=$id_entidad&exito=$exito#carta_derechos");
        } else {
            $aviso = MSG_DERECHO_BORRAR;
            header("Location: index.php?page=carta_mostrar&id_carta=$carta->id&id_entidad=$id_entidad&aviso=$aviso#carta_derechos");
        }
    } else {
        $error = ERR_DERECHO_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }
} else {
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=$error");
}
