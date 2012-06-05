<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_crear.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Creación de nuevos procesos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$id_entidad = sanitize($_REQUEST["id_entidad"],INT);
$entidad = new entidad();
$entidad->load("id = $id_entidad");
$smarty->assign("entidad", $entidad);

$proceso = new proceso();
$procesos = $proceso->find("id_entidad = $id_entidad");
$smarty->assign("procesos",$procesos);

$usuario_entidad = new usuario_entidad;
$usuarios_entidades = $usuario_entidad->Find("id_entidad = $id_entidad");
$smarty->assign("usuarios", $usuarios_entidades);

$smarty->assign("_nombre_pagina", $entidad->nombre);
$plantilla = "proceso_crear.tpl";
?>
