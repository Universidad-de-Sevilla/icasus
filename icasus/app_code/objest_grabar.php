<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: objest_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea/Edita un objetivo estratégico para una línea de un plan
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_POST, 'indice') && filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'id_linea'))
{
    $id_linea = filter_input(INPUT_POST, 'id_linea', FILTER_SANITIZE_NUMBER_INT);
    $linea = new Linea();
    $linea->load("id=$id_linea");
    $objest = new ObjetivoEstrategico();
    $exito = MSG_OBJEST_CREADO . ' ' . $linea->indice . '. ' . $linea->nombre;
    // Si viene el id es que estamos editando una línea existente
    if (filter_has_var(INPUT_POST, 'id_objest'))
    {
        $id_objest = filter_input(INPUT_POST, 'id_objest', FILTER_SANITIZE_NUMBER_INT);
        $exito = MSG_OBJEST_EDITADO;
        if ($objest->load("id = $id_objest") == false)
        {
            $error = ERR_OBJEST_EDIT;
            header("Location: index.php?page=error&error=error");
        }
    }
    else
    {
        $objest->ejecucion = 0;
    }
    // Guardamos los datos
    $objest->id_linea = $id_linea;
    $objest->indice = filter_input(INPUT_POST, 'indice', FILTER_SANITIZE_NUMBER_INT);
    $objest->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $objest->save();
    header("Location: index.php?page=objest_mostrar&id_objest=$objest->id&id_linea=$linea->id&exito=$exito");
}
else
{
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=error");
}
