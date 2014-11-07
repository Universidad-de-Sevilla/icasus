<?php
$modulo = sanitize($_REQUEST["modulo"],SQL);

if ($modulo == 'periodicidad')
{
	$id_indicador = sanitize($_REQUEST["id_indicador"],2);
	$medicion = new Medicion();
	$mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY etiqueta ASC");
	$smarty->assign('mediciones' , $mediciones);

	$anos = $medicion->find("id_indicador = $id_indicador GROUP BY YEAR(periodo_inicio) ORDER BY periodo_inicio ASC");
	$smarty->assign('anos' , $anos);
}
if ($modulo == 'indicadores_linea')
{
	$cadena = sanitize($_REQUEST["cadena"],SQL);
	$id_entidad = sanitize($_REQUEST["id_entidad"],2);

	$indicador = new Indicador();
	$indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
	$smarty->assign('indicadores' , $indicadores);
	$smarty->assign('id_entidad' , $id_entidad);
}
if ($modulo == 'indicador_barra_base')
{
	$cadena = sanitize($_REQUEST["cadena"],SQL);
	$id_entidad = sanitize($_REQUEST["id_entidad"],2);

	$indicador = new Indicador();
	$indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
	$smarty->assign('indicadores' , $indicadores);
	$smarty->assign('id_entidad' , $id_entidad);
}
if ($modulo == 'indicadores_barra_complementarios')
{
	$cadena = sanitize($_REQUEST["cadena"],SQL);
	$id_entidad = sanitize($_REQUEST["id_entidad"],2);

	$indicador = new Indicador();
	$indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
	$smarty->assign('indicadores' , $indicadores);
	$smarty->assign('id_entidad' , $id_entidad);
}
if ($modulo == 'indicador_tarta')
{
	$cadena = sanitize($_REQUEST["cadena"],SQL);
	$id_entidad = sanitize($_REQUEST["id_entidad"],2);

	$indicador = new Indicador();
	$indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
	$smarty->assign('indicadores' , $indicadores);
	$smarty->assign('id_entidad' , $id_entidad);
}
if ($modulo == 'indicador_metrica')
{
	$cadena = sanitize($_REQUEST["cadena"],SQL);
	$id_entidad = sanitize($_REQUEST["id_entidad"],2);

	$indicador = new Indicador();
	$indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
	$smarty->assign('indicadores' , $indicadores);
	$smarty->assign('id_entidad' , $id_entidad);
}
if ($modulo == 'indicador_subunidades')
{
	$cadena = sanitize($_REQUEST["cadena"],SQL);
	$id_entidad = sanitize($_REQUEST["id_entidad"],2);

	$indicador = new Indicador();
	$indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
	$smarty->assign('indicadores' , $indicadores);
	$smarty->assign('id_entidad' , $id_entidad);
}
$smarty->assign('modulo' , $modulo);
$plantilla = "panel_buscador.tpl";

