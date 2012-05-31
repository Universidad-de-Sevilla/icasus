<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entidad.php
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Controla todas las acciones relacionadas con las entidades
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
	$criterio = sanitize($_REQUEST['criterio']);
	$criterio = " WHERE nombre LIKE '%$criterio%' OR codigo LIKE '%$criterio%'";
	$smarty->assign('criterio', $criterio);
  $entidad = new entidad;
  $entidades = $entidad->Find($criterio);
  $smarty->assign('entidades',$entidades);
}
$smarty->assign('entidades_usuario',$entidades_usuario);
//$smarty->assign('grupos_operario',$grupos_operario);
$plantilla = 'entidad_listar.tpl';
?>
