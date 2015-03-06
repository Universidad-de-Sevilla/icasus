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

//if (isset($_REQUEST['id_entidad']))
if (filter_has_var(INPUT_GET, 'id_entidad'))
{
//  $id_entidad = sanitize($_REQUEST['id_entidad'], INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    if ($usuario_entidad->comprobar_responsable_entidad($usuario->id, $id_entidad))
    {
        $smarty->assign('id_entidad', $id_entidad);
        $plantilla = 'csv_importar.tpl';
        $smarty->assign('_nombre_pagina', TXT_ARCHIVO_IMPORT_CSV);
    }
    else
    {
        $error = ERR_DATO_IMPORT_NO_AUT;
        header('location:index.php?error=' . $error);
    }
}
else
{
    $error = ERR_FALTAN_PAR_IMPORT;
    header('location:index.php?error=' . $error);
}

