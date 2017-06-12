<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: cartas/compromiso_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de un Compromiso
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_compromiso'))
{
    $id_compromiso = filter_input(INPUT_GET, 'id_compromiso', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del Compromiso
    $compromiso = new Compromiso();
    if ($compromiso->load_joined("id = $id_compromiso"))
    {
        $smarty->assign('compromiso', $compromiso);
    }
    else
    {
        $error = ERR_COMPROMISO_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    //Obtener todos los Compromisos para avanzar o retroceder 
    $compromisos = $compromiso->Find("id_servicio = $compromiso->id_servicio order by indice");
    $smarty->assign("compromisos", $compromisos);
    $cont = 0;
    foreach ($compromisos as $comp)
    {
        if ($id_compromiso == $comp->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Obtenemos los datos del Servicio, de la Carta y la Unidad
    $smarty->assign('servicio', $compromiso->servicio);
    $smarty->assign('carta', $compromiso->servicio->carta);
    $smarty->assign('entidad', $compromiso->servicio->carta->entidad);

    //Indicadores del Compromiso
    $compromiso_indicador = new CompromisoIndicador();
    $indicadores = array();
    $compromiso_indicadores = $compromiso_indicador->Find("id_compromiso=$compromiso->id");
    foreach ($compromiso_indicadores as $comp_ind)
    {
        $indicador = new Indicador();
        $indicador->load_joined("id=$comp_ind->id_indicador");
        array_push($indicadores, $indicador);
    }
    $smarty->assign('indicadores', $indicadores);

    $smarty->assign('_javascript', array('compromiso_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_COMPROMISO . ": C." . $compromiso->indice . ". " . $compromiso->nombre);
    $plantilla = 'cartas/compromiso_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
