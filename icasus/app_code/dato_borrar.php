<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_borrar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un dato
//---------------------------------------------------------------------------------------------------
global $usuario;

$id_entidad = filter_input(INPUT_GET | INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
$id_dato = filter_input(INPUT_GET | INPUT_POST, 'id_dato', FILTER_SANITIZE_NUMBER_INT);

//if (isset($_REQUEST['id_dato']) && isset($_REQUEST['id_entidad']) )
if ($id_dato && $id_entidad) {
//	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
//	$id_dato = sanitize($_REQUEST['id_dato'],16);
    $dato = new indicador();
    $dato->load_joined("id = $id_dato");
    // Comprobamos que el usuario es responsable de este indicador para permitirle borrar
    if ($usuario->id == $dato->id_responsable OR $usuario->id == $dato->id_responsable_medicion) {
        $medicion = new medicion();
        $mediciones = $medicion->Find("id_indicador = $id_dato");
        if ($mediciones) {
            $error = ERR_BORRAR_DAT_MED;
            header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
        } else {
            $dato->delete();
            $aviso = MSG_DAT_BORRADO . "$dato->nombre";
            header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&aviso=$aviso");
        }
    } else {
        $error = ERR_BORRAR_DAT_NO_AUT;
        header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
    }
} else { // falta id_dato o id_entidad
    $error = ERR_PARAM;
    header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
}

