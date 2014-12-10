<?php

//$modulo = sanitize($_REQUEST["modulo"], SQL);
//$id_entidad = sanitize($_REQUEST["id_entidad"], SQL);

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

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
    $valores = $valor->filtro_onlyear($fecha, $cadena);
    $smarty->assign("valores", $valores);
    $smarty->assign("id_entidad", $id_entidad);
}

//------------------------------------------------------------------------------
//---- Muestra todos los valores NULL en función del parámetro fecha -----------
//------------------------------------------------------------------------------
if ($modulo == 'filtrOnlyear')
{
//	$fecha = sanitize($_REQUEST["fecha"],INT);
    $fecha = filter_input(INPUT_GET, 'fecha', FILTER_SANITIZE_NUMBER_INT);
    $valor = new Valor();
    $valores = $valor->filtro_onlyear($fecha, $cadena);
    $smarty->assign("valores", $valores);
}

//------------------------------------------------------------------------------
//Desactiva un valor quitándolo de la lista de control
//------------------------------------------------------------------------------

if ($modulo == 'desactivar_valor')
{
//	$fecha = sanitize($_REQUEST["fecha"],INT);
    $id_valor = filter_input(INPUT_GET, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $valor = new Valor();
    $valor->load("id = $id_valor");
    $valor->activo = 0;
    $valor->Save();
}

$smarty->assign("modulo", $modulo);
$smarty->assign("_nombre_pagina", "Control:  $entidad->nombre");
$plantilla = "control.tpl";

