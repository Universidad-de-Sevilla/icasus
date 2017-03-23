<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: csv_importar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Permite subir un fichero para importar datos a la aplicación
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

$usuario_entidad = new Usuario_entidad();

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $entidad = new Entidad();
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad->Load("id=$id_entidad");

    if ($usuario_entidad->comprobar_responsable_entidad($usuario->id, $id_entidad))
    {
        $smarty->assign('entidad', $entidad);
        $plantilla = 'unidades/csv_importar.tpl';
        $smarty->assign('_nombre_pagina', TXT_ARCHIVO_IMPORT_CSV);
    }
    else
    {
        $error = ERR_PERMISOS;
        header("location:index.php?page=entidad_mostrar&id_entidad=$id_entidad&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
