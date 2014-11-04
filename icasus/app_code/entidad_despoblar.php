<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entidad_despoblar.php
//---------------------------------------------------------------------------------------------------
// Muestra un listado de usuarios de la unidad para ser desasignados de ella
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;

$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

if (!$id_entidad) {
    $id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
}
// Si vienen datos del formulario asignamos los usuarios marcados a la entidad
//if (isset($_REQUEST['id_entidad']))
if ($id_entidad) {
//  $id_entidad = sanitize($_REQUEST['id_entidad'],INT);

    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);
    $smarty->assign('_nombre_pagina', TXT_BAJA_USERS . ' - ' . $entidad->nombre);

    $usuario_entidad = new Usuario_entidad;
    $usuarios = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign('usuarios', $usuarios);
//  if (isset($_REQUEST["id_usuario"]))
////    if ($id_usuario) 
//    {
//       $id_usuarios = filter_input(INPUT_POST, 'id_usuario');
    $post_array = filter_input_array(INPUT_POST);
    $id_usuarios = $post_array['id_usuario'];
    if ($id_usuarios) {
        $contador = 0;
//       
//        foreach ($_REQUEST['id_usuario'] as $id_usuario) 
        foreach ($id_usuarios as $id_usuario) {
//      $id_usuario = sanitize($id_usuario,INT);
            $id_usuario = filter_var($id_usuario);
            $usuario_entidad->desasignar_usuario($id_entidad, $id_usuario);
            $contador ++;
        }
        $aviso= MSG_UNID_ELIM . ' ' . $contador . ' ' . TXT_USERS;
        header("location:index.php?page=entidad_datos&id_entidad=$id_entidad&aviso=$aviso");
//        $plantilla = 'entidad_datos.tpl';
    } else {
        $plantilla = 'entidad_despoblar.tpl';
    }
} else {
    $error = ERR_PARAM_PAG;
    header("location:index.php?error=$error");
}
