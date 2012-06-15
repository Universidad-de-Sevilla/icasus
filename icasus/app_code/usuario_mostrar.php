<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: usuario_mostrar.php
//---------------------------------------------------------------------------------------------------
// Muestra los datos de un usuario y las entidades a las que pertenece
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;
global $usuario;

if ($_REQUEST['id_usuario'])
{
	$id_usuario = sanitize($_REQUEST['id_usuario'],INT);
	$persona = new usuario();

	$smarty->assign('persona', $persona->load_joined("id = $id_usuario"));

	$nombre_pagina = $persona->datos['nombre'] . ' ' . $usuario->datos['apellidos'];
	$smarty->assign('_nombre_pagina', $nombre_pagina);
	$plantilla = "usuario_datos.tpl";
}
else
{
	$error = "No se puede mostrar el usuario por falta de parámetros.";
	$smarty->assign('error', $error);
	$smarty->assign('_nombre_pagina', 'Error');
	$plantilla = "error.tpl";
}
?>
