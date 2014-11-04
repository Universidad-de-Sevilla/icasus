<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: entidad_datos.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra los datos de una entidad y los usuarios que tiene
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;
global $usuario;

$id_entidad = filter_input(INPUT_GET | INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

//if (isset($_REQUEST['id_entidad']))
if ($id_entidad) {
//	$id_entidad = sanitize($_REQUEST['id_entidad'],INT);
    $entidad = new entidad();
    $entidad->load_joined("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $subentidad = new entidad();
    $subentidades = $subentidad->Find("id_madre = $id_entidad ORDER by codigo");
    $smarty->assign('subentidades', $subentidades);

    $usuario_entidad = new usuario_entidad;
    $usuarios = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign('usuarios', $usuarios);
    $smarty->assign('_nombre_pagina', TXT_UNID.': ' . $entidad->nombre);
    $plantilla = "entidad_datos.tpl";
} else {
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}

