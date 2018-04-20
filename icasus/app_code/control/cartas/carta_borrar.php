<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cartas/carta_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra una Carta de Servicios
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_carta') && filter_has_var(INPUT_GET, 'id_entidad')) {
    $id_carta = filter_input(INPUT_GET, 'id_carta', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos de la Carta
    $carta = new Carta();
    if ($carta->load("id = $id_carta")) {
        $servicio = new Servicio();
        $servicios_carta = $servicio->Find("id_carta=$id_carta");
        if (!$servicios_carta && $control) {
            $exito = MSG_CARTA_BORRADA . ' ' . FIELD_CARTA . " " . date("d-m-Y", strtotime($carta->fecha));
            $carta->delete();

            header("Location: index.php?page=carta_listar&id_entidad=$id_entidad&exito=$exito");
        } else {
            $aviso = MSG_CARTA_BORRAR;
            header("Location: index.php?page=carta_mostrar&id_entidad=$id_entidad&id_carta=$id_carta&aviso=$aviso");
        }
    } else {
        $error = ERR_CARTA_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }
} else {
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=$error");
}
