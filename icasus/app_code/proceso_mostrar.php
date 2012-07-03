<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_listar.php
//---------------------------------------------------------------------------------------------------
// Muestra los datos de un proceso y los indicadores asociados
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $id_entidad;


// Si vienen datos suficientes cargamos proceso con sus indicadores
if (isset($_REQUEST['id_proceso']) AND isset($_REQUEST['id_entidad']))
{
	$id_proceso = sanitize($_REQUEST['id_proceso'],INT);
	$id_entidad = sanitize($_REQUEST['id_entidad'],INT);
  // Datos del proceso
	$proceso = new proceso();
	$proceso->load_joined("id = $id_proceso");
	$smarty->assign('proceso',$proceso);

  //Datos del proceso madre
	$proceso_madre = new proceso();
  $proceso_madre->load("id = $proceso->id_madre");
  $smarty->assign('proceso_madre', $proceso_madre);
  //Datos del propietario
  $propietario = new usuario();
  $propietario->load("id = $proceso->id_propietario");
  $smarty->assign('propietario', $propietario);

  // Listado de subprocesos
  $subprocesos = $proceso->Find_joined("id_madre = $id_proceso");
  $smarty->assign('subprocesos',$subprocesos);
  // Listado de indicadores
	$indicador = new indicador();
	$indicadores = $indicador->Find_joined("id_proceso = $id_proceso");
	$smarty->assign('indicadores',$indicadores);
	
  $smarty->assign('id_entidad',$id_entidad);
	$smarty->assign('_nombre_pagina' , "Ficha de Proceso: " . $proceso->nombre);
	$smarty->assign('_javascript' , array('proceso_borrar'));
	$plantilla = 'proceso_mostrar.tpl';
}
else
{
	//Si se llama a esta pagina si un id de proceso o de entidad se redirecciona al listado de unidades
	header('Location:index.php?page=entidad_listar');	
}
?>
