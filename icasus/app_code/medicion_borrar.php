<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Borra la medición, los valores y los valores de referencia asociados a ella
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'tipo') AND filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $tipo = filter_input(INPUT_GET, 'tipo', FILTER_SANITIZE_STRING);

    //Borrar una sola medición
    if (filter_has_var(INPUT_GET, 'id_medicion'))
    {
        $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
        $medicion = new Medicion();
        $medicion->load("id = $id_medicion");
        $indicador = new Indicador();
        $indicador->load("id = $medicion->id_indicador");

        // Comprobamos si el usuario tiene autorización
        if ($control)
        {
            $autorizado = true;
        }
        else if ($indicador->id_responsable == $usuario->id OR $indicador->id_responsable_medicion == $usuario->id)
        {
            $autorizado = true;
        }
        else
        {
            $autorizado = false;
        }
        if ($autorizado)
        {
            $logicaIndicador->borrar_medicion($indicador, $tipo, $id_medicion);
        }
        else
        {
            $error = ERR_AUT;
            header("location:index.php?page=medicion_editar&id_medicion=$id_medicion&id_entidad=$id_entidad&tipo=$tipo&error=$error");
        }
    }
    //Borrar varias mediciones
    if (filter_has_var(INPUT_POST, 'id_mediciones'))
    {
        $post_array = filter_input_array(INPUT_POST);
        $id_mediciones = $post_array['id_mediciones'];
        if ($id_mediciones)
        {
            $medicion = new Medicion();
            $medicion->load("id = $id_mediciones[0]");
            $indicador = new Indicador();
            $indicador->load("id = $medicion->id_indicador");
            foreach ($id_mediciones as $id_med)
            {
                $logicaIndicador->borrar_medicion($indicador, $tipo, $id_med);
            }
        }
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}
