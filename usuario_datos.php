<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: usuario_datos.php
// Tipo: Controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra los datos de un usuario y las entidades a las que pertenece
//---------------------------------------------------------------------------------------------------
require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;
global $operario;

$smarty->assign('_javascript', array('ordenatabla'));

if ($_GET['id_usuario'])
{
	$id_usuario = sanitize($_GET['id_usuario'],16);
	$usuario = new usuario($basedatos);

	//Recupera los datos del usuario
	$smarty->assign('usuario', $usuario->obtener_datos($id_usuario));
	$smarty->assign('entidades', $usuario->obtener_entidades($id_usuario));
	//Esto es para autorizar
	$smarty->assign('id_operario', $operario->id_usuario);

	$nombre_pagina = $usuario->datos['nombre'] . ' ' . $usuario->datos['apellidos'];
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
