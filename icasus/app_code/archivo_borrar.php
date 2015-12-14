<?php

/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4 */
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: archivo_borrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un archivo y redirige al listado de nuevo
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;
global $usuario;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
    header('Location:index.php?page=archivo_listar');
}

//if (isset($_GET['fichero']) && isset($_GET['dir']))
    if(filter_has_var(INPUT_GET, 'fichero')&&  filter_has_var(INPUT_GET,'dir'))
{
//    $fichero = sanitize($_GET['fichero'], 2);
//    $dir = sanitize($_GET['dir'], PARANOID);
    
    $fichero = filter_input(INPUT_GET,'fichero',FILTER_SANITIZE_STRING);
    $dir = filter_input(INPUT_GET,'dir',FILTER_SANITIZE_STRING);
    
    unlink(IC_DIR_BASE . '/upload/' . $dir . '/' . $fichero);
    header("Location:index.php?page=archivo_listar&dir=$dir&aviso=".MSG_ARCHIVO_BORRADO);
}
else
{
    $error = ERR_ARCHIVO_BORRAR;
    header("Location:index.php?page=error&error=$error");
}
