<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: analisis.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Muestra los analisis de un indicador
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_indicador') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id=$id_entidad");
    $smarty->assign('entidad', $entidad);

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

    //Obtener todos los indicadores para avanzar o retroceder 
    $indicadores = $indicador->Find_joined("id_entidad = $id_entidad AND id_proceso IS NOT NULL");
    $smarty->assign("indicadores", $indicadores);
    $cont = 0;
    foreach ($indicadores as $ind)
    {
        if ($id_indicador == $ind->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Vemos si influye en otros Indicadores/Datos
    $indicadores_dependientes = $logicaIndicador->calcular_influencias($id_indicador);
    $smarty->assign('indicadores_dependientes', $indicadores_dependientes);

    //Si es calculado vemos los Indicadores/Datos de los que depende
    $indicadores_influyentes = $logicaIndicador->calcular_dependencias($id_indicador);
    $smarty->assign("indicadores_influyentes", $indicadores_influyentes);

    //Recuperamos el análisis del indicador
    $analisis = new Analisis();
    $anyo = idate('Y');
    $smarty->assign('anyo', $anyo);
    $analisis->load("id_indicador=$id_indicador AND anyo=$anyo");
    $smarty->assign('analisis_actual', $analisis);

    $smarty->assign('_javascript', array('analisis'));
    $smarty->assign('_nombre_pagina', TXT_ANALISIS . ": $indicador->nombre");
    $plantilla = 'analisis.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
