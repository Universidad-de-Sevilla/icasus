<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: entidad_despoblar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra un listado de usuarios de la unidad para ser desasignados de ella
//---------------------------------------------------------------------------------------------------

require_once('function/sanitize.php');
global $javascript;
global $smarty;
global $basedatos;
global $nombre_pagina;
global $plantilla;

$javascript = array('ordenatabla');

// Si vienen datos del formulario asignamos los usuarios marcados a la entidad
if (isset($_POST['id_entidad']))
{
	$id_entidad = sanitize($_POST['id_entidad'],16);
	$entidad = new entidad($basedatos);
	$contador = 0;
	foreach ($_POST['id_usuario'] as $id_usuario)
	{
		$id_usuario = sanitize($id_usuario,16);
		$entidad->desasignar_usuario($id_entidad,$id_usuario);
		$log = new log(); // registra la accion en el log
		$log->add('despoblar equipo',$id_entidad,$operario->id_usuario);
		$contador ++;
	}
	$smarty->assign('aviso',"Se han eliminado $contador usuarios de la entidad");	
	$smarty->assign('entidad',$entidad->obtener_datos($id_entidad));
	$smarty->assign('usuarios',$entidad->listar_usuarios($id_entidad));
	$nombre_pagina = $entidad->datos['nombre'];
	$plantilla = 'grupo/grupo_datos.tpl';
}
else if (isset($_GET['id_entidad']))
{ 
	$id_entidad = sanitize($_GET['id_entidad'],16);
	$entidad = new entidad($basedatos);
	$usuarios = $entidad->listar_usuarios($id_entidad);
	$smarty->assign('usuarios',$usuarios);
	$smarty->assign('entidad',$entidad->obtener_datos($id_entidad));
	$smarty->assign('_nombre_pagina', $entidad->datos['nombre']);
	$plantilla = 'grupo/grupo_despoblar.tpl';
}
else 
{
	$error = "Faltan parámetros para mostrar esta página";
	$smarty->assign('error',$error);
	$nombre_pagina = 'Error';
	$plantilla = "error.tpl";
}
?>
