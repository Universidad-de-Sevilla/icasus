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
	$valor = $acuerdo->ultimo_acuerdo($id_acta);
	$smarty->assign('ultimo',$valor);
	$smarty->display('acuerdo_crear.tpl');
}
else
{
    $error= "No tiene permiso para esta operaci&oacute;n";
    $smarty->assign('error',$error);
    $smarty->display('../error.tpl');
}
?>
