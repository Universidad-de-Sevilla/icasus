<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: proceso_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un proceso
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_proceso') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_proceso = filter_input(INPUT_GET, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
    $proceso = new Proceso();
    $proceso->load_joined("id = $id_proceso");
    if ($control OR $proceso->id_propietario == $proceso->propietario->id)
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
        $error = ERR_PROC_BORRAR_NO_AUT;
        header("Location: index.php?page=proceso_listar&id_entidad=$id_entidad&error=$error");
    }
}
else // falta id_indicador o id_entidad
{
    $error = ERR_PARAM;
    header("Location: index.php?page=proceso_listar&id_entidad=$id_entidad&error=$error");
}
