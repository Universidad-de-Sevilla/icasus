<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: valor_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Prepara los datos del formulario que permite agregar un nuevo valor a un indicador 
//---------------------------------------------------------------------------------------------------

global $smarty;
global $operario;
global $plantilla;
$smarty->assign('_javascript' , array('valor_validar','calcular'));

if (isset($_REQUEST['id_indicador']) && isset($_REQUEST['id_entidad']) )
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
	$id_indicador = sanitize($_REQUEST['id_indicador'],16);
	$indicador = new ado_indicador();
	$indicador->load("id_indicador=$id_indicador");
	$smarty->assign('indicador', $indicador);
	$smarty->assign('_nombre_pagina', $indicador->nombre);
	$plantilla = 'valor_crear.tpl';
}
else // falta id_indicador o id_entidad
{
	$smarty->assign('error', 'Faltan parámetros para realizar esta acción.'); 
	$smarty->assign('_nombre_pagina','Error');
	$plantilla = 'error.tpl';
}
?>
