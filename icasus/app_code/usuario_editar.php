<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: usuario_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra el formulario para editar un usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_usuario'))
{
    $id_usuario = filter_input(INPUT_GET, 'id_usuario', FILTER_SANITIZE_NUMBER_INT);
    // Sólo administradores de Icasus pueden editar todos los usuarios
    $admin = false;
    foreach ($usuario->entidades as $entidad)
    {
        if ($entidad->id_entidad == 1 && ($entidad->id_rol == 1 || $entidad->id_rol == 2))
        {
            $admin = true;
        }
    }
    if ($usuario->id == $id_usuario || $admin)
    {
        $persona = new Usuario();
        $persona->load("id=$id_usuario");
        $smarty->assign('persona', $persona);
        $nombre_pagina = TXT_USER_EDIT . ': ' . $persona->nombre . ' ' . $persona->apellidos;
        $smarty->assign('_nombre_pagina', $nombre_pagina);
        $plantilla = 'usuario_editar.tpl';
    }
    else
    {
        $error = ERR_PERMISOS;
        header("location:index.php?page=error&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
