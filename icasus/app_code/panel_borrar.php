<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra paneles 
//---------------------------------------------------------------------------------------------------
$id_usuario = $usuario->id;
$id_panel = sanitize($_REQUEST["id_panel"],INT);
if (!empty($id_panel))
{
	$panel = new Panel();
	if($panel->permiso_panel($id_usuario,$id_panel))
	{
		$panel->borrar_panel("id = $id_panel");
	}
	else
	{
			//escribir error de permiso en log
	}
}
else
{
	echo ERR_PARAM;
}	

