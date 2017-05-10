<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: cartas/carta_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea/Edita una Carta de Servicios para una Unidad
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_POST, 'fecha') && filter_has_var(INPUT_POST, 'id_entidad'))
{
    $carta = new Carta();
    $exito = MSG_CARTA_CREADA;
    $fecha = filter_input(INPUT_POST, 'fecha', FILTER_SANITIZE_STRING);
    $fecha_array = explode("/", $fecha);
    $fecha = $fecha_array[2] . "/" . $fecha_array[1] . "/" . $fecha_array[0];

    //Si viene el id es que estamos editando una Carta existente
    if (filter_has_var(INPUT_POST, 'id_carta'))
    {
        $id_carta = filter_input(INPUT_POST, 'id_carta', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_CARTA_EDITADA;
        if ($carta->load("id = $id_carta") == false)
        {
            $error = ERR_CARTA_EDIT;
            header("Location: index.php?page=error&error=error");
        }
    }
    // Guardamos el resto de los datos
    $carta->fecha = $fecha;
    $carta->id_cuadro = filter_has_var(INPUT_POST, 'cuadro') ? filter_input(INPUT_POST, 'cuadro', FILTER_SANITIZE_NUMBER_INT) : 0;
    $carta->mision = filter_input(INPUT_POST, 'mision', FILTER_SANITIZE_STRING);
    $carta->vision = filter_input(INPUT_POST, 'vision', FILTER_SANITIZE_STRING);
    $carta->valores = filter_input(INPUT_POST, 'valores', FILTER_SANITIZE_STRING);
    $carta->save();
    header("Location: index.php?page=carta_mostrar&id_carta=$carta->id&id_entidad=$carta->id_entidad&exito=$exito");
}
else
{
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=error");
}
