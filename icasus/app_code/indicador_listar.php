<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicador_listar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de indicadores para una entidad determinada
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if ($_GET['id_entidad'] > '0')
{	
	$id_entidad = sanitize($_GET["id_entidad"],INT);
	$entidad = new entidad();
  $entidad->load("id = $id_entidad");
	$smarty->assign('entidad', $entidad);

  $indicador = new indicador();
  $indicadores = $indicador->Find_joined("id_entidad = $id_entidad");
	$smarty->assign('indicadores',$indicadores); 
	//$smarty->assign('barra_indicadores',$entidad->barra_indicadores()); 
	$smarty->assign('_nombre_pagina' , "Lista de indicadores: " . $entidad->nombre);
	$plantilla = 'indicador_listar.tpl';
}
else
{
	$error = "No ha especificado la entidad cuyos indicadores desea listar.";
  header("location:index.php?page=error&error=$error");
}
?>
