<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicadores_subentidades.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado de indicadores para las subentidades de una entidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript' , array('ordenatabla'));

if ($_GET['id_entidad'] >= '0')
{	
	$id_entidad = sanitize($_GET["id_entidad"],16);
	$entidad = new Entidad($basedatos);
	$smarty->assign('entidad', $entidad->obtener_datos($id_entidad));
    $indicadores = $entidad->indicadores_subentidad($id_entidad); 
	$smarty->assign('indicadores', $indicadores);
	$plantilla = 'informes/indicadores_subentidad.tpl';
	$smarty->assign('_nombre_pagina' , $entidad->datos['nombre']);
}
else
{
	$smarty->assign('error','No ha especificado la entidad cuyos indicadores desea listar.');
	$plantilla = 'error.tpl';
	$smarty->assign('_nombre_pagina' , 'Error');
}
?>
