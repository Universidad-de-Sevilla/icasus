<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: acuerdo_editar.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra el formulario con los datos del acuerdo para su modificacion
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
	$acuerdo = new acuerdo();
	$acuerdo->load('id_acuerdo = '.sanitize($_POST['id_acuerdo'],2));
	$smarty->assign('acuerdo',$acuerdo);
	$smarty->display('acuerdo_editar.tpl');
}
else
{
    $error= "No tiene permiso para esta operaci&oacute;n";
    $smarty->assign('error',$error);
    $smarty->display('../error.tpl');
}
?>
