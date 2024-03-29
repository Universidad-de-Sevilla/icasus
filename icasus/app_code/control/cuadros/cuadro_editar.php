<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadros/cuadro_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar un cuadro de mandos existente
//---------------------------------------------------------------------------------------------------

global $usuario;
global $plantilla;
global $smarty;

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

    $usuario_entidad = new Usuario_entidad;
    $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = '$id_entidad'");
    $smarty->assign("usuarios_entidad", $usuarios_entidad);

    //Comprobamos los permisos del usuario
    if ($control || $usuario->id == $cuadro->id_usuario)
    {
        $smarty->assign('_nombre_pagina', TXT_CUADRO_EDIT . ': ' . $cuadro->nombre);
        $plantilla = 'cuadros/cuadro_editar.tpl';
    }
    else
    {

        $error = ERR_PERMISOS;
        header("Location: index.php?page=cuadro_listar&id_entidad=$cuadro->id_entidad&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
