<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_mostrar.php
//---------------------------------------------------------------------------------------------------
// Muestra todos los parametros de un dato y un listado de los valores introducidos
// Es casi igual que el indicador pero con algunos campos menos (misma tabla de la base de datos)
// Se diferencia del indicador en que pertenece a una unidad pero no a un proceso
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

//if (isset($_REQUEST['id_dato']))
if (filter_has_var(INPUT_GET, 'id_dato'))
{
//	$id_dato = sanitize($_REQUEST['id_dato'],16); 
    $id_dato = filter_input(INPUT_GET, 'id_dato', FILTER_SANITIZE_NUMBER_INT);
    $dato = new Indicador();
    if ($dato->load_joined("id = $id_dato"))
    {
        $smarty->assign('dato', $dato);
    }
    else
    {
        $error = ERR_DATO_MOSTRAR;
        header("location:index.php?error=$error");
    }
    $entidad = new Entidad();
    $entidad->load("id = $dato->id_entidad");
    $smarty->assign('entidad', $entidad);

    //Subunidades asignadas a la medicion de este dato
    $dato_subunidad = new Indicador_subunidad();
    $dato_subunidades = $dato_subunidad->Find_entidades("id_indicador = $id_dato");
    $smarty->assign("dato_subunidades", $dato_subunidades);

    //Simplemente ver si hay mediciones
    $medicion = new Medicion();
    $mediciones = $medicion->Find("id_indicador = $id_dato");
    $smarty->assign("mediciones", $mediciones);

    $smarty->assign('_nombre_pagina', TXT_DATO_FICHA . ": $dato->nombre");
    $plantilla = 'dato_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}

