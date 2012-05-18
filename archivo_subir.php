<?php
/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4 */
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: archivo_subir.php
// Tipo: controlador sin plantilla
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Sube un archivo a la carpeta indicada en el POST
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;
global $usuario;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($usuario))
{
    header('Location:index.php?page=login');
}

//subir archivos
if (isset($_FILES) && isset($_GET['dir'])) 
{
    $dir = $_GET['dir'];
    if(move_uploaded_file($_FILES[ 'archivo' ][ 'tmp_name' ], 'upload' . '/' . $dir . '/' . $_FILES [ 'archivo' ][ 'name' ]))
    {
        $aviso = "Operación realizada con éxito";
        header("Location: index.php?page=archivo_listar&dir=$dir&aviso=$aviso");
    }
    else
    {
        $error = "No se ha podido subir el archivo consulte al administrador del sistema";
        header("Location: index.php?page=error&error=$error");
    }
}
else
{
    $error = "Faltan parámetros para subir el archivo";
    header("Location: index.php?page=error&error=$error");
}
?>
