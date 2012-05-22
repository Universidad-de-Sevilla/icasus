<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_listar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de indicadores para una entidad determinada
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript' , array('ordenatabla','indicador_borrar'));

if ($_GET['id_entidad'] >= '0')
{	
	$id_entidad = sanitize($_GET["id_entidad"],16);
	$entidad = new entidad($basedatos);
	$smarty->assign('entidad', $entidad->obtener_datos($id_entidad));
	$smarty->assign('indicadores',$entidad->listar_indicadores()); 
	$smarty->assign('barra_indicadores',$entidad->barra_indicadores()); 
	$plantilla = 'indicador_listar.tpl';
	$smarty->assign('_nombre_pagina' , $entidad->datos['nombre']);
}
else
{
	$smarty->assign('error','No ha especificado la entidad cuyos indicadores desea listar.');
	$plantilla = 'error.tpl';
	$smarty->assign('_nombre_pagina' , 'Error');
}
?>
