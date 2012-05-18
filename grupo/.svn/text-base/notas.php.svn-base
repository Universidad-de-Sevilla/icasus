<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: nombre.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra el numero y nombre del acta. Permite su edición.
//---------------------------------------------------------------------------------------------------
include('ajax.php');
//include('ajax_acta.php');
//$smarty->assign('acta',$acta);
if ($permiso->_saved == 1)
{
$smarty->display('notas.tpl');
}
else
{
    $error= "No tiene permiso para esta operaci&oacute;n";
    $smarty->assign('error',$error);
    $smarty->display('../error.tpl');
}
?>
