<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: nombre.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra el numero y nombre del acta. Permite su edición.
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
	include('ajax_acta.php');
	$smarty->display('nombre.tpl');
}
else
{
	$error= "No tiene permiso para esta operaci&oacute;n";
	$smarty->assign('error',$error);
	$smarty->display('../error.tpl');
}
?>
