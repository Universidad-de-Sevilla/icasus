<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_crear.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Creación de nuevos procesos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (isset($_REQUEST["id_entidad"]))
{
  $id_entidad = sanitize($_REQUEST["id_entidad"],INT);
  $entidad = new entidad();
  $entidad->load("id = $id_entidad");
  $smarty->assign("entidad", $entidad);

  $usuario_entidad = new usuario_entidad;
  $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
  $smarty->assign("usuarios_entidad", $usuarios_entidad);

  $proceso_madre = new proceso();
  $procesos_madre = $proceso_madre->find("id_entidad = $id_entidad");
  $smarty->assign('procesos_madre', $procesos_madre);

  $smarty->assign("_nombre_pagina", "Nuevo proceso - " . $entidad->nombre);
  $plantilla = "proceso_crear.tpl";
}
else
{
  $error = "Faltan parámetros para crear un proceso";
  header("location:index.php?page=entidad_listar");
}
?>
