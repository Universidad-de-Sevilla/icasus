<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadro_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un cuadro de mando
//---------------------------------------------------------------------------------------------------
require_once('function/sanitize.php');
global $smarty;
global $operario;

$id_cuadro = filter_input(INPUT_GET | INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);

//if (isset($_REQUEST['id']))
if ($id_cuadro)
{
//	$id_cuadro = sanitize($_REQUEST['id'],16);
    $id_usuario = $operario->id_usuario;
    $cuadro = new Cuadro();
    $cuadro->Load("id = $id_cuadro AND id_usuario = $id_usuario");
    if ($cuadro->delete())
    {
        $aviso = MSG_CUADRO_MANDO_BORRADO;
        header("Location: index.php?page=cuadro_listar&aviso=$aviso");
    }
    else
    {
        $error = ERR_PERMISOS;
        header("Location: index.php?page=cuadro_listar&error=$error");
    }
}
else // falta id
{
    $error = ERR_PARAM;
    header("Location: index.php?page=cuadro_listar&error=$error");
}

