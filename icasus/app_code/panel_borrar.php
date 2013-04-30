<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra paneles 
//---------------------------------------------------------------------------------------------------
$id_panel = sanitize($_REQUEST["id_panel"],INT);
$panel = new panel();
if ($panel->borrar_panel("id = $id_panel"))
{
	echo 'hola';
}
else
{
	//escribir error de borrado en log
}

?>
