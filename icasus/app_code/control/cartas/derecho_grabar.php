<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: cartas/derecho_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea/Edita un Derecho para una Carta de Servicios
//---------------------------------------------------------------------------------------------------

global $usuario;

if (filter_has_var(INPUT_POST, 'nombre'))
{
    $derecho = new Derecho();
    $carta = new Carta();
    $exito = MSG_DERECHO_CREADO;
    // Si viene el id es que estamos editando un Derecho existente
    if (filter_has_var(INPUT_POST, 'id_derecho'))
    {
        $id_derecho = filter_input(INPUT_POST, 'id_derecho', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_DERECHO_EDITADO;
        if ($derecho->load("id = $id_derecho") == false)
        {
            $error = ERR_DERECHO_EDIT;
            header("Location: index.php?page=error&error=error");
        }
    }
    // Guardamos los datos
    $id_carta = filter_input(INPUT_POST, 'id_carta', FILTER_SANITIZE_NUMBER_INT);
    $carta->load("id=$id_carta");
    $derecho->id_carta = $id_carta;
    $derecho->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $derecho->categoria = filter_input(INPUT_POST, 'categoria', FILTER_SANITIZE_STRING);
    $derecho->descripcion = filter_input(INPUT_POST, 'descripcion', FILTER_SANITIZE_STRING);
    $derecho->save();
    header("Location: index.php?page=carta_mostrar&id_entidad=$carta->id_entidad&id_carta=$id_carta&exito=$exito#carta_derechos");
}
else
{
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=error");
}
