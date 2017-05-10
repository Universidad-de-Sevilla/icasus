<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cartas/carta_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripción: muestra el formulario que permite crear una nueva Carta de Servicios
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_entidad') && $control)
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id=$id_entidad");

    //Cuadro de mando asociado
    $cuadro = new Cuadro();
    $cuadros_cartas = $cuadro->Find("privado = 0 AND id_entidad = $id_entidad");
    $smarty->assign('cuadros_cartas', $cuadros_cartas);

    $smarty->assign('entidad', $entidad);
    $smarty->assign('_nombre_pagina', TXT_CARTA_CREAR . ": " . $entidad->nombre);
    $plantilla = 'cartas/carta_crear.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
