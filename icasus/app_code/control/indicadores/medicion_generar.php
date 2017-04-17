<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicadores/medicion_generar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Descripcion: Genera las mediciones de un Indicador/Dato para el año actual en 
// función de su periodicidad
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Procesos
$logicaProceso = new LogicaProceso();
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_POST, 'id_entidad') && filter_has_var(INPUT_POST, 'id_indicador') && filter_has_var(INPUT_POST, 'anyo'))
{
    $id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $anyo = filter_input(INPUT_POST, 'anyo', FILTER_SANITIZE_NUMBER_INT);

    $indicador = new Indicador;
    if ($indicador->load("id = $id_indicador"))
    {
        if ($anyo >= $indicador->historicos && $anyo <= idate('Y'))
        {
            //Permisos del proceso
            $permiso_proceso = $logicaProceso->comprobar_responsable_proceso($usuario->id, $indicador->proceso);

            //Comprobar permisos para cambiar mediciones tanto para responsables del
            //indicador como de la medición o responsables de la unidad y el proceso
            if ($control OR $indicador->id_responsable == $usuario->id
                    OR $indicador->id_responsable_medicion == $usuario->id
                    OR $permiso_proceso)
            {
                $permiso_generar = true;
            }
            else
            {
                $permiso_generar = false;
            }

            if ($permiso_generar)
            {
                //Generamos mediciones en función de la periodicidad y del año
                $logicaIndicador->generar_mediciones($indicador, $anyo);
            }
            else
            {
                // El usuario no tiene permisos avisamos error
                $error = ERR_PERMISOS;
                header("Location:index.php?page=medicion_listar&id_indicador=$id_indicador&id_entidad=$id_entidad&error=$error");
            }
        }
    }
    else
    {
        $error = ERR_INDIC_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
