<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cartas/normativa_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar una Normativa existente
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_normativa') && $control)
{
    $id_normativa = filter_input(INPUT_GET, 'id_normativa', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos de la Normativa
    $normativa = new Normativa();
    if ($normativa->load("id = $id_normativa"))
    {
        $smarty->assign('normativa', $normativa);
    }
    else
    {
        $error = ERR_NORMATIVA_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    $id_carta = $normativa->id_carta;
    $carta = new Carta();
    $carta->load("id = $id_carta");
    $smarty->assign('carta', $carta);

    $entidad = new Entidad();
    $entidad->load("id=$carta->id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_nombre_pagina', TXT_NORMATIVA_EDIT . ': ' . $normativa->nombre);
    $plantilla = 'cartas/normativa_editar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
