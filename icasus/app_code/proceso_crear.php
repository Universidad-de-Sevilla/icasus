<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://forja.rediris.es/projects/icasus/)
// Archivo: proceso_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Creación de nuevos procesos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;
global $id_entidad;

//$id_entidad = sanitize($_REQUEST['id_entidad'],16);
$entidad = new entidad($basedatos);
$datos_entidad = $entidad->obtener_datos($id_entidad);
$smarty->assign('_nombre_pagina',$entidad->datos['nombre']);
$proceso = new proceso();

	$smarty->assign('procesos',$proceso->find('id_entidad='.$id_entidad));
	$smarty->assign('entidad', $datos_entidad);
	$smarty->assign('usuarios', $entidad->listar_usuarios($id_entidad));
	$plantilla = "proceso_crear.tpl";
?>
