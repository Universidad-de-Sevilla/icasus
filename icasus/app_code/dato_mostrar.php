<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra todos los parametros de un dato.
// Es casi igual que el indicador pero con algunos campos menos (misma tabla de la base de datos)
// Se diferencia del indicador en que pertenece a una unidad pero no a un proceso
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_dato'))
{
    $id_dato = filter_input(INPUT_GET, 'id_dato', FILTER_SANITIZE_NUMBER_INT);
    $dato = new Indicador();
    if ($dato->load_joined("id = $id_dato"))
    {
        $smarty->assign('dato', $dato);
        //Si es un indicador
        if ($dato->id_proceso)
        {
            header("Location: index.php?page=indicador_mostrar&id_indicador=$id_dato&id_entidad=$dato->id_entidad");
        }
    }
    else
    {
        $error = ERR_DATO_MOSTRAR;
        header("location:index.php?error=$error");
    }

    $entidad = new Entidad();
    $entidad->load("id = $dato->id_entidad");
    $smarty->assign('entidad', $entidad);

    //Obtener todos los datos para avanzar o retroceder
    if ($dato->archivado)
    {
        $datos = $dato->Find("id_entidad = $id_entidad AND id_proceso IS NULL AND archivado is NOT NULL");
    }
    else
    {
        $datos = $dato->Find("id_entidad = $id_entidad AND id_proceso IS NULL AND archivado is NULL");
    }
    $smarty->assign("datos", $datos);
    $cont = 0;
    foreach ($datos as $dat)
    {
        if ($id_dato == $dat->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Responsables
    $responsable = false;
    if ($dato->id_responsable == $usuario->id)
    {
        $responsable = true;
    }
    $smarty->assign('responsable', $responsable);

    //Vemos si influye en otros Indicadores/Datos
    $datos_dependientes = $logicaIndicador->calcular_influencias($id_dato);
    $smarty->assign('datos_dependientes', $datos_dependientes);

    //Si es calculado vemos los Indicadores/Datos de los que depende
    $datos_influyentes = $logicaIndicador->calcular_dependencias($id_dato);
    $smarty->assign("datos_influyentes", $datos_influyentes);

    //Subunidades asignadas a la medicion de este dato
    $dato_subunidad = new Indicador_subunidad();
    $dato_subunidades = $dato_subunidad->Find_entidades("id_indicador = $id_dato");
    $smarty->assign("dato_subunidades", $dato_subunidades);

    $smarty->assign('_javascript', array('dato_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_DATO . ": $dato->nombre");
    $plantilla = 'dato_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
