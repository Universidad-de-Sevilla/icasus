<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un indicador
//---------------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $plantilla;

if (isset($_REQUEST['id_indicador']) && isset($_REQUEST['id_entidad']) )
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
	$id_indicador = sanitize($_REQUEST['id_indicador'],16);
	$indicador = new indicador($basedatos);

	if ($indicador->borrar($id_indicador))
	{
		$aviso = 'Se ha borrado el indicador.';
		header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&aviso=$aviso");
	}
	else
	{
		header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$indicador->error");
	}
}
else // falta id_indicador o id_entidad
{
	$smarty->assign('error', 'Faltan parámetros para realizar esta acción.'); 
	$smarty->assign('_nombre_pagina','Error');
	$plantilla = 'error.tpl';
}
?>
