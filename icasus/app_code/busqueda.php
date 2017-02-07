<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: busqueda.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra los resultados de la búsqueda general
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'texto_buscar'))
{
    $texto = filter_input(INPUT_GET, 'texto_buscar', FILTER_SANITIZE_STRING);
    $smarty->assign('texto', $texto);
    //Para hacer búsqueda case insensitive:
    $textob = strtoupper($texto);

    //Buscar entidades
    $entidad = new Entidad;
    $entidades = $entidad->Find("(upper(nombre) LIKE '%$textob%' OR upper(codigo) LIKE '%$textob%') AND es_organica = 1");
    $smarty->assign('entidades', $entidades);

    //Buscar procesos
    $proceso = new Proceso();
    $procesos = $proceso->Find_joined("upper(nombre) LIKE '%$textob%' OR upper(codigo) LIKE '%$textob%'");
    $smarty->assign('procesos', $procesos);

    //Buscar indicadores/datos
    $indicador = new Indicador();
    $indicadores = $indicador->Find_joined("(upper(nombre) LIKE '%$textob%' OR upper(codigo) LIKE '%$textob%')");
    $smarty->assign('indicadores', $indicadores);

    //Buscar cuadros de mando
    $cuadro = new Cuadro();
    $cuadros_public = $cuadro->Find_joined("upper(nombre) LIKE '%$textob%' AND privado=0");
    $smarty->assign('cuadros_publicos', $cuadros_public);

    //Buscar planes estratégicos
    $plan = new Plan();
    $planes = $plan->Find_joined("upper(titulo) LIKE '%$textob%' OR CAST(anyo_inicio as char) LIKE '%$textob%' OR CAST((anyo_inicio+duracion-1) as char) LIKE '%$textob%'");
    $smarty->assign('planes', $planes);

    //Buscar líneas estratégicas
    $linea = new Linea();
    $lineas = $linea->Find_joined("upper(nombre) LIKE '%$textob%'");
    $smarty->assign('lineas', $lineas);

    //Buscar objetivos estratégicos
    $objest = new ObjetivoEstrategico();
    $objests = $objest->Find_joined("upper(nombre) LIKE '%$textob%'");
    $smarty->assign('objests', $objests);

    //Buscar objetivos operacionales
    $objop = new ObjetivoOperacional();
    $objops = $objop->Find_joined("upper(nombre) LIKE '%$textob%'");
    $smarty->assign('objops', $objops);

    $smarty->assign("_nombre_pagina", TXT_BUSCAR_RESUL . '"' . $texto . '"');
    $plantilla = "busqueda.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
