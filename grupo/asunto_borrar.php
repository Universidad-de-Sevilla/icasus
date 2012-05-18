<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: asunto_borrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borrar asuntos
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
	$id_asunto = sanitize($_POST['id_asunto'],2);
	$asunto = new asunto();
	$borrar = $asunto->borrar('id_asunto='.$id_asunto);
	if ($borrar == true )
	{	
  		$log = new log(); // registra la accion en el log
		$log->add('borrar_asunto',$id_asunto,$id_usuario);
		include('ajax_acta.php');
		$smarty->display('asuntos.tpl');
	}
	else
	{
		$error = 'No se ha borrado el asunto';
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
