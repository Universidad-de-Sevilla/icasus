<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: planes/objop_ajax.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edita los grados de ejecucion anuales de un objetivo operacional
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
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
$plantilla = 'planes/objop_ajax.tpl';

if ($modulo == 'editar_ejecucion')
{
    $valor = filter_input(INPUT_GET, 'valor', FILTER_VALIDATE_FLOAT);
    $smarty->assign('valor', $valor);
}

if ($modulo == 'grabar_ejecucion')
{
    $valor = filter_input(INPUT_POST, 'valor', FILTER_VALIDATE_FLOAT);
    $resultado = filter_input(INPUT_POST, 'resultado', FILTER_SANITIZE_STRING);
    $ejecucion = new Ejecucion();
    $ejecucion->load("id_objop=$id_objop AND anyo=$anyo");
    $ejecucion->valor = $valor;
    $ejecucion->resultado = $resultado;
    $ejecucion->Save();
    //Actualizamos ejecuciones
    $logicaPlan->actualizar_ejecucion_anual($objop->id_objest, $anyo);
    $logicaPlan->actualizar_ejecucion_global($id_objop);
}

if ($modulo == 'actualizar_porcentaje')
{
    //Obtenemos su ejecución anual
    $ejecucion_anual = new Ejecucion();
    $ejecucion_anual->Load("id_objop=$id_objop AND anyo=$anyo");
    $smarty->assign("ejecucion_anual", $ejecucion_anual->valor);
}

if ($modulo == 'activar_objetivo')
{
    $activo = filter_input(INPUT_GET, 'activo');
    //Obtenemos su ejecución anual
    $ejecucion_anual = new Ejecucion();
    $ejecucion_anual->Load("id_objop=$id_objop AND anyo=$anyo");
    $ejecucion_anual->activo = $activo;
    $ejecucion_anual->Save();
    //Actualizamos ejecuciones
    $logicaPlan->actualizar_ejecucion_anual($objop->id_objest, $anyo);
    $logicaPlan->actualizar_ejecucion_global($id_objop);
}

if ($modulo == 'actualizar_duracion')
{
    //Años de ejecución del objetivo operacional
    $objop_anyos = array();
    $ejecucion = new Ejecucion();
    $ejecuciones = $ejecucion->Find("id_objop=$id_objop order by anyo");
    foreach ($ejecuciones as $ejec)
    {
        if ($ejec->activo)
        {
            array_push($objop_anyos, $ejec->anyo);
        }
    }
    $smarty->assign('objop_anyos', $objop_anyos);
}

if ($modulo == 'editar_resultado' OR $modulo == 'cancelar_resultado')
{
    //Obtenemos su ejecución anual
    $ejecucion_anual = new Ejecucion();
    $ejecucion_anual->Load("id_objop=$id_objop AND anyo=$anyo");
    $smarty->assign("resultado_anual", $ejecucion_anual->resultado);
}
