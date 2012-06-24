<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_mostrar.php
//---------------------------------------------------------------------------------------------------
// Muestra los datos asociados a una medicion
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

$smarty->assign('_javascript', array('jquery142min'));

if (isset($_REQUEST["id_medicion"]))
{
  $id_medicion = sanitize($_REQUEST["id_medicion"], INT);

  $medicion = new medicion();
  $medicion->load("id = $id_medicion");
  $smarty->assign("medicion",$medicion);

  $indicador = new indicador();
  $indicador->load("id = $medicion->id_indicador");
  $smarty->assign("indicador",$indicador);

  $valor = new valor();
  $valores = $valor->Find_joined_jjmc($id_medicion,$usuario->id);
  $smarty->assign("valores",$valores);
  
	//print_r($valores);
	$indisub = new indicador_subunidad();
	$indisubs = $indisub->find("id_usuario = $usuario->id AND id_indicador = $indicador->id");
	$smarty->assign('indisubs',$indisubs);
  
  $smarty->assign("id_usuario", $usuario->id);
  $smarty->assign("_javascript", array("ordenatabla"));
  $smarty->assign("_nombre_pagina", "Indicador: $indicador->codigo - $indicador->nombre");
  $plantilla = "medicion_editar.tpl";
}
else
{
  $error = "Faltan parámetros para mostrar los datos de la medición";
  header("location:index.php?page=entidad_listar&error=$error");
}
?>

