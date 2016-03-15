<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: archivo_gestionar_ajax.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona los archivos de unidades y procesos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
$tipo = filter_input(INPUT_GET, 'tipo', FILTER_SANITIZE_STRING);

$fichero = new Fichero();
$db = $fichero->DB();

if ($modulo == 'subir')
{
    $extension = pathinfo($_FILES['sarchivo']['name']);
    $ext = $extension["extension"];
    $fichero->titulo = filter_input(INPUT_POST, 'stitulo', FILTER_SANITIZE_STRING);
    $fichero->descripcion = filter_input(INPUT_POST, 'sdescripcion', FILTER_SANITIZE_STRING);
    $fichero->id_objeto = filter_input(INPUT_POST, 'id_objeto', FILTER_SANITIZE_NUMBER_INT);
    $fichero->id_usuario = $usuario->id;
    $fichero->visible = filter_input(INPUT_POST, 'svisible', FILTER_SANITIZE_NUMBER_INT);
    //Vemos si el archivo es para una unidad o para un proceso
    if ($tipo == 'proceso')
    {
        $fichero->tipo_objeto = 'proceso';
    }
    else
    {
        $fichero->tipo_objeto = 'unidad';
    }
    $fichero->extension = $ext;

    //Obtenemos la entidad
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $subdir = "$fichero->id_objeto";
    $dir = IC_DIR_BASE . "private_upload/$fichero->tipo_objeto/";
    //comprobamos si el directorio de la unidad existe.
    if (!file_exists($dir))
    {
        if (!mkdir($dir, 0755))
        {
            $error = ERR_DIR;
            if ($tipo == 'proceso')
            {
                header("Location: index.php?page=archivo_gestionar&id_proceso=$fichero->id_objeto&id_entidad=$id_entidad&error=$error");
            }
            else
            {
                header("Location: index.php?page=archivo_gestionar&id_entidad=$id_entidad&error=$error");
            }
        }
    }
    //comprobamos si el subdirectorio de la unidad existe.
    if (!file_exists($dir . $subdir))
    {
        if (!mkdir($dir . $subdir, 0755))
        {
            $error = ERR_SUBDIR;
            if ($tipo == 'proceso')
            {
                header("Location: index.php?page=archivo_gestionar&id_proceso=$fichero->id_objeto&id_entidad=$id_entidad&error=$error");
            }
            else
            {
                header("Location: index.php?page=archivo_gestionar&id_entidad=$id_entidad&error=$error");
            }
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
            if ($tipo == 'proceso')
            {
                header("Location: index.php?page=archivo_gestionar&id_proceso=$fichero->id_objeto&id_entidad=$id_entidad&exito=$exito");
            }
            else
            {
                header("Location: index.php?page=archivo_gestionar&id_entidad=$id_entidad&exito=$exito");
            }
        }
    }
    else
    {
        $error = ERR_ARCHIVO_GRABAR;
        if ($tipo == 'proceso')
        {
            header("Location: index.php?page=archivo_gestionar&id_proceso=$fichero->id_objeto&id_entidad=$id_entidad&error=$error");
        }
        else
        {
            header("Location: index.php?page=archivo_gestionar&id_entidad=$id_entidad&error=$error");
        }
    }
}

if ($modulo == 'actualizar')
{
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    if ($fichero->load("id =$id"))
    {
        $fichero->titulo = filter_input(INPUT_POST, 'titulo', FILTER_SANITIZE_STRING);
        $fichero->descripcion = filter_input(INPUT_POST, 'descripcion', FILTER_SANITIZE_STRING);
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
