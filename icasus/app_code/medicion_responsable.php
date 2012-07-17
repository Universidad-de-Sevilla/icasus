<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_crear.php
//---------------------------------------------------------------------------------------------------
// Muestra la interfaz para programar las mediciones que se van a realizar de un indicador
// Puede hacerse manualmente o utilizando una plantilla que genera las mediciones automaticamente (porhacer)
// Muestra un listado con la unidad y las subunidades para indicar las afectadas
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

if (isset($_REQUEST["id_indicador"]))
{
  $id_indicador = sanitize($_REQUEST["id_indicador"], INT);
	$is = new indicador_subunidad();

	$iss = $is->Find_entidades_responsables($id_indicador,$usuario->id);
	//print_r($iss);
  $smarty->assign("_nombre_pagina", "Responsables de grabación");
	$smarty->assign("indicadores_subunidades",$iss);
	$plantilla = "medicion_responsable.tpl";
}
else
{
  $error = "Faltan datos para procesar la petición de creación de medición";
  header("location:index.php?page=entidad_listar&error=$error");
}
?>
