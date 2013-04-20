<?php
$modulo = sanitize($_REQUEST["modulo"],SQL);
$tipo = sanitize($_REQUEST["page"],SQL);

$panel_tipo = new panel_tipo();
$panel_tipo->load("clase_css = '$tipo'");
$smarty->assign('panel' , $panel_tipo);

if ($modulo == 'inicio')
{
	$id_entidad = sanitize($_REQUEST["id_entidad"],2);

	$indicador = new indicador();
	$indicadores = $indicador->find("id_entidad = $id_entidad ORDER BY nombre");
	$smarty->assign('indicadores' , $indicadores);

	$smarty->assign('id_entidad' , $id_entidad);
}
if ($modulo == 'mediciones')
{
	$id_indicador = sanitize($_REQUEST["id_indicador"],2);
	
	$medicion = new medicion();
	$mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
	$smarty->assign('mediciones' , $mediciones);
}
/*
if ($modulo == 'fecha_inicio')
{
	$id_indicador = sanitize($_REQUEST["id_indicador"],2);
	
	$medicion = new medicion();
	$mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
	$smarty->assign('mediciones' , $mediciones);
	$smarty->assign('id_indicador' , $id_indicador);
}
if ($modulo == 'fecha_fin')
{
	$id_indicador = sanitize($_REQUEST["id_indicador"],2);
	$id_medicion = sanitize($_REQUEST["id_medicion"],2);
	
	$medicion = new medicion();
	$medicion->load("id = $id_medicion");

	$medition = new medicion();
	$mediciones = $medition->find("id_indicador = $id_indicador AND periodo_inicio >= '$medicion->periodo_inicio' ORDER BY periodo_inicio");
	$smarty->assign('mediciones' , $mediciones);
	$smarty->assign('id_indicador' , $id_indicador);

}
*/
	$smarty->assign('modulo' , $modulo);
	$smarty->assign('_nombre_pagina' , "Nuevo panel");
	$plantilla = "$tipo.tpl";
?>
