<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: objop_ajax.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edita los grados de ejecucion anuales de un objetivo operacional
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;
//Variable para operar con los planes
$logicaPlan = new LogicaPlan();

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
$smarty->assign('modulo', $modulo);

$id_objop = filter_input(INPUT_GET, 'id_objop', FILTER_SANITIZE_NUMBER_INT);
$objop = new ObjetivoOperacional();
$objop->load("id=$id_objop");
$smarty->assign('objop', $objop);

$anyo = filter_input(INPUT_GET, 'anyo', FILTER_SANITIZE_NUMBER_INT);
$smarty->assign('anyo', $anyo);
$plantilla = 'objop_ajax.tpl';

if ($modulo == 'grabar_ejecucion')
{
    $valor = filter_input(INPUT_POST, 'valor', FILTER_VALIDATE_FLOAT);
    $ejecucion = new Ejecucion();
    $ejecucion->load("id_objop=$id_objop AND anyo=$anyo");
    $ejecucion->valor = $valor;
    $ejecucion->Save();
    $logicaPlan->actualizar_ejecucion_plan($id_objop, $anyo);
}

if ($modulo == 'actualizar_porcentaje')
{
    //Obtenemos sus ejecución anual
    $ejecucion_anual = new Ejecucion();
    $ejecucion_anual->Load("id_objop=$id_objop AND anyo=$anyo");
    $smarty->assign("ejecucion_anual", $ejecucion_anual->valor);
}

if ($modulo == 'activar_objetivo')
{
    $activo = filter_input(INPUT_GET, 'activo');
    //Obtenemos sus ejecución anual
    $ejecucion_anual = new Ejecucion();
    $ejecucion_anual->Load("id_objop=$id_objop AND anyo=$anyo");
    $ejecucion_anual->activo = $activo;
    $ejecucion_anual->Save();
    $logicaPlan->actualizar_ejecucion_plan($id_objop, $anyo);
}