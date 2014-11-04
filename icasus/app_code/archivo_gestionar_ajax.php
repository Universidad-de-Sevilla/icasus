<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: valor_referencia_ajax.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba de manera asincrona los nuevos valores de referencias y los actualiza desde la 
// plantilla valor_referencia_crear.tpl
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

$modulo = sanitize($_REQUEST["modulo"], SQL);
$fichero = new Fichero();
$db = $fichero->DB();

if ($modulo == 'subir') {
    $ext = pathinfo($_FILES['sarchivo']['name']);
    $ext = $ext["extension"];
    $fichero->titulo = sanitize($_REQUEST["stitulo"], SQL);
    $fichero->descripcion = sanitize($_REQUEST["sdescripcion"], SQL);
    $fichero->id_objeto = sanitize($_REQUEST["id_objeto"], INT);
    $fichero->id_usuario = $usuario->id;
    $fichero->visible = sanitize($_REQUEST["svisible"], INT);
    $fichero->tipo_objeto = 'proceso';
    $fichero->extension = $ext;

    $subdir = "$fichero->id_objeto";
    $dir = IC_DIR_BASE . "upload/$fichero->tipo_objeto/";
    //comprobamos si el directorio de la unidad existe.
    if (!file_exists($dir)) {
        if (!mkdir($dir, 0755)) {
            $error = ERR_DIR;
            header("location:index.php?page=archivo_gestionar&id_proceso=$fichero->id_objeto&error=$error");
        }
    }
    //comprobamos si el subdirectorio de la unidad existe.
    if (!file_exists($dir . $subdir)) {
        if (!mkdir($dir . $subdir, 0755)) {
            $error = ERR_SUBDIR;
            header("location:index.php?page=archivo_gestionar&id_proceso=$fichero->id_objeto&error=$error");
        }
    }
    //grabamos el archivo
    if ($fichero->save()) {
        if (!move_uploaded_file($_FILES['sarchivo']['tmp_name'], $dir . $subdir . "/archivo_" . $fichero->id . ".$ext")) {
            $fichero->load("id = $fichero->id");
            $fichero->delete();
        } else {
            $aviso = MSG_FILE_CORRECT_UPLOAD;
            header("location:index.php?page=archivo_gestionar&id_proceso=$fichero->id_objeto&aviso=$aviso");
        }
    } else {
        $error = ERR_FILE_RECORD;
        header("location:index.php?page=archivo_gestionar&id_proceso=$fichero->id_objeto&error=$error");
    }
}

if ($modulo == 'actualizar') {
    if ($fichero->load("id = " . sanitize($_REQUEST["id"], INT))) {
        $fichero->titulo = sanitize($_REQUEST["titulo"], SQL);
        $fichero->descripcion = sanitize($_REQUEST["descripcion"], SQL);
        $fichero->id_usuario = $usuario->id;
        $fichero->visible = sanitize($_REQUEST["visible"]);
        //$db->execute("SET NAMES UTF8");
        $fichero->save();
    }
}
if ($modulo == 'borrar') {
    if ($fichero->load("id = " . sanitize($_REQUEST["id"], INT))) {
        $fichero->delete();
    }
}
