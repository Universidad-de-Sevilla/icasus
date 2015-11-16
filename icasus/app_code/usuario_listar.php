<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: usuario_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra un listado de usuarios del sistema completo o resultado de una búsqueda
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$smarty->assign('_nombre_pagina', TXT_USERS);

$usuario = new Usuario();
if (filter_has_var(INPUT_POST, 'criterio'))
{
    $criterio = filter_input(INPUT_POST, 'criterio', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $smarty->assign('criterio', $criterio);
    $where = "nombre LIKE '%$criterio%' OR apellidos LIKE '%$criterio%' OR correo LIKE '%$criterio%' OR login LIKE '%$criterio%' ";
}
else
{
    $where = "1 = 1 ";
}
$usuarios = $usuario->Find($where);

$smarty->assign('usuarios', $usuarios);
$plantilla = 'usuario_listar.tpl';
