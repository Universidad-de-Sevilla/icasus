<?php

// -----------------------------------------------------------------------------------------------
// proyecto: Icasus <https://icasus.forja.rediris.es/>
// archivo: usuario_crear.php
// tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
// -----------------------------------------------------------------------------------------------
// descripcion: formulario para dar de alta un usuario en el sistema
// -----------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript', array('usuario_validar'));
$smarty->assign('_nombre_pagina', TXT_USER_GESTION);

// si vienen los datos necesarios graba en la base de datos un nuevo usuario
if (filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'apellidos') && filter_has_var(INPUT_POST, 'login') && filter_has_var(INPUT_POST, 'clave'))
{
    $nombre = filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $apellidos = filter_input(INPUT_POST, 'apellidos', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $login = filter_input(INPUT_POST, 'login', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $clave = filter_input(INPUT_POST, 'clave', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $nif = filter_has_var(INPUT_POST, 'nif') ? filter_input(INPUT_POST, 'nif', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
    $correo = filter_has_var(INPUT_POST, 'correo') ? filter_input(INPUT_POST, 'correo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
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

