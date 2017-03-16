<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: proceso_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un proceso
//---------------------------------------------------------------------------------------------------

global $usuario;
//Variable para operar con Procesos
$logicaProceso = new LogicaProceso();

if (filter_has_var(INPUT_GET, 'id_proceso') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_proceso = filter_input(INPUT_GET, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
    $proceso = new Proceso();
    $proceso->load_joined("id = $id_proceso");

    //Permisos del proceso
    $permiso_proceso = $logicaProceso->comprobar_responsable_proceso($usuario->id, $proceso);

    if ($control OR $permiso_proceso)
    {
        $indicador = new Indicador();
        $indicadores = $indicador->Find("id_proceso = $id_proceso");
        if ($indicadores)
        {
            $aviso = ERR_PROC_BORRAR;
            header("Location: index.php?page=proceso_mostrar&id_proceso=$id_proceso&id_entidad=$id_entidad&aviso=$aviso");
        }
        else
        {
            $proceso->delete();
            $exito = MSG_PROC_BORRADO . $proceso->nombre;
            header("Location: index.php?page=proceso_listar&id_entidad=$id_entidad&exito=$exito");
        }
    }
    else
    {
        $error = ERR_PERMISOS;
        header("Location: index.php?page=proceso_listar&id_entidad=$id_entidad&error=$error");
    }
}
else // falta id_indicador o id_entidad
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
