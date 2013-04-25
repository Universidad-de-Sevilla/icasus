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
if ($modulo == 'subunidades_metrica')
{
	$id_indicador = sanitize($_REQUEST["id_indicador"],2);

	$indicador_subunidad = new indicador_subunidad();
	$indicador_subunidades = $indicador_subunidad->find_entidades("id_indicador = $id_indicador");
	$smarty->assign("indicador_subunidades",$indicador_subunidades);
	$smarty->assign("id_indicador",$id_indicador);

}
if ($modulo == 'mediciones_metrica')
{
	$id_indicador = sanitize($_REQUEST["id_indicador"],2);
	$medicion = new medicion();
	$mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
	$smarty->assign('mediciones' , $mediciones);

}
	$smarty->assign('modulo' , $modulo);
	$smarty->assign('_nombre_pagina' , "Nuevo panel");
	$plantilla = "$tipo.tpl";
?>
