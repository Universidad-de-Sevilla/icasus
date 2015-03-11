<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un dato
//---------------------------------------------------------------------------------------------------
global $usuario;

if (filter_has_var(INPUT_GET, 'id_dato') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_dato = filter_input(INPUT_GET, 'id_dato', FILTER_SANITIZE_NUMBER_INT);
    $dato = new Indicador();
    $dato->load_joined("id = $id_dato");
    // Comprobamos que el usuario es responsable de este indicador para permitirle borrar
    if ($usuario->id == $dato->id_responsable OR $usuario->id == $dato->id_responsable_medicion)
    {
        $medicion = new Medicion();
        $mediciones = $medicion->Find("id_indicador = $id_dato");
        if ($mediciones)
        {
            $error = ERR_DATO_BORRAR_MED;
            header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
        }
        else
        {
            $dato->delete();
            $aviso = MSG_DATO_BORRADO . "$dato->nombre";
            header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&aviso=$aviso");
        }
    }
    else
    {
        $error = ERR_DATO_BORRAR_NO_AUT;
        header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
    }
}
else
{ // falta id_dato o id_entidad
    $error = ERR_PARAM;
    header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
}

