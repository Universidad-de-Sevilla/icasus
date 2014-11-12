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
if (isset($_POST['id_usuario']) || isset($_POST['nif']) || isset($_POST["nombre"]) ||
        isset($_POST["apellidos"]) || isset($_POST["login"]) || isset($_POST["clave"]))
{
    //este condicional es para evitar que editen otros lo datos de otros usuario
    if ($operario->id_usuario == $_POST['id_usuario'])
    {
        // Modifica en la base de datos un usuario que ya existía
        $id_usuario = sanitize($_POST['id_usuario'], 16);
        $nombre = sanitize($_POST["nombre"], 2);
        $apellidos = sanitize($_POST["apellidos"], 2);
        $nif = sanitize($_POST["nif"], 2);
        $login = sanitize($_POST["login"], 2);
        $clave = sanitize($_POST["clave"], 2);
        $correo = isset($_POST["correo"]) ? sanitize($_POST["correo"], 2) : '';
        $telefono = isset($_POST["correo"]) ? sanitize($_POST["telefono"], 2) : '';
        $usuario = new Usuario($basedatos);
        if ($usuario->modificar($id_usuario, $nombre, $apellidos, $nif, $correo, $telefono, $login, $clave))
        {
            $smarty->assign('aviso', MSG_USER_EDITED);
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
else if (isset($_GET['id_usuario']))
{
    //este condicional es para evitar que editen otros lo datos de otros usuario
    if ($operario->id_usuario == $_GET['id_usuario'])
    {
        $id_usuario = sanitize($_GET['id_usuario'], 16);
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

