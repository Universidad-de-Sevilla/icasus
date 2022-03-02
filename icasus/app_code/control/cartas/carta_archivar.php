<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: cartas/carta_archivar.php
// Desarrolladores: Ramón M. Gómez (ramongomez@us.es)
//-------------------------------------------------------------------------------
// Archiva o restaura una carta de compromisos
//-------------------------------------------------------------------------------

global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad') && filter_has_var(INPUT_GET, 'id_carta') && filter_has_var(INPUT_GET, 'modulo'))
{
    $id_carta = filter_input(INPUT_GET, 'id_carta', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
    $carta = new Carta();
    $carta->load_joined("id=$id_carta");

    // Comprobamos que el usuario es responsable de este plan para permitirle archivar o restaurar
    if ($control || $usuario->id == $carta->entidad->id_responsable)
    {
        if ($modulo === 'archivar')
        {
            $carta->archivado = date("Y-m-d");
            $carta->Save();
            $exito = MSG_CARTA_ARCHIVADA . "$carta";
            header("Location: index.php?page=carta_listar&id_entidad=$id_entidad&exito=$exito");
            exit();
        }
        if ($modulo === 'restaurar')
        {
            $carta->archivado = null;
            $carta->Save();
            $exito = MSG_CARTA_RESTAURADA . "$carta";
            header("Location: index.php?page=carta_listar&id_entidad=$id_entidad&exito=$exito");
            exit();
        }
    }
}
// Parámetros incorrectos
$error = ERR_PARAM;
header("location: index.php?page=error&error=$error");