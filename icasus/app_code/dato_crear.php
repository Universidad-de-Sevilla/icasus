<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_crear.php
//---------------------------------------------------------------------------------------------------
// Creación de nuevos datos. Son indicadores que usan menos propiedades 
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (isset($_REQUEST["id_entidad"]))
{
  $id_entidad = sanitize($_REQUEST["id_entidad"],INT);
  $entidad = new entidad();
  $entidad->load("id = $id_entidad");
  $smarty->assign("entidad", $entidad);
  $subunidades = $entidad->Find("id_madre = $id_entidad");
  $smarty->assign('subunidades', $subunidades);

  $usuario_entidad = new usuario_entidad;
  $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
  $smarty->assign("usuarios_entidad", $usuarios_entidad);

  $visibilidad = new visibilidad;
  $visibilidades = $visibilidad->Find("1=1");
  $smarty->assign("visibilidades", $visibilidades);

  $smarty->assign("_nombre_pagina", "Nuevo dato - " . $entidad->nombre);
  $plantilla = "dato_crear.tpl";
}
else
{
  $error = "Faltan parámetros para crear un nuevo dato";
  header("location:index.php?error=$error");
}
?>
