<?php

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $carta = new Carta();
    $cartas = $carta->Find("id_entidad=$id_entidad ORDER BY fecha DESC");
    $smarty->assign('cartas', $cartas);

    $smarty->assign('_javascript', array('carta_listar'));
    $smarty->assign('_nombre_pagina', TXT_CARTAS_TITULO . ": " . $entidad->nombre);
    $plantilla = 'cartas/carta_listar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
