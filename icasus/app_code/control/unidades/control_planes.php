<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: unidades/control_planes.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Control de los resultados de los Planes Estratégicos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
$smarty->assign("modulo", $modulo);

$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
$entidad = new Entidad();
$entidad->load("id = $id_entidad");
$smarty->assign("entidad", $entidad);

$smarty->assign("objops_propios", $objops_propios);

$ejecucion = new Ejecucion();
$planes = array();
$lineas = array();
$objests = array();
$objops = array();

//------------------------------------------------------------------------------
//---- Muestra todos los datos al inicio del año actual -----------
//------------------------------------------------------------------------------
if ($modulo == 'inicio')
{
    $fecha = date("Y");
}

//------------------------------------------------------------------------------
//---- Muestra datos en función del parámetro fecha -----------
//------------------------------------------------------------------------------
if ($modulo == 'filtrOnlyear')
{
    $fecha = filter_input(INPUT_GET, 'fecha', FILTER_SANITIZE_NUMBER_INT);
}

$ejecuciones_no_res = $ejecucion->Find("anyo=$fecha AND (resultado IS NULL OR resultado LIKE '')");

//Si sólo somos responsables de algunos Objetivos Operacionales pero no de la Unidad
if (!$control && $objops_propios)
{
    foreach ($ejecuciones_no_res as $ejec)
    {
        if ($ejec->id_objop)
        {
            $objop = new ObjetivoOperacional();
            $objop->load_joined("id=$ejec->id_objop");
            if ($objop->objest->linea->plan->id_entidad == $id_entidad)
            {
                array_push($objops, $objop);
            }
        }
    }
}
//Somos responsables de la Unidad
else
{

    foreach ($ejecuciones_no_res as $ejec)
    {
        if ($ejec->id_plan)
        {
            $plan = new Plan();
            $plan->load("id=$ejec->id_plan");
            if ($plan->id_entidad == $id_entidad)
            {
                array_push($planes, $plan);
            }
        }
        if ($ejec->id_linea)
        {
            $linea = new Linea();
            $linea->load_joined("id=$ejec->id_linea");
            if ($linea->plan->id_entidad == $id_entidad)
            {
                array_push($lineas, $linea);
            }
        }
        if ($ejec->id_objest)
        {
            $objest = new ObjetivoEstrategico();
            $objest->load_joined("id=$ejec->id_objest");
            if ($objest->linea->plan->id_entidad == $id_entidad)
            {
                array_push($objests, $objest);
            }
        }
        if ($ejec->id_objop)
        {
            $objop = new ObjetivoOperacional();
            $objop->load_joined("id=$ejec->id_objop");
            if ($objop->objest->linea->plan->id_entidad == $id_entidad)
            {
                array_push($objops, $objop);
            }
        }
    }
}

$smarty->assign("fecha", $fecha);
$smarty->assign("planes", $planes);
$smarty->assign("lineas", $lineas);
$smarty->assign("objests", $objests);
$smarty->assign("objops", $objops);
$smarty->assign('_javascript', array('control_planes'));
$smarty->assign("_nombre_pagina", TXT_CONTROL . " (" . FIELD_PLANES . "): " . $entidad->nombre);
$plantilla = "unidades/control_planes.tpl";
