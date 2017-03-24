<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadros/panel_tarta.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Controlador para la creación de paneles de tarta
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_cuadro') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_cuadro = filter_input(INPUT_GET, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $entidad = new Entidad();
    $entidad->load("id=$id_entidad");
    $smarty->assign('entidad', $entidad);

    $cuadro = new Cuadro();
    $cuadro->load("id=$id_cuadro");
    $smarty->assign('cuadro', $cuadro);

    if ($control || $usuario->id == $cuadro->id_usuario)
    {
        //Tipo de panel: tarta
        $panel_tipo = new Panel_tipo();
        $panel_tipo->load("nombre = 'tarta'");
        $smarty->assign('panel_tipo', $panel_tipo);

        //Validar orden del panel dentro del cuadro de mando
        $panel = new Panel();
        $ordenes = array();
        $paneles = $panel->Find("id_cuadro=$id_cuadro");
        foreach ($paneles as $pl)
        {
            array_push($ordenes, $pl->orden);
        }
        $smarty->assign('elementos', $ordenes);

        //Indicadores/datos
        $indicador = new Indicador();
        $indicadores = $indicador->find("id_entidad = $id_entidad AND archivado is NULL");
        $smarty->assign('indicadores', $indicadores);

        //Mediciones
        $id_indicador = $indicadores[0]->id;
        $medicion = new Medicion();
        $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
        $smarty->assign('mediciones', $mediciones);

        $smarty->assign('_javascript', array('panel_tarta'));
        $smarty->assign('_nombre_pagina', TXT_PANEL_CREAR . ': ' . TXT_TARTA);
        $plantilla = "cuadros/panel_tarta.tpl";
    }
    else
    {
        $error = ERR_PERMISOS;
        header("location:index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$id_entidad&error=$error");
    }
}
//Peticiones ajax
else if (filter_has_var(INPUT_GET, 'modulo'))
{
    $modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);

    //Cálculo de mediciones del indicador
    if ($modulo == 'mediciones')
    {
        $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
        $medicion = new Medicion();
        $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
        $smarty->assign('mediciones', $mediciones);
    }
    $smarty->assign('modulo', $modulo);
    $plantilla = "cuadros/panel_tarta.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
