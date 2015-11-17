<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: inicio.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra un listado de los indicadores, las mediciones pendientes, las unidades y 
// los grupos del usuario actual
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

// Entidades de este usuario
$smarty->assign('entidades_usuario', $usuario->entidades);

// Indicadores a cargo de este usuario
$indicador = new Indicador();
$indicadores = $indicador->Find("id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id");
$smarty->assign("indicadores", $indicadores);

// Mediciones a cargo de este usuario
//$indicador= new Indicador();
$mediciones_usuario = $indicador->Find_con_pendientes("id IN (SELECT id_indicador FROM indicadores_subunidades WHERE id_usuario=$usuario->id)", $usuario->id);
$smarty->assign("mediciones_usuario", $mediciones_usuario);
//$indicador_subunidad = new indicador_subunidad();
//$indicadores_subunidades = $indicador_subunidad->Find_indicadores_con_valores("id_usuario = $usuario->id");
//$smarty->assign("indicadores_subunidades",$indicadores_subunidades);


$grupos_usuario = ""; //Deshabilitado de momento
$smarty->assign('grupos_usuario', $grupos_usuario);

$smarty->assign('_nombre_pagina', TXT_INICIO);
$plantilla = 'inicio.tpl';
