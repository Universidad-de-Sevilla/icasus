<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicadores/valores.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra una tabla con todas las mediciones de un indicador y sus valores, para poder editarlos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Procesos
$logicaProceso = new LogicaProceso();
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

    //Permisos del proceso
    $permiso_proceso = $logicaProceso->comprobar_responsable_proceso($usuario->id, $proceso);
    $smarty->assign('permiso_proceso', $permiso_proceso);

    //Responsables
    $responsable = false;
    if ($indicador->id_responsable == $usuario->id || $permiso_proceso)
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

    $medicion = new Medicion();
    $years = $medicion->find_year_mediciones($id_indicador);
    $smarty->assign('years', $years);

    //Simplemente ver si hay mediciones: fijamos un límite de registros
    switch ($indicador->periodicidad)
    {
        //Semestral
        case 'Semestral':
            {
                //Últimos 4 años
                $limite = 8;
                break;
            }
        //Cuatrimestral
        case 'Cuatrimestral':
            {
                //Últimos 4 años
                $limite = 12;
                break;
            }
        //Trimestral
        case 'Trimestral':
            {
                //Últimos 4 años
                $limite = 16;
                break;
            }
        //Mensual
        case 'Mensual':
            {
                //Últimos 2 años
                $limite = 24;
                break;
            }
        //Bienal/Anual
        default:
            {
                //Últimos 4 años
                $limite = 4;
            }
    }

    $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio DESC LIMIT $limite");
    $smarty->assign('mediciones', $mediciones);

    $subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador, $entidad->id, $limite);
    $smarty->assign('subunidades_mediciones', $subunidades_mediciones);

    $smarty->assign('_javascript', array('valores'));
    $smarty->assign('_nombre_pagina', FIELD_INDIC . ": $indicador->nombre");
    $plantilla = 'indicadores/valores.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
