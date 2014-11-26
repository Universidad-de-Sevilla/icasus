<?php

// -----------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: formulario_usuario.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
// -----------------------------------------------------------------------------------------------
// Descripcion: Formulario para dar de alta o modificar un usuario en el sistema
// -----------------------------------------------------------------------------------------------

require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $operario;
global $plantilla;

$smarty->assign('_javascript', array('usuario_validar'));
$smarty->assign('_nombre_pagina', TXT_USER_GESTION);
// Si vienen datos en el formulario lo modificamos
//if (isset($_POST['id_usuario']) || isset($_POST['nif']) || isset($_POST["nombre"]) ||
//        isset($_POST["apellidos"]) || isset($_POST["login"]) || isset($_POST["clave"]))   
if (filter_has_var(INPUT_POST, 'id_usuario') || filter_has_var(INPUT_POST, 'nif') || filter_has_var(INPUT_POST, 'nombre') ||
        filter_has_var(INPUT_POST, 'apellidos') || filter_has_var(INPUT_POST, 'login') || filter_has_var(INPUT_POST, 'clave'))
{
    //este condicional es para evitar que editen otros lo datos de otros usuario
//    if ($operario->id_usuario == $_POST['id_usuario'])
    if ($operario->id_usuario == filter_input(INPUT_POST, 'id_usuario'))
    {
        // Modifica en la base de datos un usuario que ya existía
//        $id_usuario = sanitize($_POST['id_usuario'], 16);
        $id_usuario = filter_input(INPUT_POST, 'id_usuario', FILTER_SANITIZE_NUMBER_INT);
//        $nombre = sanitize($_POST["nombre"], 2);
        $nombre = filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//        $apellidos = sanitize($_POST["apellidos"], 2);
        $apellidos = filter_input(INPUT_POST, 'apellidos', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//        $nif = sanitize($_POST["nif"], 2);
        $nif = filter_input(INPUT_POST, 'nif', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//        $login = sanitize($_POST["login"], 2);
        $login = filter_input(INPUT_POST, 'login', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//        $clave = sanitize($_POST["clave"], 2);
        $clave = filter_input(INPUT_POST, 'clave', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//        $correo = isset($_POST["correo"]) ? sanitize($_POST["correo"], 2) : '';
        $correo = filter_has_var(INPUT_POST, 'correo') ? filter_input(INPUT_POST, 'correo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
//        $telefono = isset($_POST["correo"]) ? sanitize($_POST["telefono"], 2) : '';
        $telefono = filter_has_var(INPUT_POST, 'telefono') ? filter_input(INPUT_POST, 'telefono', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
        $usuario = new Usuario($basedatos);
        if ($usuario->modificar($id_usuario, $nombre, $apellidos, $nif, $correo, $telefono, $login, $clave))
        {
            $smarty->assign('aviso', MSG_USER_EDITADO);
            $smarty->assign('usuario', $usuario->obtener_datos($id_usuario));
            $smarty->assign('entidades', $usuario->obtener_entidades($id_usuario));
            $smarty->assign('id_operario', $operario->id_usuario);
            $plantilla = "usuario_datos.tpl";
        }
        else
        {
            $error = $usuario->error;
            $smarty->assign('error', $error);
            $smarty->assign('usuario', $usuario->obtener_datos($id_usuario));
            $smarty->assign('entidades', $usuario->obtener_entidades($id_usuario));
            $smarty->assign('id_operario', $operario->id_usuario);
            $plantilla = "usuario_editar.tpl";
        }
    }
    else
    {
        $smarty->assign('error', ERR_USER_EDIT_NO_AUT);
        $plantilla = 'error.tpl';
    }
}

// Si no viene del formulario lo mostramos
//else if (isset($_GET['id_usuario']))
else if (filter_has_var(INPUT_GET, 'id_usuario'))
{
    //este condicional es para evitar que editen otros lo datos de otros usuario
//    if ($operario->id_usuario == $_GET['id_usuario'])
    if ($operario->id_usuario == filter_input(INPUT_GET, 'id_usuario'))
    {
//        $id_usuario = sanitize($_GET['id_usuario'], 16);
        $id_usuario = filter_input(INPUT_GET, 'id_usuario', FILTER_SANITIZE_NUMBER_INT);
        $usuario = new Usuario($basedatos);
        $smarty->assign('usuario', $usuario->obtener_datos($id_usuario));
        $smarty->assign('entidades', $usuario->obtener_entidades($id_usuario));
        $smarty->assign('id_operario', $operario->id_usuario);
        $plantilla = "usuario_editar.tpl";
    }
    else
    {
        $smarty->assign('error', ERR_USER_EDIT_NO_AUT);
        $plantilla = 'error.tpl';
    }
}
// Si no vienen datos suficientes en el post ni el get lanzamos error
else
{
    $smarty->assign('error', ERR_PARAM);
    $plantilla = 'error.tpl';
}

