<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: tarea_editar.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra el formulario con los datos del tarea para su modificacion
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
	$tarea = new tarea();
	$tarea->load('id_tarea = '.sanitize($_POST['id_tarea'],2));
	$smarty->assign('tarea',$tarea);
	$smarty->display('tarea_editar.tpl');
}
else
{
    $error= "No tiene permiso para esta operaci&oacute;n";
    $smarty->assign('error',$error);
    $smarty->display('../error.tpl');
}
?>
