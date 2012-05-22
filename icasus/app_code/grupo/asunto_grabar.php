<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: asunto_grabar.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba un nuevo asunto
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
	$asunto = new asunto();
	$asunto->id_acta = sanitize($_POST['id_acta'],2);
	$asunto->numero = sanitize($_POST['numero'],2);
	$asunto->asunto = sanitize($_POST['asunto'],2);
	if ($grabacion = $asunto->save())
	{
		$log = new log(); // registra la accion en el log
		$log->add('graba_asunto',$asunto->id_asunto,$id_usuario);
		include('ajax_acta.php');
		$smarty->display('asuntos.tpl');
	}
	else
	{
		$error = 'No se ha grabado el Asunto';
		$smarty -> assign('error',$error);
		$smarty->display('error.tpl');
	}	
}
else
{
    $error= "No tiene permiso para esta operaci&oacute;n";
    $smarty->assign('error',$error);
    $smarty->display('../error.tpl');
}
?>
