<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://forja.rediris.es/projects/icasus/)
// Archivo: dimension_editar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edición de nuevas dimensiones
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

if (isset($_REQUEST['id']))
{	
	$id_dimension = sanitize($_REQUEST['id'],16);
	$dimension = new dimension();
	$dimension->load("id = $id_dimension");

	// Si vienen los datos necesarios del formulario grabamos
	if (isset($_POST['nombre']))
	{
		$dimension->nombre = sanitize($_POST['nombre'],2);
		//$dimension->codigo = sanitize($_POST['codigo'],2);
		$adodb->execute("SET NAMES utf8");
		$dimension->save();
		$smarty->assign('aviso' , 'Se ha modificado una dimensi&oacute;n.');

		// Array de dimensiones que pasamos a la vista para ver las existentes
		$dimensiones = $dimension->find('1 = 1 ORDER BY nombre');
		$smarty->assign('dimensiones', $dimensiones);
		$plantilla = "dimension_crear.tpl";
		$smarty->assign('_nombre_pagina','Relaci&oacuten de dimensiones');
	}
	else
	{
		$smarty->assign('dimension',$dimension);
		$smarty->assign('_nombre_pagina','Edici&oacute;n de dimensiones');
		$plantilla = "dimension_editar.tpl";
	}
}
else
{
	$smarty->assign('error','Faltan parámetros');
	$plantilla = "error.tpl";
}
?>
