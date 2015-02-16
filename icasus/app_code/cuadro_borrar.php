<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadro_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un cuadro de mando
//---------------------------------------------------------------------------------------------------

global $smarty;
global $_usuario;

//if (isset($_REQUEST['id']))
if (filter_has_var(INPUT_GET, 'id_cuadro'))
{
//	$id_cuadro = sanitize($_REQUEST['id'],16);
    $id_cuadro = filter_input(INPUT_GET, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
    $id_usuario = $_usuario->id_usuario;
    $cuadro = new Cuadro();
//    $cuadro->Load("id = $id_cuadro AND id_usuario = $id_usuario");
    $cuadro->load("id = $id_cuadro");
    $panel = new Panel();
    $paneles_cuadro = $panel->Find("id_cuadro=$id_cuadro");
    if (!$paneles_cuadro)
    {
        $aviso = MSG_CUADRO_MANDO_BORRADO." ".$cuadro->nombre;
        $cuadro->delete();
        header("Location: index.php?page=cuadro_listar&aviso=$aviso");
    }
    else
    {
        $error = ERR_CUAD_MANDO_BORRAR;
        header("Location: index.php?page=cuadro_listar&error=$error");
    }
}
else // falta id
{
    $error = ERR_PARAM;
    header("Location: index.php?page=cuadro_listar&error=$error");
}

