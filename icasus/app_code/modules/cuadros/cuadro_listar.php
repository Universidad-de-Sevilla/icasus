<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadro_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los cuadros de mando para una unidad
//---------------------------------------------------------------------------------------------------
global $usuario;
global $smarty;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id =  $id_entidad");
    $smarty->assign('entidad', $entidad);

    $cuadro = new Cuadro();
    $cuadros = $cuadro->Find_joined("privado = 0 AND id_entidad = $id_entidad");
    $smarty->assign('cuadros', $cuadros);

    // Cuadros de mando del usuario
    $cuadros_propios = $cuadro->Find("id_usuario = $usuario->id AND id_entidad = $id_entidad");
    $smarty->assign('cuadros_propios', $cuadros_propios);

    $plantilla = 'cuadros/cuadro_listar.tpl';
    $smarty->assign('_javascript', array('cuadro_listar'));
    $smarty->assign('_nombre_pagina', FIELD_CUADROS_MANDO . ': ' . $entidad->nombre);
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
