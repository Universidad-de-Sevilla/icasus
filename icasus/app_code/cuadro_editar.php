<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadro_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar un cuadro de mandos existente
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_cuadro') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_cuadro = filter_input(INPUT_GET, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
    $cuadro = new Cuadro();
    $cuadro->load("id = $id_cuadro");
    $smarty->assign('cuadro', $cuadro);
    
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id=$id_entidad");
    $smarty->assign('entidad', $entidad);
    
    $smarty->assign('_nombre_pagina', TXT_CUADRO_EDIT . ': ' . $cuadro->nombre);
    $plantilla = 'cuadro_editar.tpl';
}
else
{
    header("Location: index.php?page=cuadro_listar");
}
