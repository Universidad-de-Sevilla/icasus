<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: cartas/carta_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de una Carta de Servicios
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad') AND filter_has_var(INPUT_GET, 'id_carta'))
{
    $id_carta = filter_input(INPUT_GET, 'id_carta', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos de la Carta
    $carta = new Carta();
    if ($carta->load_joined("id = $id_carta"))
    {
        $smarty->assign('carta', $carta);
    }
    else
    {
        $error = ERR_CARTA_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    //Obtener todas las Cartas para avanzar o retroceder 
    $cartas = $carta->Find("id_entidad = $id_entidad");
    $smarty->assign("cartas", $cartas);
    $cont = 0;
    foreach ($cartas as $cart)
    {
        if ($id_carta == $cart->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Servicios
    //Compromisos
    //Indicadores
    //Archivos
    $archivo = new Fichero();
    $archivos = $archivo->find_joined("id_objeto = $id_carta AND tipo_objeto = 'carta' AND visible=1");
    $smarty->assign('archivos', $archivos);

    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('carta_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_CARTA . " " . date("d-m-Y", strtotime($carta->fecha)) . ': ' . $entidad->nombre);
    $plantilla = 'cartas/carta_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
