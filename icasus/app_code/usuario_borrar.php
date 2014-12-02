<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: usuario_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un usuario
//---------------------------------------------------------------------------------------------------
require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $operario;
global $page;
global $plantilla;
$smarty->assign('_javascript', array('confirmar_borrar'));

//if (isset($_REQUEST['id_usuario']) && isset($_REQUEST['id_entidad']))
if (filter_has_var(INPUT_GET, 'id_usuario') && filter_has_var(INPUT_GET, 'id_entidad'))
{
//    $id_entidad = sanitize($_REQUEST['id_entidad'], 16);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
//    $id_usuario = sanitize($_REQUEST['id_usuario'], 16);
    $id_usuario = filter_input(INPUT_GET, 'id_usuario', FILTER_SANITIZE_NUMBER_INT);
    $usuario = new Usuario($basedatos);
    $criterio = " WHERE 1 = 1 ";
    $smarty->assign('lista_usuarios', $usuario->listar($criterio));
    $smarty->assign('_nombre_pagina', TXT_USER_REL);
    $plantilla = 'usuario_listar.tpl';
    if ($usuario->borrar($id_usuario))
    {
        $smarty->assign('lista_usuarios', $usuario->listar($criterio));
        $smarty->assign('aviso', MSG_USER_BORRADO);
    }
    else
    {
        $smarty->assign('error', $usuario->error);
    }
}
else // falta id_indicador o id_entidad
{
    $smarty->assign('error', ERR_PARAM);
    $smarty->assign('_nombre_pagina', ERR);
    $plantilla = 'error.tpl';
}

