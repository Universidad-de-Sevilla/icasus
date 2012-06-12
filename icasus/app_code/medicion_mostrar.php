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
  $valores = $valor->Find_joined("id_medicion = $id_medicion");
  $smarty->assign("valores",$valores);

  $smarty->assign("_javascript", array("ordenatabla"));
  $smarty->assign("_nombre_pagina", "Indicador: $indicador->codigo - $indicador->nombre");
  $plantilla = "medicion_mostrar.tpl";
}
else
{
  $error = "Faltan parámetros para mostrar los datos de la medición";
  header("location:index.php?page=entidad_listar&error=$error");
}
?>

