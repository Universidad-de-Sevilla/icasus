<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entidad_poblar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra un listado de usuarios para ser asignados a una unidad
// Si los usuario ya vienen señalados se graban en la tabla usuario_unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    // Si vienen datos del formulario asignamos los usuarios marcados a la entidad
    if (filter_has_var(INPUT_POST, 'id_rol') && filter_has_var(INPUT_POST, 'id_usuario'))
    {
        $id_rol = filter_input(INPUT_POST, 'id_rol', FILTER_SANITIZE_NUMBER_INT);
        $contador = 0;

        $post_array = filter_input_array(INPUT_POST);
        $id_usuarios = $post_array['id_usuario'];
        foreach ($id_usuarios as $id_usuario)
        {
            $usuario_entidad = new Usuario_entidad;
            $id_usuario = filter_var($id_usuario, FILTER_SANITIZE_NUMBER_INT);
            $usuario_entidad->id_usuario = $id_usuario;
            $usuario_entidad->id_entidad = $id_entidad;
            $usuario_entidad->id_rol = $id_rol;
            if ($usuario_entidad->save())
            {
                $contador ++;
            }
        }
        $exito = MSG_UNID_USERS_AGREGADOS . ' ' . $contador . ' ' . TXT_USERS;
        header("location:index.php?page=entidad_poblar&id_entidad=$id_entidad&exito=$exito");
    }
    // Si no vienen datos en el POST mostramos el formulario
    else
    {
        $persona = new Usuario();
        $where = "1 = 1 ORDER BY apellidos";
        $personas = $persona->Find_sql($where);
        $smarty->assign('personas', $personas);

        $rol = new Rol();
        $roles = $rol->Find("objeto = 'entidad' ORDER BY orden");
        $smarty->assign('roles', $roles);

        $entidad = new Entidad();
        $entidad->load("id = $id_entidad");
        $smarty->assign('entidad', $entidad);
        $smarty->assign('_nombre_pagina', TXT_USERS_ALTA . ' - ' . $entidad->nombre);
        $plantilla = 'entidad_poblar.tpl';

        $usuario_entidad = new Usuario_entidad;
        $usuarios = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
        $smarty->assign('usuarios', $usuarios);
    }
}
else
{
    $error = ERR_UNID_NO_SEL;
    header("location:index.php?error=$error");
}
