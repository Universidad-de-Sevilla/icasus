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
$smarty->assign('_javascript' , array('confirmar_borrar'));

if (isset($_REQUEST['id_usuario']) && isset($_REQUEST['id_entidad']) )
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
	$id_usuario = sanitize($_REQUEST['id_usuario'],16);
	$usuario = new usuario($basedatos);
	$criterio = " WHERE 1 = 1 ";
	$smarty->assign('lista_usuarios' , $usuario->listar($criterio));
	$smarty->assign('_nombre_pagina' , 'Relación de usuarios'); 
	$plantilla = 'usuario_listar.tpl';
	if ($usuario->borrar($id_usuario))
	{
		$smarty->assign('lista_usuarios' , $usuario->listar($criterio));
		$smarty->assign('aviso' , 'Se ha borrado el usuario.');
	}
	else
	{
		$smarty->assign('error', $usuario->error); 
	}
}
else // falta id_indicador o id_entidad
{
	$smarty->assign('error', 'Faltan parámetros para realizar esta acción.'); 
	$smarty->assign('_nombre_pagina','Error');
	$plantilla = 'error.tpl';
}
?>
