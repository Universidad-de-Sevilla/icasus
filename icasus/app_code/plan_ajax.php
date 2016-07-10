<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: plan_ajax.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra los resúmenes de un plan estratégico
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

$id_plan = filter_input(INPUT_GET, 'id_plan', FILTER_SANITIZE_NUMBER_INT);
$anyo = filter_input(INPUT_GET, 'anyo', FILTER_SANITIZE_NUMBER_INT);
$smarty->assign('anyo', $anyo);

//Obtenemos los datos del plan
$plan = new Plan();
$plan->load("id = $id_plan");
$smarty->assign('plan', $plan);

//Líneas
$linea = new Linea();
$lineas = $linea->Find("id_plan=$id_plan order by indice");
$smarty->assign('lineas', $lineas);

//Objetivos estratégicos
$objest = new ObjetivoEstrategico();
$objests = array();
$objests_lineas = array();
foreach ($lineas as $linea)
{
    $objests = array_merge($objests, $objest->Find_joined("id_linea=$linea->id"));
    $objests_lineas[$linea->id] = $objest->Find("id_linea=$linea->id order by indice");
}
$smarty->assign('objests_lineas', $objests_lineas);

//Objetivos operacionales
$objop = new ObjetivoOperacional();
$objops = array();
$objops_objests = array();
foreach ($objests as $obj)
{
    $objops = array_merge($objops, $objop->Find_joined("id_objest=$obj->id"));
    $objops_objests[$obj->id] = $objop->Find("id_objest=$obj->id order by indice");
}
$smarty->assign('objops_objests', $objops_objests);

if ($anyo)
{
    //Ejecuciones anuales
    $ejecucion = new Ejecucion();
    $ejecucion_lineas = array();
    $ejecucion_objests = array();
    $ejecucion_objops = array();

    //Ejecuciones lineas
    foreach ($lineas as $linea)
    {
        if ($ejecucion->Load("id_linea=$linea->id AND anyo=$anyo"))
        {
            $ejecucion_lineas[$linea->id] = $ejecucion->valor;
        }
        else
        {
            $ejecucion_lineas[$linea->id] = 0;
        }
    }
    $smarty->assign("ejecucion_lineas", $ejecucion_lineas);

    //Ejecuciones objetivos estratégicos
    foreach ($objests as $objest)
    {
        if ($ejecucion->Load("id_objest=$objest->id AND anyo=$anyo"))
        {
            $ejecucion_objests[$objest->id] = $ejecucion->valor;
        }
        else
        {
            $ejecucion_objests[$objest->id] = 0;
        }
    }
    $smarty->assign("ejecucion_objests", $ejecucion_objests);

    //Ejecuciones objetivos operacionales
    foreach ($objops as $objop)
    {
        if ($ejecucion->Load("id_objop=$objop->id AND anyo=$anyo"))
        {
            $ejecucion_objops[$objop->id] = $ejecucion->valor;
        }
        else
        {
            $ejecucion_objops[$objop->id] = 0;
        }
    }
    $smarty->assign("ejecucion_objops", $ejecucion_objops);
}
$plantilla = 'plan_ajax.tpl';