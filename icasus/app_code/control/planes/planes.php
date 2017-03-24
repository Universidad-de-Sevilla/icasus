<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: planes/planes.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista todos los planes estratégicos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

//Planes
$planes = $plan->Find_joined("1=1 ORDER BY anyo_inicio DESC");
$smarty->assign('planes', $planes);

//Objetivos operacionales bajo la responsabilidad del usuario
$objop = new ObjetivoOperacional();
$objops = $objop->Find_joined("id_responsable = $usuario->id");
$smarty->assign('objops_propios', $objops);

//Años de ejecución de los objetivos operacionales
$ejecucion = new Ejecucion();
$objops_anyos = array();
foreach ($objops_propios as $obj)
{
    $objops_anyos[$obj->id] = array();
    $ejecuciones = $ejecucion->Find("id_objop=$obj->id order by anyo");
    foreach ($ejecuciones as $ejec)
    {
        if ($ejec->activo)
        {
            array_push($objops_anyos[$obj->id], $ejec->anyo);
        }
    }
}
$smarty->assign('objops_anyos', $objops_anyos);

//Unidades de los objetivos operacionales
$objop_unidad = new ObjetivoUnidad();
$objops_unids = array();
foreach ($objops_propios as $obj)
{
    $objops_unids[$obj->id] = $objop_unidad->Find("id_objop=$obj->id");
}
$smarty->assign('objops_unids', $objops_unids);

$smarty->assign('_javascript', array('plan_listar'));
$smarty->assign('_nombre_pagina', TXT_PLANES_US);
$plantilla = 'planes/planes.tpl';
