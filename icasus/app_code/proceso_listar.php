<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_listar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los procesos definidos en esta unidad
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;

if (isset($_REQUEST["id_entidad"]))
{
  $id_entidad = sanitize($_REQUEST["id_entidad"], INT);
  $entidad = new entidad();
  $entidad->load("id =  $id_entidad");
  $smarty->assign('entidad', $entidad);

  $proceso = new proceso();
  $procesos = $proceso->Find_joined("id_entidad = $id_entidad");
  $smarty->assign('procesos',$procesos);

  $smarty->assign('_javascript' , array('ordenatabla','proceso_borrar'));
  $smarty->assign('_nombre_pagina' , "Lista de Procesos - " . $entidad->nombre);
  $plantilla = 'proceso_listar.tpl';
}
else
{
  $error = "Faltan parámetros para mostrar el listado de procesos";
  header("location:index.php?page=entidad_listar&error=$error");
}
?>
