<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: entidad_datos.php
// Tipo: Controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra los datos de una entidad y los usuarios que tiene
//---------------------------------------------------------------------------------------------------

include_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;
global $operario;

$smarty->assign('_javascript' , array('ordenatabla'));

if ($_REQUEST['id_entidad'])
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],2);
	$subentidad = new ado_entidad();
	$subentidades = $subentidad->Find("id_padre = $id_entidad ORDER by codigo");
	$entidad = new entidad($basedatos);
	$smarty->assign('subentidades', $subentidades);
	$smarty->assign('entidad' , $entidad->obtener_datos($id_entidad));
	$smarty->assign('usuarios' , $entidad->listar_usuarios($id_entidad));
	$smarty->assign('barra_indicadores',$entidad->barra_indicadores()); 
	$smarty->assign('_nombre_pagina' , 'Unidad: ' . $entidad->datos['nombre']);
	$plantilla = "entidad_datos.tpl";
}
else
{
	$error = "No se puede mostrar la entidad por falta de parámetros.";
	$smarty->assign('error',$error);
	$smarty->assign('_nombre_pagina' , 'Error');
	$plantilla = "error.tpl";
}
?>
