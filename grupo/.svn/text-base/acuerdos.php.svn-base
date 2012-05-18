<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: asuntos.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra los asuntos elegidos para este acta
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
	$smarty->display('acuerdos.tpl');
}
else
{
    $error= "No tiene permiso para esta operaci&oacute;n";
    $smarty->assign('error',$error);
    $smarty->display('../error.tpl');
}
?>
