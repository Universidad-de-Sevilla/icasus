<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: analisis_ajax.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Gestiona los analisis de un indicador
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
$smarty->assign('modulo', $modulo);

$id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
$indicador = new Indicador();
$indicador->load("id=$id_indicador");
$smarty->assign('indicador', $indicador);

//Responsables
$responsable = false;
if ($indicador->id_responsable == $usuario->id)
{
    $responsable = true;
}
$smarty->assign('responsable', $responsable);

$anyo = filter_input(INPUT_GET, 'anyo', FILTER_SANITIZE_NUMBER_INT);
$smarty->assign('anyo', $anyo);

//Recuperamos el análisis del indicador
$analisis = new Analisis();
$analisis->load("id_indicador=$id_indicador AND anyo=$anyo");
$smarty->assign('analisis_actual', $analisis);
$plantilla = 'analisis_ajax.tpl';

if ($modulo === 'grabar_analisis')
{
    $analisis->id_indicador = $id_indicador;
    $analisis->anyo = $anyo;
    $analisis->analisis = filter_input(INPUT_GET, 'texto', FILTER_SANITIZE_STRING);
    $analisis->Save();
}
if ($modulo == 'grabar_plan')
{
    $analisis->id_indicador = $id_indicador;
    $analisis->anyo = $anyo;
    $analisis->plan_accion = filter_input(INPUT_GET, 'texto', FILTER_SANITIZE_STRING);
    $analisis->Save();
}
