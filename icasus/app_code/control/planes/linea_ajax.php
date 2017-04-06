<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: planes/linea_ajax.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edita los resultados anuales de una línea estratégica
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
$smarty->assign('modulo', $modulo);

$id_linea = filter_input(INPUT_GET, 'id_linea', FILTER_SANITIZE_NUMBER_INT);
$linea = new Linea();
$linea->load("id=$id_linea");
$smarty->assign('linea', $linea);

$anyo = filter_input(INPUT_GET, 'anyo', FILTER_SANITIZE_NUMBER_INT);
$smarty->assign('anyo', $anyo);
$plantilla = 'planes/linea_ajax.tpl';

if ($modulo == 'grabar_resultado')
{
    $resultado = filter_input(INPUT_POST, 'resultado', FILTER_SANITIZE_STRING);
    $ejecucion = new Ejecucion();
    if (!($ejecucion->load("id_linea=$id_linea AND anyo=$anyo")))
    {
        $ejecucion->id_linea = $id_linea;
        $ejecucion->anyo = $anyo;
    }
    $ejecucion->resultado = $resultado;
    $ejecucion->Save();
}

if ($modulo == 'cancelar_resultado')
{
    //Obtenemos su ejecución anual
    $ejecucion_anual = new Ejecucion();
    if ($ejecucion_anual->Load("id_linea=$id_linea AND anyo=$anyo"))
    {
        $resultado_anual = $ejecucion_anual->resultado;
    }
    else
    {
        $resultado_anual = "";
    }
    $smarty->assign("resultado_anual", $resultado_anual);
}
