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

//if (isset($_REQUEST['id_entidad']))
if (filter_has_var(INPUT_GET, 'id_entidad'))
{
//	$id_entidad = sanitize($_REQUEST['id_entidad'],INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load_joined("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $subentidad = new Entidad();
    $subentidades = $subentidad->Find("id_madre = $id_entidad ORDER by codigo");
    $smarty->assign('subentidades', $subentidades);

    $usuario_entidad = new Usuario_entidad;
    $usuarios = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign('usuarios', $usuarios);
    $smarty->assign('_nombre_pagina', TXT_UNID_VER . ': ' . $entidad->nombre);
    $plantilla = "entidad_datos.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}

