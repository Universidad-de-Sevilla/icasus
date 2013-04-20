<?php
$modulo = sanitize($_REQUEST["modulo"],SQL);

if ($modulo == 'indicador_medicion')
{
	$cadena = sanitize($_REQUEST["cadena"],SQL);
	$id_entidad = sanitize($_REQUEST["id_entidad"],2);

	$indicador = new indicador();
	$indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
	$smarty->assign('indicadores' , $indicadores);
	$smarty->assign('id_entidad' , $id_entidad);
}
if ($modulo == 'indicador_subunidades')
{
	$cadena = sanitize($_REQUEST["cadena"],SQL);
	$id_entidad = sanitize($_REQUEST["id_entidad"],2);

	$indicador = new indicador();
	$indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
	$smarty->assign('indicadores' , $indicadores);
	$smarty->assign('id_entidad' , $id_entidad);
}
$smarty->assign('modulo' , $modulo);
$plantilla = "panel_buscador.tpl";
?>
