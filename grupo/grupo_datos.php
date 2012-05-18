<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: grupo_datos.php
// Tipo: Controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra los datos de un grupo y los usuarios que tiene
//---------------------------------------------------------------------------------------------------

include_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;
global $operario;

$smarty->assign('_javascript' , array('ordenatabla'));
session_start();
$_SESSION['id_entidad'] = $_REQUEST['id_entidad'];

if ($_REQUEST['id_entidad'])
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],2);
	$entidad = new entidad($basedatos);
	//Obtener datos de la entidad y sus usuarios
	$smarty->assign('entidad' , $entidad->obtener_datos($id_entidad));
	$smarty->assign('usuarios' , $entidad->listar_usuarios($id_entidad));
	//relacionar las actas de esta entidad o grupo de trabajo
	$acta = new acta();
	$actas = $acta->find('id_entidad='.$id_entidad);
	$smarty->assign('actas',$actas);
	//plantilla y otras informaciones a mostra en la pagina
	$smarty->assign('_nombre_pagina' ,$entidad->datos['nombre']);
	$plantilla = "grupo/grupo_datos.tpl";
}
else
{
	$error = "No se puede mostrar el equipo por falta de parámetros.";
	$smarty->assign('error',$error);
	$smarty->assign('_nombre_pagina' , 'Error');
	$plantilla = "error.tpl";
}
?>
