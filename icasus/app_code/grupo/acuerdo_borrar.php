<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: acuerdo_borrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borrar acuerdos
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
	$id_acuerdo = sanitize($_POST['id_acuerdo'],2);
	$acuerdo = new acuerdo();
	$borrar = $acuerdo->borrar('id_acuerdo='.$id_acuerdo);
	if ($borrar == true )
	{	
  		$log = new log(); // registra la accion en el log
		$log->add('borrar_acuerdo',$id_acuerdo,$id_usuario);
		include('ajax_acta.php');
		$smarty->display('acuerdos.tpl');
	}
	else
	{
		$error = 'No se ha borrado el acuerdo';
		$smarty -> assign('error',$error);
		$plantilla = 'error.tpl';
	}
}
else
{
    $error= "No tiene permiso para esta operaci&oacute;n";
    $smarty->assign('error',$error);
    $smarty->display('../error.tpl');
}
?>
