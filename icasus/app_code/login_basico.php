<?php

global $smarty;
global $plantilla;
$smarty->assign('_nombre_pagina', TXT_BIENVENIDO);

// Comprueba que vengan los datos
//if (isset($_POST["login"]) && isset($_POST["clave"]))
if (filter_has_var(INPUT_POST, 'login') && filter_has_var(INPUT_POST, 'clave'))
{
//    $login = sanitize($_POST["login"], 2);
//    $clave = sanitize($_POST["clave"], 2);

    $login = filter_input(INPUT_POST, 'login', FILTER_CALLBACK, array('options' => 'Util::mysqlCleaner'));
    $clave = filter_input(INPUT_POST, 'clave', FILTER_CALLBACK, array('options' => 'Util::mysqlCleaner'));

    $usuario = new Usuario();
    if ($usuario->load_joined("login = '$login' AND clave = '$clave'"))
    {
        $_SESSION['usuario'] = $usuario;
        // Registra la entrada en el log
        $log = new Log();
        $log->add('login', 0, $usuario->id);
        header("location:index.php");
    }
    else
    {
        $error = ERR_LOGIN;
        $smarty->assign('error', $error);
        $plantilla = "login_basico.tpl";
    }
}
//else if (isset($_GET["logout"]))
else if (filter_has_var(INPUT_GET, 'logout'))
{
    // Si no venía del formulario cerramos sesión y enviamos a inicio
    session_unset();
    header("location:index.php");
}
else
{
    // Si no viene del formulario, ni de logout, mostramos el formulario
    $plantilla = "login_basico.tpl";
}
