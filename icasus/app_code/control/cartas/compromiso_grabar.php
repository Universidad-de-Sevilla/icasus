<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: cartas/compromiso_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea/Edita un Compromiso para un Servicio
//---------------------------------------------------------------------------------------------------

global $usuario;

if (filter_has_var(INPUT_POST, 'indice') && filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'id_servicio')) {
    $id_servicio = filter_input(INPUT_POST, 'id_servicio', FILTER_SANITIZE_NUMBER_INT);
    $servicio = new Servicio();
    $servicio->load_joined("id=$id_servicio");
    $carta = $servicio->carta;
    $compromiso = new Compromiso();
    $exito = MSG_COMPROMISO_CREADO;
    // Si viene el id es que estamos editando un Compromiso existente
    if (filter_has_var(INPUT_POST, 'id_compromiso')) {
        $id_compromiso = filter_input(INPUT_POST, 'id_compromiso', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_COMPROMISO_EDITADO;
        if ($compromiso->load("id = $id_compromiso") == false) {
            $error = ERR_COMPROMISO_EDIT;
            header("Location: index.php?page=error&error=error");
        }

        //Eliminamos los indicadores asociados por si cambian luego
        $compromiso_indicador = new CompromisoIndicador();
        while ($compromiso_indicador->load("id_compromiso = $id_compromiso")) {
            $compromiso_indicador->delete();
        }
    }
    // Guardamos los datos
    $compromiso->id_servicio = $id_servicio;
    $compromiso->indice = filter_input(INPUT_POST, 'indice', FILTER_SANITIZE_NUMBER_INT);
    $compromiso->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $compromiso->descripcion = filter_input(INPUT_POST, 'descripcion', FILTER_SANITIZE_STRING);
    $compromiso->save();
    //Grabamos indicadores/datos del Compromiso
    $post_array = filter_input_array(INPUT_POST);
    $indicadores_compromiso = filter_has_var(INPUT_POST, 'indicadores_compromiso') ? $post_array['indicadores_compromiso'] : array();
    if (count($indicadores_compromiso) > 0) {
        foreach ($indicadores_compromiso as $indicador) {
            $compromiso_indicador = new CompromisoIndicador();
            $compromiso_indicador->id_compromiso = $compromiso->id;
            $compromiso_indicador->id_indicador = filter_var($indicador, FILTER_SANITIZE_NUMBER_INT);
            $compromiso_indicador->save();
        }
    }

    header("Location: index.php?page=compromiso_mostrar&id_entidad=$carta->id_entidad&id_compromiso=$compromiso->id&exito=$exito");
} else {
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=error");
}
