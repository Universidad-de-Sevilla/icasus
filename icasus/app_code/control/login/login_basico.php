<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: login/login_basico.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Controlador que autentica a los usuarios para entrar al sistema
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
$smarty->assign('_nombre_pagina', TXT_BIENVENIDO);
// Comprueba que vengan los datos
if (filter_has_var(INPUT_POST, 'login') && filter_has_var(INPUT_POST, 'clave')) {
    $login = filter_input(INPUT_POST, 'login', FILTER_SANITIZE_STRING);
    $clave = filter_input(INPUT_POST, 'clave', FILTER_SANITIZE_STRING);
    $usuario = new Usuario();
    if ($usuario->load_joined("login = '$login' AND clave = '$clave'")) {
        $_SESSION['usuario'] = $usuario;
        // Si el usuario tiene unidades asignadas
        if ($usuario->entidades) {
            foreach ($usuario->entidades as $entidad) {
                //Le redirigimos a su unidad principal si la hay
                if ($entidad->principal) {
                    header("location:index.php?page=entidad_mostrar&id_entidad=" . $entidad->entidad->id);
                    exit();
                }
            }
        }
        header("location:index.php");
    } else {
        $error = ERR_LOGIN;
        $smarty->assign('error', $error);
        $plantilla = "login/login_basico.tpl";
    }
} else if (filter_has_var(INPUT_GET, 'logout')) {
    // Si no venía del formulario cerramos sesión y enviamos a inicio
    session_unset();
    session_destroy();
    header("location:index.php");
} else {
    // Si no viene del formulario, ni de logout, mostramos el formulario
    $plantilla = "login/login_basico.tpl";
}
