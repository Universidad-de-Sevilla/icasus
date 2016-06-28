<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: usuario_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Graba un usuario en la base de datos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'apellidos') && filter_has_var(INPUT_POST, 'correo'))
{
    $persona = new Usuario();
    $exito = MSG_USER_CREADO;
    // Si viene el id es que estamos editando uno existente
    if (filter_has_var(INPUT_POST, 'id_usuario'))
    {
        $id_usuario = filter_input(INPUT_POST, 'id_usuario', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_USER_EDITADO;
        $persona->Load("id=$id_usuario");
    }
    $persona->nombre = strtoupper(filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING));
    $persona->apellidos = strtoupper(filter_input(INPUT_POST, 'apellidos', FILTER_SANITIZE_STRING));
    $persona->correo = filter_input(INPUT_POST, 'correo', FILTER_VALIDATE_EMAIL);
    $persona->telefono = filter_input(INPUT_POST, 'telefono', FILTER_SANITIZE_STRING);
    $persona->puesto = filter_input(INPUT_POST, 'puesto', FILTER_SANITIZE_STRING);
    $persona->save();
    header("Location: index.php?page=usuario_mostrar&id_usuario=$persona->id&exito=$exito");
}
else
{
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=cuadros&error=error");
}
