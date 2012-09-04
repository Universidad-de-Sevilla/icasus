<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_responsable.php
//---------------------------------------------------------------------------------------------------
// Permite cambiar la asignación de mediciones a otros usuarios
// Hay que ser responsable de grabación de la subunidad, responsable de grabación del indicador o
// responsable de seguimiento del indicador
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

if (isset($_REQUEST["id_indicador"]))
{
  $id_indicador = sanitize($_REQUEST["id_indicador"], INT);
	$indicador_subunidad = new indicador_subunidad();
	$indicadores_subunidades = $indicador_subunidad->Find_entidades_responsables($id_indicador,$usuario->id);
  $smarty->assign("_nombre_pagina", "Responsables de grabación");
	$smarty->assign("indicadores_subunidades",$indicadores_subunidades);
	$plantilla = "medicion_responsable.tpl";
}
else
{
  $error = "Faltan datos para procesar la petición de creación de medición";
  header("location:index.php?page=entidad_listar&error=$error");
}
?>
