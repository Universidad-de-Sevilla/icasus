<?php
$modulo = sanitize($_REQUEST["modulo"],SQL);
$tipo = sanitize($_REQUEST["page"],SQL);

$panel_tipo = new Panel_tipo();
$panel_tipo->load("clase_css = '$tipo'");
$smarty->assign('panel' , $panel_tipo);

$periodo = new Periodo();
$periodos = $periodo->Find("1 = 1");
$smarty->assign("periodos", $periodos);

$smarty->assign('modulo' , $modulo);
$smarty->assign('_nombre_pagina' , "Nuevo panel");
$plantilla = "$tipo.tpl";

if ($modulo == 'inicio')
{
	$id_entidad = sanitize($_REQUEST["id_entidad"],2);

	$indicador = new Indicador();
	$indicadores = $indicador->find("id_entidad = $id_entidad");
	$smarty->assign('indicadores' , $indicadores);

	$smarty->assign('id_entidad' , $id_entidad);
}

if ($modulo == 'fecha_fin')
{
	$fecha_inicio = sanitize($_REQUEST["fecha_inicio"],2);
	$smarty->assign('fecha_inicio' , $fecha_inicio);
}

if ($modulo == 'subunidades')
{
	$id_indicador = sanitize($_REQUEST["id_indicador"],2);
	$nombre_indicador = sanitize($_REQUEST["nombre_indicador"],SQL);
	$indicador_subunidad = new Indicador_subunidad();
	$indicador_subunidades = $indicador_subunidad->find_entidades("id_indicador = $id_indicador");
	$smarty->assign("indicador_subunidades",$indicador_subunidades);
	$smarty->assign("id_indicador",$id_indicador);
	$smarty->assign("nombre_indicador",$nombre_indicador);
}
?>
