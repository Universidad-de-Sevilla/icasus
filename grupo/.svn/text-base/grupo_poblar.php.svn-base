<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: grupo_poblar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra un listado de usuarios para ser asignados a una unidad
//---------------------------------------------------------------------------------------------------

require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript' , array('ordenatabla'));

$id_entidad = sanitize($_REQUEST['id_entidad'],16);
$entidad = new entidad($basedatos);
$smarty->assign('entidad',$entidad->obtener_datos($id_entidad));
$smarty->assign('_nombre_pagina' , $entidad->datos['nombre']);
// Si vienen datos del formulario asignamos los usuarios marcados a la entidad
if (isset($_POST['id_rol']) && isset($_POST['id_usuario']))
{
	$id_rol = sanitize($_POST['id_rol'],16);
	$plantilla = 'grupo/grupo_datos.tpl';
	$contador = 0;
	foreach ($_POST['id_usuario'] as $id_usuario)
	{
		$id_usuario = sanitize($id_usuario,16);
		if ($entidad->asignar_usuario($id_entidad,$id_usuario,$id_rol))
		{
			$log = new log(); // registra la accion en el log
			$log->add('poblar equipo',$id_entidad,$operario->id_usuario);
			$contador ++;
		}
	}
	$smarty->assign('usuarios',$entidad->listar_usuarios($id_entidad));
	$smarty->assign('aviso',"Se han agregado $contador usuarios al grupo");	
}
// Si no vienen datos en el POST mostramos el formulario
else
{ 
	if (isset($_REQUEST['criterio']))
	{		
		$criterio = sanitize($_REQUEST['criterio'],2);
		$smarty->assign('criterio', $criterio);
		$where = " WHERE nombre LIKE '%$criterio%' OR apellidos LIKE '%$criterio%' 
			OR correo LIKE '%$criterio%' OR login LIKE '%$criterio%' ";
	}
	else
	{
		// Si no se ha buscado nada listamos todos
		$where = " WHERE 1 = 1 ";
	}
	$usuario = new usuario($basedatos);
	$smarty->assign('lista_usuarios',$usuario->listar($where));
	$smarty->assign('roles',$entidad->listar_roles());
	$plantilla = 'grupo/grupo_poblar.tpl';
}
?>
