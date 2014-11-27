<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un indicador
//---------------------------------------------------------------------------------------------------

$id_indicador = filter_input(INPUT_GET | INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
$id_entidad = filter_input(INPUT_GET | INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

//if (isset($_REQUEST['id_indicador']) && isset($_REQUEST['id_entidad']) )
if ($id_entidad && $id_indicador) {
//	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
//	$id_indicador = sanitize($_REQUEST['id_indicador'],16);
    $indicador = new Indicador();
    $indicador->load_joined("id = $id_indicador");
    if ($usuario->id == $indicador->id_responsable OR $usuario->id == $indicador->id_responsable_medicion) {
        $medicion = new Medicion();
        $mediciones = $medicion->Find("id_indicador = $id_indicador");
        if ($mediciones) {
            $error = ERR_INDIC_BORRAR_MED;
            header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
        } else {
            $indicador->delete();
            $aviso = MSG_INDIC_BORRADO;
            header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&aviso=$aviso");
        }
    } else {
        $error = ERR_INDIC_BORRAR_NO_AUT;
        header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
    }
} else { // falta id_indicador o id_entidad
    $error = ERR_PARAM;
    header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
}

