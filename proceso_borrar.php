<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: proceso_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un proceso
//---------------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $plantilla;

if (isset($_REQUEST['id_proceso']) && isset($_REQUEST['id_entidad']) )
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
	$id_proceso = sanitize($_REQUEST['id_proceso'],16);
	$proceso = new proceso();

	if ($proceso->borrar($id_proceso))
	{
		$aviso = 'Se ha borrado el proceso.';
		header("Location: index.php?page=proceso_listar&id_entidad=$id_entidad&aviso=$aviso");
	}
	else
	{
		header("Location: index.php?page=proceso_mostrar&id_entidad=$id_entidad&id_proceso=$id_proceso&error=$proceso->error");
	}
}
else // falta id_proceso o id_entidad
{
	$smarty->assign('error', 'Faltan parámetros para realizar esta acción.'); 
	$smarty->assign('_nombre_pagina','Error');
	$plantilla = 'error.tpl';
}
?>
