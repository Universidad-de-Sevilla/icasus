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
	$indicadores = $indicador->find("id_entidad = $id_entidad");
	$smarty->assign('indicadores' , $indicadores);

	$smarty->assign('id_entidad' , $id_entidad);
}
if ($modulo == 'mediciones')
{
		$id_indicador = sanitize($_REQUEST["id_indicador"],2);
		
		$medicion = new medicion();
		$mediciones = $medicion->find("id_indicador = $id_indicador");
		$smarty->assign('mediciones' , $mediciones);

}
	$smarty->assign('modulo' , $modulo);
	$smarty->assign('_nombre_pagina' , "Nuevo panel");
	$plantilla = "$tipo.tpl";
?>
