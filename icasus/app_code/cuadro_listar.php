<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadro_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los cuadros de mando definidos por este usuario
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id =  $id_entidad");
    $smarty->assign('entidad', $entidad);

    $cuadros = $cuadro->Find("privado = 0 AND id_entidad=$id_entidad");
    $smarty->assign('cuadros', $cuadros);

    $plantilla = 'cuadro_listar.tpl';
    $smarty->assign('_javascript', array('cuadro_listar'));
    $smarty->assign('_nombre_pagina', TXT_CUADROS_MANDO. ': ' . $entidad->nombre);
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=cuadro_listar&error=$error");
}