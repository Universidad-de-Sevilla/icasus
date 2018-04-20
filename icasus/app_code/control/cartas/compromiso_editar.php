<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cartas/compromiso_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar un Compromiso existente
//---------------------------------------------------------------------------------------------------

global $control;

if (filter_has_var(INPUT_GET, 'id_compromiso') && $control)
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

    $servicio = new Servicio();
    $servicio->load("id = $compromiso->id_servicio");
    $smarty->assign('servicio', $servicio);

    $carta = new Carta();
    $carta->load_joined("id=$servicio->id_carta");
    $smarty->assign('carta', $carta);
    $smarty->assign('entidad', $carta->entidad);

    //Validar índice de un Compromiso
    $indices = array();
    $compromisos = $compromiso->Find("id_servicio=$compromiso->id_servicio");
    foreach ($compromisos as $comp)
    {
        if ($compromiso->indice != $comp->indice)
        {
            array_push($indices, $comp->indice);
        }
    }
    $smarty->assign('elementos', $indices);

    //Indicadores del Compromiso
    $indicador = new Indicador();
    $indicadores = $indicador->Find("id_entidad=$entidad->id AND archivado IS NULL");
    $smarty->assign("indicadores", $indicadores);

    $smarty->assign('_nombre_pagina', TXT_COMPROMISO_EDIT . ': C.' . $compromiso->indice . '. ' . $compromiso->nombre);
    $plantilla = 'cartas/compromiso_editar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
