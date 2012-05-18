<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadromando_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un cuadro de mando
//---------------------------------------------------------------------------------------------------
require_once('function/sanitize.php');
global $smarty;
global $operario;

if (isset($_REQUEST['id']))
{
	$id_cuadromando = sanitize($_REQUEST['id'],16);
	$id_usuario = $operario->id_usuario;
	$cuadromando = new cuadromando();
	$cuadromando->Load("id = $id_cuadromando AND id_usuario = $id_usuario");
	if ($cuadromando->delete())
	{
		$aviso = "Se ha eliminado un cuadro de mando";
		header("Location: index.php?page=cuadromando_listar&aviso=$aviso");
	}
	else
	{
		$error = "No tiene permiso para realizar esta acción";
		header("Location: index.php?page=cuadromando_listar&error=$error");
	}
}
else // falta id
{
	$error = 'Faltan parámetros para realizar esta acción.'; 
	header("Location: index.php?page=cuadromando_listar&error=$error");
}
?>
