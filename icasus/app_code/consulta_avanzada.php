<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: consulta_avanzada.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Consulta a los datos e indicadores, permitiendo hacer operaciones matemáticas sencillas entre ellos.
//  - Genera una tabla de resultados y una gráfica
//  - Permite elegir subunidades
//  - Permite acotar los periodos de medición deseados
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

if ($id_entidad)
{
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign("entidad", $entidad);
    $indicador = new Indicador();
    $indicadores = $indicador->Find("id_entidad = $id_entidad");
    $smarty->assign("indicadores", $indicadores);
    $operaciones = array(
        array('cotejar', '= Cotejar'),
        array('suma', '+ Suma'),
        array('cociente', '/ Cociente'),
        array('porcentaje', '% Porcentaje')
    );
    $smarty->assign("operaciones", $operaciones);
    $smarty->assign("_nombre_pagina", TXT_CONSULT_AVAN);
    $plantilla = "consulta_avanzada.tpl";
}
else
{
    $error = ERR_FALTAN_PARAM_CONSULTA;
    header("location:index.php?page=error&error=$error");
}