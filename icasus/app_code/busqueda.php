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
    $indicadores = $indicador->Find_joined("(upper(nombre) LIKE '%$textob%' OR upper(codigo) LIKE '%$textob%') AND id_proceso IS NOT NULL");
    $smarty->assign('indicadores', $indicadores);

    //Buscar datos
    $datos = $indicador->Find_joined("(upper(nombre) LIKE '%$textob%' OR upper(codigo) LIKE '%$textob%') AND id_proceso IS NULL");
    $smarty->assign('datos', $datos);

    //Buscar cuadros de mando
    $cuadro = new Cuadro();
    $cuadros_public = $cuadro->Find("upper(nombre) LIKE '%$textob%' AND privado=0");
    $smarty->assign('cuadros_publicos', $cuadros_public);

    $smarty->assign("_nombre_pagina", TXT_BUSCAR_RESUL . '"' . $texto . '"');
    $plantilla = "busqueda.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}
