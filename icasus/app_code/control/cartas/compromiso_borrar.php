<?php

global $control;

if (filter_has_var(INPUT_GET, 'id_compromiso') && filter_has_var(INPUT_GET, 'id_entidad')) {
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_compromiso = filter_input(INPUT_GET, 'id_compromiso', FILTER_SANITIZE_NUMBER_INT);
    //Obtenemos los datos del Compromiso
    $compromiso = new Compromiso();
    if ($compromiso->load_joined("id = $id_compromiso")) {
        $servicio = $compromiso->servicio;
        if ($control) {
            $exito = MSG_COMPROMISO_BORRADO . ' C.' . $compromiso->indice . '. ' . $compromiso->nombre;
            $compromiso->delete();

            //Borrado de indicadores asociados
            $compromiso_indicador = new CompromisoIndicador();
            while ($compromiso_indicador->load("id_compromiso = $id_compromiso")) {
                $compromiso_indicador->delete();
            }

            header("Location: index.php?page=servicio_mostrar&id_servicio=$servicio->id&id_entidad=$id_entidad&exito=$exito#servicio_compromisos");
        } else {
            $aviso = MSG_COMPROMISO_BORRAR;
            header("Location: index.php?page=compromiso_mostrar&id_compromiso=$id_compromiso&id_entidad=$id_entidad&aviso=$aviso");
        }
    } else {
        $error = ERR_COMPROMISO_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }
} else {
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=$error");
}
