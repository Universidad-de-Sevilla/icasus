<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entidad_listar.php
//---------------------------------------------------------------------------------------------------
// Muestra un listado de las unidades y los grupos del usuario actual
// Permite buscar cualquier unidad
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

$smarty->assign('_javascript', array('ordenatabla'));
$smarty->assign('_nombre_pagina', 'Lista de Unidades');

// Entidades de este usuario
$smarty->assign('entidades_usuario',$usuario->entidades);
$grupos_usuario = ""; //Deshabilitado de momento
$smarty->assign('grupos_usuario',$grupos_usuario);

$entidad = new entidad;
$entidades = $entidad->Find("1 = 1");
$smarty->assign('entidades',$entidades);

/*
if (isset($_REQUEST['criterio']))
{
  $criterio = sanitize($_REQUEST['criterio'], SQL);
  $smarty->assign('criterio', $criterio);
  $condicion = "nombre LIKE '%$criterio%' OR codigo LIKE '%$criterio%'";
  $entidad = new entidad;
  $entidades = $entidad->Find($condicion);
  $smarty->assign('entidades',$entidades);
}
*/

$plantilla = 'entidad_listar.tpl';
?>
