<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: archivo_gestionar_ajax.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba de manera asincrona los nuevos valores de referencias y los actualiza desde la 
// plantilla valor_referencia_crear.tpl
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

$fichero = new Fichero();
$db = $fichero->DB();

if ($modulo == 'subir')
{
//    $ext = pathinfo($_FILES['sarchivo']['name']);
    $ext = $ext["extension"];
    $fichero->titulo = filter_input(INPUT_POST, 'stitulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $fichero->descripcion = filter_input(INPUT_POST, 'sdescripcion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $fichero->id_objeto = filter_input(INPUT_POST, 'id_objeto', FILTER_SANITIZE_NUMBER_INT);
    $fichero->id_usuario = $usuario->id;
    $fichero->visible = filter_input(INPUT_POST, 'svisible', FILTER_SANITIZE_NUMBER_INT);
    $fichero->tipo_objeto = 'proceso';
    $fichero->extension = $ext;

    //Obtenemos el proceso
    $proceso = new Proceso();
    $proceso->Load("id=$fichero->id_objeto");

    $subdir = "$fichero->id_objeto";
    $dir = IC_DIR_BASE . "upload/$fichero->tipo_objeto/";
    //comprobamos si el directorio de la unidad existe.
    if (!file_exists($dir))
    {
        if (!mkdir($dir, 0755))
        {
            $error = ERR_DIR;
            header("Location: index.php?page=archivo_gestionar&id_proceso=$fichero->id_objeto&id_entidad=$proceso->id_entidad&error=$error");
        }
    }
    //comprobamos si el subdirectorio de la unidad existe.
    if (!file_exists($dir . $subdir))
    {
        if (!mkdir($dir . $subdir, 0755))
        {
            $error = ERR_SUBDIR;
            header("Location: index.php?page=archivo_gestionar&id_proceso=$fichero->id_objeto&id_entidad=$proceso->id_entidad&error=$error");
        }
    }
    //grabamos el archivo
    if ($fichero->save())
    {
        if (!move_uploaded_file($_FILES['sarchivo']['tmp_name'], $dir . $subdir . "/archivo_" . $fichero->id . ".$ext"))
        {
            $fichero->load("id = $fichero->id");
            $fichero->delete();
        }
        else
        {
            $exito = MSG_ARCHIVO_SUBIDA_OK;
            header("location:index.php?page=archivo_gestionar&id_proceso=$fichero->id_objeto&id_entidad=$proceso->id_entidad&exito=$exito");
        }
    }
    else
    {
        $error = ERR_ARCHIVO_GRABAR;
        header("location:index.php?page=archivo_gestionar&id_proceso=$fichero->id_objeto&id_entidad=$proceso->id_entidad&error=$error");
    }
}

if ($modulo == 'actualizar')
{
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    if ($fichero->load("id =$id"))
    {
        $fichero->titulo = filter_input(INPUT_POST, 'titulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
        $fichero->descripcion = filter_input(INPUT_POST, 'descripcion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
        $fichero->id_usuario = $usuario->id;
        $fichero->visible = filter_input(INPUT_POST, 'visible', FILTER_SANITIZE_NUMBER_INT);
        //$db->execute("SET NAMES UTF8");
        $fichero->save();
    }
}

if ($modulo == 'visibilidad')
{
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    if ($fichero->load("id =$id"))
    {
        $fichero->visible = filter_input(INPUT_POST, 'visible', FILTER_SANITIZE_NUMBER_INT);
        //$db->execute("SET NAMES UTF8");
        $fichero->save();
    }
}

if ($modulo == 'borrar')
{
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    if ($fichero->load("id =$id"))
    {
        $fichero->delete();
    }
}
