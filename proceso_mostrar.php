<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: proceso_listar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra los datos de un proceso y los indicadores asociados
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;
global $id_entidad;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
	header("Location:index.php?page=proceso_listar?id_entidad=$id_entidad");	
}

// Si vienen datos suficientes cargamos proceso con sus indicadores
if (isset($_REQUEST['id_proceso']) AND isset($_REQUEST['id_entidad']))
{
	$id_proceso = sanitize($_REQUEST['id_proceso'],2);
    // Datos del proceso
	$proceso = new proceso();
	$proceso->load_joined("id_proceso=$id_proceso");
	$smarty->assign('proceso',$proceso);
    // Listado de subprocesos
    $subprocesos = $proceso->Find_joined("id_madre = $id_proceso");
    $smarty->assign('subprocesos',$subprocesos);
    // Listado de indicadores
	$indicador = new ado_indicador();
	$indicadores = $indicador->Find_joined("id_proceso = $id_proceso");
	$smarty->assign('indicadores',$indicadores);
	
    $smarty->assign('id_entidad',$id_entidad);
	$smarty->assign('_nombre_pagina' , $proceso->nombre);
	$smarty->assign('_javascript' , array('proceso_borrar'));
	$plantilla = 'proceso_mostrar.tpl';
}
else
{
	//Si se llama a esta pagina si un id de proceso o de entidad se redirecciona al listado de unidades
	header('Location:index.php?page=entidad_listar');	
}
?>
