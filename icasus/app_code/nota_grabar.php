<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: nota_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Graba las notas en la tabla usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$id_usuario = $usuario->id_usuario;

$nota = filter_input(INPUT_POST, 'notas', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

$usuario->mis_notas = $nota;
if ($usuario->save())
{
    $aviso = MSG_GUARDAR_OK;
    header("location:index.php?page=nota_mostrar&aviso=$aviso");
}
else
{
    $error = ERR_GUARDAR;
    header("location:index.php?page=nota_mostrar&error=$error");
}

