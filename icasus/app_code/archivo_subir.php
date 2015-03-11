<?php

/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4 */
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: archivo_subir.php
// Tipo: controlador sin plantilla
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Sube un archivo a la carpeta indicada en el POST
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;
global $usuario;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($usuario)) {
    header('Location:index.php?page=login');
}

//subir archivos
//if (isset($_FILES) && isset($_GET['dir'])) 
    if (isset($_FILES) && filter_has_var(INPUT_GET,'dir'))
    {
//    $dir = $_GET['dir'];
    $dir = filter_input(INPUT_GET,'dir');
    if (move_uploaded_file($_FILES['archivo']['tmp_name'], 'upload' . '/' . $dir . '/' . $_FILES ['archivo']['name'])) {
        $aviso = MSG_EXITO_OP;
        header("Location: index.php?page=archivo_listar&dir=$dir&aviso=$aviso");
    } else {
        $error = ERR_ARCHIVO_SUBIR;
        header("Location: index.php?page=error&error=$error");
    }
} else {
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=$error");
}
