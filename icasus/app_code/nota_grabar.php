<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: nota_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba las notas en la tabla usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$id_usuario = $usuario->id_usuario;
//$nota=sanitize($_POST['notas'],2);
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

