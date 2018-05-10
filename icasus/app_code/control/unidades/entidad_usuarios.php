<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: unidades/entidad_usuarios.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestión de los usuarios de una unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    if ($control)
    {
        //Asignar usuarios
        if (filter_has_var(INPUT_POST, 'id_rol') && filter_has_var(INPUT_POST, 'id_usuario'))
        {
            $id_rol = filter_input(INPUT_POST, 'id_rol', FILTER_SANITIZE_NUMBER_INT);
            $contador = 0;

            $post_array = filter_input_array(INPUT_POST);
            $id_usuarios = $post_array['id_usuario'];
            foreach ($id_usuarios as $id_usuario)
            {
                $usuario_entidad = new Usuario_entidad();
                $id_usuario = filter_var($id_usuario, FILTER_SANITIZE_NUMBER_INT);
                $usuario_entidad->id_usuario = $id_usuario;
                $usuario_entidad->id_entidad = $id_entidad;
                $usuario_entidad->id_rol = $id_rol;
                $usuario_entidad->principal = 0;
                if ($usuario_entidad->save())
                {
                    $contador ++;
                }
            }
            $exito = MSG_UNID_USERS_AGREGADOS . ' ' . $contador . ' ' . TXT_USERS;
            header("location:index.php?page=entidad_usuarios&id_entidad=$id_entidad&exito=$exito");
        }
        //Desasignar usuarios
        else if (filter_has_var(INPUT_POST, 'id_usuario'))
        {
            $usuario_entidad = new Usuario_entidad();
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
                header("location:index.php?page=entidad_usuarios&id_entidad=$id_entidad&exito=$exito");
            }
        }
        //Si no marcamos ninguna casilla
        else if (!filter_has_var(INPUT_POST, 'id_usuario') AND ( filter_has_var(INPUT_POST, 'alta') OR filter_has_var(INPUT_POST, 'baja')))
        {
            $aviso = MSG_USERS_NO_MARCADOS;
            header("location:index.php?page=entidad_usuarios&id_entidad=$id_entidad&aviso=$aviso");
        }
        //Edición del rol de un usuario asignado
        else if (filter_has_var(INPUT_GET, 'id_rol') && filter_has_var(INPUT_GET, 'id_usuario'))
        {
            $id_rol = filter_input(INPUT_GET, 'id_rol', FILTER_SANITIZE_NUMBER_INT);
            $id_usuario = filter_input(INPUT_GET, 'id_usuario', FILTER_SANITIZE_NUMBER_INT);
            $usuario_entidad = new Usuario_entidad();
            $usuario_entidad->load("id_entidad=$id_entidad AND id_usuario=$id_usuario");
            $usuario_entidad->id_rol = $id_rol;
            $usuario_entidad->Save();
        }
        //Si no vienen datos mostramos la página
        else
        {
            $persona = new Usuario();
            $query_aux = "SELECT id_usuario FROM icasus_usuarios_entidades WHERE id_entidad=$id_entidad";
            $personas = $persona->Find("id NOT IN ($query_aux) ORDER BY apellidos");
            $smarty->assign('personas', $personas);

            $rol = new Rol();
            $roles = $rol->Find("objeto = 'entidad' ORDER BY orden");
            $smarty->assign('roles', $roles);

            $usuario_entidad = new Usuario_entidad();
            $usuarios = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
            $smarty->assign('usuarios', $usuarios);

            $smarty->assign('_javascript', array('entidad_usuarios'));
            $smarty->assign('_nombre_pagina', TXT_USER_GESTION . ' - ' . $entidad->nombre);
            $plantilla = 'unidades/entidad_usuarios.tpl';
        }
    }
    else
    {
        $error = ERR_PERMISOS;
        header("Location: index.php?page=entidad_usuarios&id_entidad=$id_entidad&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
