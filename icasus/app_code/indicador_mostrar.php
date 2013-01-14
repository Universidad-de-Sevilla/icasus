<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicador_mostrar.php
//---------------------------------------------------------------------------------------------------
// Muestra todos los parametros de un indicador y un listado de los valores introducidos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (isset($_REQUEST['id_indicador']))
{
	$id_indicador = sanitize($_REQUEST['id_indicador'],16); 
	$indicador = new indicador();
	if ($indicador->load_joined("id = $id_indicador"))
  {
    $smarty->assign('indicador', $indicador);
  }
  else
  {
    $error = "No se puede mostrar el indicador, el identificador no existe en la base de datos.";
    header("location:index.php?error=$error");
  }
	$indicador->load_joined("id = $id_indicador");
	$smarty->assign('indicador', $indicador);
  
	$entidad = new entidad();
	$entidad->load("id = $indicador->id_entidad");
	$smarty->assign('entidad', $entidad);

  //Subunidades asignadas a la medicion de este indicador
  $indicador_subunidad = new indicador_subunidad();
  $indicador_subunidades = $indicador_subunidad->Find_entidades("id_indicador = $id_indicador");
  $smarty->assign("indicador_subunidades", $indicador_subunidades);

  //Simplemente ver si hay mediciones
  $medicion = new medicion();
  $mediciones = $medicion->Find("id_indicador = $id_indicador");
  $smarty->assign("mediciones", $mediciones);
  
	$smarty->assign('_nombre_pagina', "Datos del indicador: " . $indicador->nombre); 
	$plantilla = 'indicador_mostrar.tpl';
}
else
{
	$error = "No se puede mostrar el indicador por falta de parámetros.";
	header("location:index.php?error=$error");
}
?>

