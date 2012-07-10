<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: grupo_editar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edición de equipos existentes
//---------------------------------------------------------------------------------------------------

require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript' , array('entidad_validar','ordenatabla'));

$id_entidad = sanitize($_REQUEST['id_entidad'],16);
$entidad = new entidad($basedatos);
$smarty->assign('entidad',$entidad->obtener_datos($id_entidad));
$smarty->assign('usuarios' , $entidad->listar_usuarios($id_entidad));
$smarty->assign('_nombre_pagina' , $entidad->datos['nombre']);

// Si vienen todos los datos necesarios del formulario grabamos
if (isset($_POST['nombre']) and isset($_POST['codigo']) and isset($_POST['id_padre']))
{
	$nombre = $_POST['nombre'];
	$id_padre = sanitize($_POST['id_padre'],16);
	$objeto = $_POST['objeto']?sanitize($_POST['objeto'],2):'';
	$frecuencia = $_POST['frecuencia']?sanitize($_POST['frecuencia'],2):'';
	$codigo = $_POST['codigo']?sanitize($_POST['codigo'],2):'';
	if ($entidad->editar($id_entidad,$id_padre,$nombre,$web,$codigo,$objeto,$frecuencia))
	{
		$smarty->assign('entidad',$entidad->obtener_datos($id_entidad));
		$smarty->assign('aviso' , 'El grupo se ha modificado con los datos que aparecen a continuación');
	}
	else
	{
		$smarty->assign('error', 'No se ha podido modificar el equipo');
	}
	$plantilla = "grupo/grupo_datos.tpl";
}
// Si no vienen datos mostramos el formulario
else
{
	$entidades = $entidad->listar(' WHERE LENGTH(codigo) = 4 ');
	$smarty->assign('entidades',$entidades);
	$plantilla = 'grupo/grupo_editar.tpl';
}
?>

