<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadro_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un cuadro de mando
//---------------------------------------------------------------------------------------------------

global $smarty;
global $_usuario;

if (filter_has_var(INPUT_GET, 'id_cuadro'))
{
    $id_cuadro = filter_input(INPUT_GET, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
    $id_usuario = $_usuario->id_usuario;
    $cuadro = new Cuadro();
    $cuadro->load("id = $id_cuadro");
    $panel = new Panel();
    $paneles_cuadro = $panel->Find("id_cuadro=$id_cuadro");
    if (!$paneles_cuadro)
    {
        $exito = MSG_CUADRO_MANDO_BORRADO . " " . $cuadro->nombre;
        $cuadro->delete();
        header("Location: index.php?page=cuadro_listar&exito=$exito");
    }
    else
    {
        $aviso = MSG_CUADRO_MANDO_BORRAR;
        header("Location: index.php?page=cuadro_listar&aviso=$aviso");
    }
}
else
{
    $error = ERR_PARAM;
    header("Location: index.php?page=cuadro_listar&error=$error");
}
