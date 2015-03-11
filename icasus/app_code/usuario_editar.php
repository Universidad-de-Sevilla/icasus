<?php

// -----------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: formulario_usuario.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
// -----------------------------------------------------------------------------------------------
// Descripcion: Formulario para dar de alta o modificar un usuario en el sistema
// -----------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $_usuario;
global $plantilla;

$smarty->assign('_javascript', array('usuario_validar'));
$smarty->assign('_nombre_pagina', TXT_USER_GESTION);
// Si vienen datos en el formulario lo modificamos  
if (filter_has_var(INPUT_POST, 'id_usuario') || filter_has_var(INPUT_POST, 'nif') || filter_has_var(INPUT_POST, 'nombre') ||
        filter_has_var(INPUT_POST, 'apellidos') || filter_has_var(INPUT_POST, 'login') || filter_has_var(INPUT_POST, 'clave'))
{
    //este condicional es para evitar que editen otros lo datos de otros usuario
    if ($_usuario->id_usuario == filter_input(INPUT_POST, 'id_usuario'))
    {
        // Modifica en la base de datos un usuario que ya existía
        $id_usuario = filter_input(INPUT_POST, 'id_usuario', FILTER_SANITIZE_NUMBER_INT);
        $nombre = filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
        $apellidos = filter_input(INPUT_POST, 'apellidos', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
        $nif = filter_input(INPUT_POST, 'nif', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
        $login = filter_input(INPUT_POST, 'login', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
        $clave = filter_input(INPUT_POST, 'clave', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
        $correo = filter_has_var(INPUT_POST, 'correo') ? filter_input(INPUT_POST, 'correo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
        $telefono = filter_has_var(INPUT_POST, 'telefono') ? filter_input(INPUT_POST, 'telefono', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
        $usuario = new Usuario($basedatos);
        if ($usuario->modificar($id_usuario, $nombre, $apellidos, $nif, $correo, $telefono, $login, $clave))
        {
            $smarty->assign('aviso', MSG_USER_EDITADO);
            $smarty->assign('usuario', $usuario->obtener_datos($id_usuario));
            $smarty->assign('entidades', $usuario->obtener_entidades($id_usuario));
            $smarty->assign('id_operario', $_usuario->id_usuario);
            $plantilla = "usuario_datos.tpl";
        }
        else
        {
            $error = $usuario->error;
            $smarty->assign('error', $error);
            $smarty->assign('usuario', $usuario->obtener_datos($id_usuario));
            $smarty->assign('entidades', $usuario->obtener_entidades($id_usuario));
            $smarty->assign('id_operario', $_usuario->id_usuario);
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
else if (filter_has_var(INPUT_GET, 'id_usuario'))
{
    //este condicional es para evitar que editen otros lo datos de otros usuario
    if ($_usuario->id_usuario == filter_input(INPUT_GET, 'id_usuario'))
    {
        $id_usuario = filter_input(INPUT_GET, 'id_usuario', FILTER_SANITIZE_NUMBER_INT);
        $usuario = new Usuario($basedatos);
        $smarty->assign('usuario', $usuario->obtener_datos($id_usuario));
        $smarty->assign('entidades', $usuario->obtener_entidades($id_usuario));
        $smarty->assign('id_operario', $_usuario->id_usuario);
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

