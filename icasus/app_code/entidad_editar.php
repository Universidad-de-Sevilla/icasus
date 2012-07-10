<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: entidad_editar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edición de entidades existentes
//---------------------------------------------------------------------------------------------------

//require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;

$id_entidad = sanitize($_REQUEST['id_entidad'],16);
$entidad = new entidad();
 
$entidad->load_joined("id = $id_entidad");
$smarty->assign('entidad',$entidad);

$smarty->assign('_nombre_pagina' , $entidad->nombre);

// Si vienen todos los datos necesarios del formulario grabamos
if (isset($_POST['nombre']) and isset($_POST['codigo']) and isset($_POST['id_padre']))
{
	$nombre = $_POST['nombre'];
	$id_padre = sanitize($_POST['id_padre'],16);
	$web = $_POST['web']?sanitize($_POST['web'],2):'';
	$codigo = $_POST['codigo']?sanitize($_POST['codigo'],2):'';
	if ($entidad->actualizar($id_entidad,$id_padre,$nombre,$web,$codigo))
	{
		$smarty->assign('entidad',$entidad);
		$smarty->assign('aviso' , 'La entidad se ha modificado con los datos que aparecen a continuación');
	}
	else
	{
		$smarty->assign('error', 'No se ha podido modificar la entidad');
	}
	$plantilla = "entidad_datos.tpl";
	header("location:index.php?page=entidad_datos&id_entidad=$entidad->id");
}
// Si no vienen datos mostramos el formulario
else
{
	$entidades = $entidad->find('id_madre = 1');
	//$entidades = $entidad->find(' WHERE LENGTH(codigo) = 4 ');
	$smarty->assign('entidades',$entidades);
	$plantilla = 'entidad_editar.tpl';
}
?>

