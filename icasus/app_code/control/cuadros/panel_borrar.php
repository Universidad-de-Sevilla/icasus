<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadros/panel_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra paneles 
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
global $control;

if (filter_has_var(INPUT_POST, 'id_panel'))
{
    $id_panel = filter_input(INPUT_POST, 'id_panel', FILTER_SANITIZE_NUMBER_INT);
    $panel = new Panel();
    $panel->load("id=$id_panel");
    $cuadro = new Cuadro();
    $cuadro->load("id=$panel->id_cuadro");
    if ($cuadro->id_usuario == $usuario->id || $control)
    {
        $panel->borrar_panel("id = $id_panel");
        $smarty->assign('_nombre_pagina', '');
    }
    else
    {
        $smarty->assign('error', ERR_PERMISOS);
    }
}
else
{
    $smarty->assign('error', ERR_PARAM);
}
$plantilla = 'cuadros/panel_borrar.tpl';