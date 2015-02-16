<?php

// -----------------------------------------------------------------------------------------------
// proyecto: icasus <https://icasus.forja.rediris.es/>
// archivo: usuario_crear.php
// tipo: controlador
// desarrolladores: juanan ruiz (juanan@us.es), jesús martín (jjmc@us.es)
// -----------------------------------------------------------------------------------------------
// descripcion: formulario para dar de alta un usuario en el sistema
// -----------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript', array('usuario_validar'));
$smarty->assign('_nombre_pagina', TXT_USER_GESTION);

// si vienen los datos necesarios graba en la base de datos un nuevo usuario
//if (isset($_POST["nombre"]) && isset($_POST["apellidos"]) && isset($_POST["login"]) && isset($_POST["clave"]))
if (filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'apellidos') && filter_has_var(INPUT_POST, 'login') && filter_has_var(INPUT_POST, 'clave'))
{
//    $nombre = sanitize($_POST["nombre"], 2);
    $nombre = filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $apellidos = sanitize($_POST["apellidos"], 2);
    $apellidos = filter_input(INPUT_POST, 'apellidos', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $login = sanitize($_POST["login"], 2);
    $login = filter_input(INPUT_POST, 'login', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $clave = sanitize($_POST["clave"], 2);
    $clave = filter_input(INPUT_POST, 'clave', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $nif = isset($_POST["nif"]) ? sanitize($_POST["nif"], 2) : '';
    $nif = filter_has_var(INPUT_POST, 'nif') ? filter_input(INPUT_POST, 'nif', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
//    $correo = isset($_POST["correo"]) ? sanitize($_POST["correo"], 2) : '';
    $correo = filter_has_var(INPUT_POST, 'correo') ? filter_input(INPUT_POST, 'correo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
//    $telefono = isset($_POST["telefono"]) ? sanitize($_POST["telefono"], 2) : '';
    $telefono = filter_has_var(INPUT_POST, 'telefono') ? filter_input(INPUT_POST, 'telefono', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
    $usuario = new Usuario($basedatos);
    $id_usuario = $usuario->crear($login, $clave, $nombre, $apellidos, $nif, $correo, $telefono);
    if ($id_usuario)
    {
        $smarty->assign('aviso', MSG_USER_CREADO);
        $smarty->assign('usuario', $usuario->obtener_datos($id_usuario));
        $plantilla = "usuario_datos.tpl";
    }
    else
    {
        $smarty->assign('error', $usuario->error);
        $smarty->assign('_nombre_pagina', ERR);
        $plantilla = 'error.tpl';
    }
}
// si no vienen datos muestra un formulario vacio para crear un nuevo usuario
else
{
    $plantilla = "usuario_crear.tpl";
}

