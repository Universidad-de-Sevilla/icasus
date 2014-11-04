<?php
$modulo = sanitize($_REQUEST["modulo"],SQL);
$id_entidad = sanitize($_REQUEST["id_entidad"],SQL);

$entidad = new Entidad();
$entidad->load("id = $id_entidad");

$subunidades = $entidad->find("id_madre = $id_entidad");
$num_subunidades = count($subunidades);
if ($num_subunidades == 0)
{
	$cadena = "AND e.id = $id_entidad ";
}
else
{
	$cadena = "AND e.id_madre = $id_entidad ";
}
$fecha = date("Y");


//------------------------------------------------------------------------------
//---- Muestra todos los valores NULL al inicio con el año actual    -----------
//------------------------------------------------------------------------------
if ($modulo == 'inicio')
{
	$valor = new Valor();
	$valores = $valor->filtro_onlyear($fecha,$cadena);
  $smarty->assign("valores", $valores);
  $smarty->assign("id_entidad", $id_entidad);
}

//------------------------------------------------------------------------------
//---- Muestra todos los valores NULL en función del parámetro fecha -----------
//------------------------------------------------------------------------------
if ($modulo == 'filtrOnlyear')
{
//	$fecha = sanitize($_REQUEST["fecha"],INT);
	$fecha = filter_input(INPUT_GET|INPUT_POST,'fecha',FILTER_SANITIZE_NUMBER_INT);
	$valor = new Valor();
	$valores = $valor->filtro_onlyear($fecha,$cadena);
  $smarty->assign("valores", $valores);
}
$smarty->assign("modulo", $modulo);
$smarty->assign("_nombre_pagina", "Control:  $entidad->nombre");
$plantilla = "control.tpl";

