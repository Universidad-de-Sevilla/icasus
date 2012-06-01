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
$entidades_usuario = $usuario->entidades;
//$grupos_operario = $operario->obtener_grupos($operario->id_usuario);

//Todas las entidades
if (isset($_REQUEST['criterio']))
{
	$criterio = sanitize($_REQUEST['criterio'], SQL);
	$smarty->assign('criterio', $criterio);
	$condicion = "nombre LIKE '%$criterio%' OR codigo LIKE '%$criterio%'";
  $entidad = new entidad;
  $entidades = $entidad->Find($condicion);
  $smarty->assign('entidades',$entidades);
}
$smarty->assign('entidades_usuario',$entidades_usuario);
//$smarty->assign('grupos_operario',$grupos_operario);
$plantilla = 'entidad_listar.tpl';
?>
