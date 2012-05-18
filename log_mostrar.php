<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: log_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra los eventos registrados en el sistema recientemente
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
	header('Location:index.php?page=log_mostrar');	
}

$id_usuario = $_SESSION['usuario']->id_usuario;
$log = new log();
$logs = $log->Find_joined("true ORDER BY fecha desc");
$smarty->assign('logs',$logs);

$plantilla = 'log_mostrar.tpl';
$smarty->assign('_nombre_pagina' , 'Registro de eventos');
?>

