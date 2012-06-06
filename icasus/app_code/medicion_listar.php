<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_listar.php
//---------------------------------------------------------------------------------------------------
// Muestra un listado de las mediciones establecidas para un indicador
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

if (isset($_REQUEST["id_indicador"]))
{
  $id_indicador = sanitize($_REQUEST["id_indicador"], INT);

  $indicador = new indicador();
  $indicador->load("id = $id_indicador");
  $smarty->assign('indicador',$indicador);


  $medicion = new medicion();
  $mediciones = $medicion->Find("id_indicador = $id_indicador");
  $smarty->assign('mediciones',$mediciones);

  $smarty->assign('_javascript', array('ordenatabla'));
  $smarty->assign('_nombre_pagina', 'Gestión de mediciones');
  $plantilla = 'medicion_listar.tpl';
}
else
{
  $error = "Faltan parámetros para mostrar la lista de mediciones";
  header("location:index.php?page=entidad_listar&error=$error");
}
?>
