<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicador_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//-------------------------------------------------------------------------------
// Descripcion: Muestra la ficha de un indicador
//-------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_indicador'))
{
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $indicador = new Indicador();
    if ($indicador->load_joined("id = $id_indicador"))
    {
        $smarty->assign('indicador', $indicador);
    }
    else
    {
        $error = ERR_INDIC_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    $entidad = new Entidad();
    $entidad->load("id = $indicador->id_entidad");
    $smarty->assign('entidad', $entidad);

    //Obtener todos los indicadores para avanzar o retroceder
    if ($indicador->archivado)
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND archivado is NOT NULL");
    }
    else
    {
        if ($indicador->id_proceso)
        {

            $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso=$indicador->id_proceso AND archivado is NULL");
        }
        else
        {
            $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso IS NULL AND archivado is NULL");
        }
    }
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

    //Proceso del indicador
    $proceso = $indicador->proceso;
    $smarty->assign('proceso', $proceso);

    //Objetivo operacional de indicadores de control
    $objop = new ObjetivoOperacional();
    $objetivo_indicador = new ObjetivoIndicador();
    if ($objetivo_indicador->load("id_indicador=$id_indicador AND control=1"))
    {
        $objop->load("id=$objetivo_indicador->id_objop");
        $smarty->assign('objop', $objop);
    }

    //Responsables
    $responsable = false;
    if ($indicador->id_responsable == $usuario->id || $usuario->id == $proceso->id_propietario)
    {
        $responsable = true;
    }
    $smarty->assign('responsable', $responsable);

    //Vemos si influye en otros Indicadores/Datos
    $indicadores_dependientes = $logicaIndicador->calcular_influencias($id_indicador);
    $smarty->assign('indicadores_dependientes', $indicadores_dependientes);

    //Si es calculado vemos los Indicadores/Datos de los que depende
    $indicadores_influyentes = $logicaIndicador->calcular_dependencias($id_indicador);
    $smarty->assign("indicadores_influyentes", $indicadores_influyentes);

    //Subunidades asignadas a la medicion de este indicador
    $indicador_subunidad = new Indicador_subunidad();
    $indicador_subunidades = $indicador_subunidad->Find_entidades("id_indicador = $id_indicador");
    $smarty->assign("indicador_subunidades", $indicador_subunidades);

    $smarty->assign('_javascript', array('indicador_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_INDIC . ": $indicador->nombre");
    $plantilla = 'indicadores/indicador_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
