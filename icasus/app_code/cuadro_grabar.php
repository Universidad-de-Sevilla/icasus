<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: cuadro_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea un nuevo cuadro de mandos para un usuario
//---------------------------------------------------------------------------------------------------
// Comprueba que vienen los datos mínimos
if (filter_has_var(INPUT_POST, 'nombre'))
{
    // Guardamos los datos que vienen del formulario
    $cuadro = new Cuadro();
    $exito = MSG_CUADRO_CREADO;
    // Si viene el id es que estamos editando uno existente
    if (filter_has_var(INPUT_POST, 'id_cuadro'))
    {
        $id_cuadro = filter_input(INPUT_POST, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_CUADRO_EDITADO;
        if ($cuadro->load("id = $id_cuadro") == false)
        {
            $error = ERR_CUAD_MANDO_EDIT;
            header("Location: index.php?page=cuadros&error=error");
        }
    }
    // Estamos creando un cuadro nuevo y asumimos su propiedad
    else
    {
        $cuadro->id_usuario = $usuario->id;
    }
    $cuadro->id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $cuadro->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $cuadro->privado = 0;
    if (filter_has_var(INPUT_POST, 'privado'))
    {
        $cuadro->privado = filter_input(INPUT_POST, 'privado', FILTER_VALIDATE_BOOLEAN);
    }
    $cuadro->comentarios = filter_has_var(INPUT_POST, 'comentarios') ? filter_input(INPUT_POST, 'comentarios', FILTER_SANITIZE_STRING) : '';
    $cuadro->save();
    header("Location: index.php?page=cuadro_mostrar&id_cuadro=$cuadro->id&id_entidad=$cuadro->id_entidad&exito=$exito");
}
else
{
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=cuadros&error=error");
}
