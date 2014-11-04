<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: csv_importar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Permite subir un fichero para importar datos a la aplicación
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;
global $usuario;

$usuario_entidad = new usuario_entidad();
$id_entidad = filter_input(INPUT_GET | INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

//if (isset($_REQUEST['id_entidad']))
if ($id_entidad) {
//  $id_entidad = sanitize($_REQUEST['id_entidad'], INT);
    if ($usuario_entidad->comprobar_responsable_entidad($usuario->id, $id_entidad)) {
        $smarty->assign('id_entidad', $id_entidad);
        $plantilla = 'csv_importar.tpl';
        $smarty->assign('_nombre_pagina', 'Importar fichero CSV');
    } else {
        $error = ERR_AUT_IMPORT_DAT_UNID;
        header('location:index.php?error=' . $error);
    }
} else {
    $error = ERR_FALTAN_PAR_IMPORT;
    header('location:index.php?error=' . $error);
}

