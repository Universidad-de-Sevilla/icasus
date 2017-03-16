<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra la medición, los valores y los valores de referencia asociados a ella
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
//Variable para operar con Procesos
$logicaProceso = new LogicaProceso();
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    //Borrar una sola medición
    if (filter_has_var(INPUT_GET, 'id_medicion'))
    {
        $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
        $medicion = new Medicion();
        $medicion->load("id = $id_medicion");
        $indicador = new Indicador();
        $indicador->load_joined("id = $medicion->id_indicador");

        //Permisos del proceso
        $permiso_proceso = $logicaProceso->comprobar_responsable_proceso($usuario->id, $indicador->proceso);

        // Comprobamos si el usuario tiene autorización
        if ($control OR $indicador->id_responsable == $usuario->id
                OR $indicador->id_responsable_medicion == $usuario->id
                OR $permiso_proceso)
        {
            $autorizado = true;
        }
        else
        {
            $autorizado = false;
        }
        if ($autorizado)
        {
            $logicaIndicador->borrar_medicion($indicador, $id_medicion);
        }
        else
        {
            $error = ERR_AUT;
            header("location:index.php?page=medicion&id_medicion=$id_medicion&id_entidad=$id_entidad&error=$error");
        }
    }

    //Borrar varias mediciones
    if (filter_has_var(INPUT_POST, 'id_indicador') && filter_has_var(INPUT_POST, 'id_mediciones'))
    {
        $id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
        $indicador = new Indicador();
        $indicador->load_joined("id=$id_indicador");
        $post_array = filter_input_array(INPUT_POST);
        $id_mediciones = $post_array['id_mediciones'];

        if ($id_mediciones)
        {
            //Permisos del proceso
            $permiso_proceso = $logicaProceso->comprobar_responsable_proceso($usuario->id, $indicador->proceso);

            // Comprobamos si el usuario tiene autorización
            if ($control OR $indicador->id_responsable == $usuario->id
                    OR $indicador->id_responsable_medicion == $usuario->id
                    OR $permiso_proceso)
            {
                $autorizado = true;
            }
            else
            {
                $autorizado = false;
            }
            if ($autorizado)
            {
                foreach ($id_mediciones as $id_med)
                {
                    $logicaIndicador->borrar_medicion($indicador, $id_med);
                }
            }
            else
            {
                $error = ERR_AUT;
                header("location:index.php?page=medicion&id_medicion=$id_medicion&id_entidad=$id_entidad&error=$error");
            }
        }
    }

    //Si no marcamos ninguna casilla
    if (filter_has_var(INPUT_POST, 'id_indicador') && !filter_has_var(INPUT_POST, 'id_mediciones'))
    {
        $id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
        $aviso = MSG_MEDS_NO_MARCADAS;
        header("location:index.php?page=medicion_listar&id_indicador=$id_indicador&id_entidad=$id_entidad&aviso=$aviso");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
