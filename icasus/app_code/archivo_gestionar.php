<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entidad_poblar.php
//---------------------------------------------------------------------------------------------------
// Muestra un listado de usuarios para ser asignados a una unidad
// Si los usuario ya vienen señalados se graban en la tabla usuario_unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;


//if (isset($_REQUEST["id_proceso"]) AND isset($_REQUEST["id_entidad"]))
if (isset($_REQUEST["id_proceso"]))
{
	$id_proceso = sanitize($_REQUEST["id_proceso"],2);
	//$id_entidad = sanitize($_REQUEST["id_entidad"],2);

	// Datos del proceso
  $proceso = new proceso();
  $proceso->load_joined("id = $id_proceso");
  $smarty->assign('_nombre_pagina' , 'Archivos del proceso '.$proceso->nombre);
	$smarty->assign('proceso',$proceso);

	$archivo = new fichero();
  $archivos = $archivo->find_joined("id_objeto = $id_proceso");
	$smarty->assign('archivos',$archivos);
	$smarty->assign('_javascript', array('archivo_gestionar'));
	$plantilla = "archivo_gestionar.tpl";	
}
else
{
	//Si se llama a esta pagina si un id de proceso o de entidad se redirecciona al listado de unidades
	header('Location:index.php?page=entidad_listar');	
}
?>
