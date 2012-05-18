<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: nombre_editar.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: edita el numero y nombre del acta para se modificado
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
	//include('ajax_acta.php');
	$smarty->display('convocatoria_editar.tpl');
}
else
{
    $error= "No tiene permiso para esta operaci&oacute;n";
    $smarty->assign('error',$error);
    $smarty->display('../error.tpl');

}
?>
