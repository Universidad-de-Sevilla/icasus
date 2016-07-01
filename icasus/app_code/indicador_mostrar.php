<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicador_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//-------------------------------------------------------------------------------
// Muestra la ficha del indicador
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
        //Si es un dato
        if (!$indicador->id_proceso)
        {
            header("Location: index.php?page=dato_mostrar&id_dato=$id_indicador&id_entidad=$indicador->id_entidad");
        }
    }
    else
    {
        $error = ERR_INDIC_MOSTRAR;
        header("location:index.php?error=$error");
    }

    $entidad = new Entidad();
    $entidad->load("id = $indicador->id_entidad");
    $smarty->assign('entidad', $entidad);

    //Proceso del indicador
    $proceso = new Proceso();
    $proceso->load("id = $indicador->id_proceso");
    $smarty->assign('proceso', $proceso);

    //Obtener todos los indicadores del proceso para avanzar o retroceder
    if ($indicador->archivado)
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso=$proceso->id AND archivado is NOT NULL");
    }
    else
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso=$proceso->id AND archivado is NULL");
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

    //Responsables
    $responsable = false;
    if ($indicador->id_responsable == $usuario->id)
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
    $plantilla = 'indicador_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
