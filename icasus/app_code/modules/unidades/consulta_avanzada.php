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

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
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
    $smarty->assign('_javascript', array('consulta_avanzada'));
    $smarty->assign("_nombre_pagina", TXT_CONSULT . ": " . $entidad->nombre);
    $plantilla = "unidades/consulta_avanzada.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
