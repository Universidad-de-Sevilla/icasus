<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: inicio.php
//---------------------------------------------------------------------------------------------------
// Muestra un listado de los indicadores, las mediciones pendientes, las unidades y 
// los grupos del usuario actual
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

$smarty->assign('_javascript', array('ordenatabla'));
$smarty->assign('_nombre_pagina', 'Inicio');

// Indicadores de este usuario
$indicador_subunidad = new indicador_subunidad();
$indicadores_subunidades = $indicador_subunidad->Find_indicadores_con_valores("id_usuario = $usuario->id");
$smarty->assign("indicadores_subunidades",$indicadores_subunidades);

// Entidades de este usuario
$smarty->assign('entidades_usuario',$usuario->entidades);
$grupos_usuario = ""; //Deshabilitado de momento
$smarty->assign('grupos_usuario',$grupos_usuario);

$plantilla = 'inicio.tpl';
?>
