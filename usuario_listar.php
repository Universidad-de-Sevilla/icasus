<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: usuario_listar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra un listado de usuarios  de la entidad actual o del sistema completo
//---------------------------------------------------------------------------------------------------

require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript', array('ordenatabla'));
$smarty->assign('_nombre_pagina', 'Lista de usuarios');

if (isset($_GET['entidad']))
{ 
	$id_entidad = sanitize($_GET['entidad'],16);
	$entidad = new entidad($basedatos);
	$entidad->obtener_datos($id_entidad);
	$nombre_entidad = $entidad->nombre;
	$lista_usuarios = $entidad->listar_usuarios();
}
else
{
	$usuario = new usuario($basedatos);
	if (isset($_REQUEST['criterio']))
	{
		$criterio = sanitize($_REQUEST['criterio'],2);
		$smarty->assign('criterio', $criterio);
		$where = " WHERE nombre LIKE '%$criterio%' OR apellidos LIKE '%$criterio%' 
			OR correo LIKE '%$criterio%' OR login LIKE '%$criterio%' ";
	}
	else
	{
		$where = " WHERE 1 = 1 ";
	}
	$lista_usuarios = $usuario->listar($where);
}

$smarty->assign('lista_usuarios',$lista_usuarios);
$plantilla = 'usuario_listar.tpl';
?>
