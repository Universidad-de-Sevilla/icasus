<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entidad_despoblar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra un listado de usuarios de la unidad para ser desasignados de ella
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;

// Si vienen datos del formulario asignamos los usuarios marcados a la entidad
if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);
    $smarty->assign('_nombre_pagina', TXT_USERS_BAJA . ' - ' . $entidad->nombre);

    $usuario_entidad = new Usuario_entidad;
    $usuarios = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign('usuarios', $usuarios);

    $post_array = filter_input_array(INPUT_POST);
    $id_usuarios = $post_array['id_usuario'];
    if ($id_usuarios)
    {
        $contador = 0;

        foreach ($id_usuarios as $id_usuario)
        {
            $id_usuario = filter_var($id_usuario, FILTER_SANITIZE_NUMBER_INT);
            $usuario_entidad->desasignar_usuario($id_entidad, $id_usuario);
            $contador ++;
        }
        $exito = MSG_UNID_USERS_BORRADOS . ' ' . $contador . ' ' . TXT_USERS;
        header("location:index.php?page=entidad_despoblar&id_entidad=$id_entidad&exito=$exito");
    }
    else
    {
        $plantilla = 'unidades/entidad_despoblar.tpl';
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
