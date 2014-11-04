<?php

/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4 */
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: archivo_listar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista el contenido de archivos del directorio indicado y muestra un formulario para 
// subir nuevos archivos
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;
global $usuario;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty)) {
    header('Location:index.php?page=archivo_listar');
}

if (isset($_GET['dir'])) {
    //directorio de trabajo
    $dir = sanitize($_GET['dir'], PARANOID);

    //Creamos el array con los ficheros del directorio
    $directorio = opendir(IC_DIR_BASE . '/upload/' . $dir);
    while ($archivo = readdir($directorio)) {
        $fecha = date("d-m-Y", filemtime(IC_DIR_BASE . '/upload/' . $dir . "/" . $archivo));
        $archivos[] = array($archivo, $fecha);
    }
    closedir($directorio);

    $smarty->assign('archivos', $archivos);
    $smarty->assign('directorio', $dir);
} else {
    $error = ERR_NO_DIR_NAME;
    $smarty->assign('error', $error);
}
$plantilla = "archivo_listar.tpl";
