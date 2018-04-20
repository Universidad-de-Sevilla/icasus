<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cartas/normativa_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra una Normativa de una Carta de Servicios
//---------------------------------------------------------------------------------------------------

global $control;

if (filter_has_var(INPUT_GET, 'id_normativa') && filter_has_var(INPUT_GET, 'id_entidad')) {
    $id_normativa = filter_input(INPUT_GET, 'id_normativa', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    //Obtenemos los datos de la Normativa
    $normativa = new Normativa();
    if ($normativa->load_joined("id = $id_normativa")) {
        $carta = $normativa->carta;
        if ($control) {
            $exito = MSG_NORMATIVA_BORRADA . " " . $normativa->nombre;
            $normativa->delete();

            header("Location: index.php?page=carta_mostrar&id_carta=$carta->id&id_entidad=$id_entidad&exito=$exito#carta_normativas");
        } else {
            $aviso = MSG_NORMATIVA_BORRAR;

            header("Location: index.php?page=carta_mostrar&id_carta=$carta->id&id_entidad=$id_entidad&aviso=$aviso#carta_normativas");
        }
    } else {
        $error = ERR_NORMATIVA_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }
} else {
    $error = ERR_PARAM;

    header("Location: index.php?page=error&error=$error");
}
