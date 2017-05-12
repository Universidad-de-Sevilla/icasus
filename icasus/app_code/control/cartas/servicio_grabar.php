<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: cartas/servicio_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea/Edita un Servicio para una Carta de Servicios
//---------------------------------------------------------------------------------------------------

global $usuario;

if (filter_has_var(INPUT_POST, 'indice') && filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'id_carta'))
{
    $servicio = new Servicio();
    $carta = new Carta();
    $exito = MSG_SERVICIO_CREADO;
    // Si viene el id es que estamos editando un Servicio existente
    if (filter_has_var(INPUT_POST, 'id_servicio'))
    {
        $id_servicio = filter_input(INPUT_POST, 'id_servicio', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_SERVICIO_EDITADO;
        if ($servicio->load("id = $id_servicio") == false)
        {
            $error = ERR_SERVICIO_EDIT;
            header("Location: index.php?page=error&error=error");
        }
    }
    // Guardamos los datos
    $id_carta = filter_input(INPUT_POST, 'id_carta', FILTER_SANITIZE_NUMBER_INT);
    $carta->load("id=$id_carta");
    $servicio->id_carta = $id_carta;
    $servicio->indice = filter_input(INPUT_POST, 'indice', FILTER_SANITIZE_NUMBER_INT);
    $servicio->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $servicio->descripcion = filter_input(INPUT_POST, 'descripcion', FILTER_SANITIZE_STRING);
    $servicio->save();
    header("Location: index.php?page=servicio_mostrar&id_entidad=$carta->id_entidad&id_servicio=$servicio->id&exito=$exito");
}
else
{
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=error");
}
