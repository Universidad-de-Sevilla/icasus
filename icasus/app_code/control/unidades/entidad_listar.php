<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: unidades/entidad_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra un listado de las unidades y los grupos del usuario actual
// Permite buscar cualquier unidad
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

$smarty->assign('_javascript', array('inicio'));
$smarty->assign('_nombre_pagina', TXT_UNIDS_US);

// Entidades de este usuario
$smarty->assign('entidades_usuario', $usuario->entidades);
$grupos_usuario = ""; //Deshabilitado de momento
$smarty->assign('grupos_usuario', $grupos_usuario);

$entidad = new Entidad;
$entidades = $entidad->Find("es_organica = 1");
$smarty->assign('entidades', $entidades);

$plantilla = 'unidades/entidad_listar.tpl';
