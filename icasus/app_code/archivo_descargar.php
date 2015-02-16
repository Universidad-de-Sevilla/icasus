<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entidad_poblar.php
//---------------------------------------------------------------------------------------------------
// Muestra un listado de usuarios para ser asignados a una unidad
// Si los usuario ya vienen señalados se graban en la tabla usuario_unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

//if (isset($_REQUEST["id"]))
if (filter_has_var(INPUT_GET, 'id'))
{
//	$id = sanitize($_REQUEST["id"],2);
    $id = filter_input(INPUT_GET, 'id', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

    $a = new Fichero();
    if ($a->load("id = $id"))
    {
        $file = IC_DIR_BASE . "upload/$a->tipo_objeto/$a->id_objeto/archivo_$a->id.$a->extension";
        //echo $file;
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename=' . basename($file));
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        header('Pragma: public');
        header('Content-Length: ' . filesize($file));
        //ob_clean();
        //flush();
        readfile($file);
    }
    else
    {
        $error = ERR_ARCHIVO_NO . " $id.";
        header("location:index.php?error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}

