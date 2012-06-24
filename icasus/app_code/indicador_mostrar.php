<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicador_mostrar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra todos los parametros de un indicador y un listado de los valores introducidos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$smarty->assign('_javascript' , array('ordenatabla','indicador_borrar','valor_borrar'));

if (isset($_GET['id_indicador']))
{
	$id_indicador = sanitize($_GET['id_indicador'],16); 
	$indicador = new indicador();
 	$indicador->load_joined("id = $id_indicador");
	$smarty->assign('indicador', $indicador);
  
	$entidad = new entidad();
 	$entidad->load("id = $indicador->id_entidad");
	$smarty->assign('entidad', $entidad);

  //Subunidades asignadas a la medicion de este indicador
  $indicador_subunidad = new indicador_subunidad();
  $indicador_subunidades = $indicador_subunidad->Find_entidades("id_indicador = $id_indicador");
  $smarty->assign("indicador_subunidades", $indicador_subunidades);
  
	$smarty->assign('_nombre_pagina', "Datos del indicador: " . $indicador->nombre); 
	$plantilla = 'indicador_mostrar.tpl';
}
else
{
	$error = "No se puede mostrar el indicador por falta de parámetros.";
	header("index.php?error=$error");
}
?>
