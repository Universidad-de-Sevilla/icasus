<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: dato_listar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de datos para una entidad determinada
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if ($_GET['id_entidad'] > '0')
{	
	$id_entidad = sanitize($_GET["id_entidad"],INT);
	$entidad = new entidad();
  $entidad->load("id = $id_entidad");
	$smarty->assign('entidad', $entidad);

  $dato = new indicador();
  $datos = $dato->Find_joined("id_entidad = $id_entidad AND id_proceso IS NULL");
	$smarty->assign('datos',$datos); 
	$smarty->assign('_nombre_pagina' , "Lista de datos: " . $entidad->nombre);
	$plantilla = 'dato_listar.tpl';
}
else
{
	$error = "No ha especificado la entidad cuyos datos desea listar.";
  header("location:index.php?page=error&error=$error");
}
?>
