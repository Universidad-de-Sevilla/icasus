<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: acuerdo_grabar.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba un nuevo acuerdo nuevo
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
	//$numero = $_POST['numero'];
	//$acuerdo = $_POST['acuerdo'];
	$acuerdo = new acuerdo();
	$acuerdo->id_acta = sanitize($_POST['id_acta'],2);
	$acuerdo->numero = sanitize($_POST['numero'],2);
	$acuerdo->acuerdo = sanitize($_POST['acuerdo'],2);
	if ($grabacion = $acuerdo->save())
	{
		$log = new log(); // registra la accion en el log
	    $log->add('graba_acuerdo',$acuerdo->id_acuerdo,$id_usuario);
		include('ajax_acta.php');
		$smarty->display('acuerdos.tpl');
	}
	else
	{
		$error = 'No se ha grabado el acuerdo';
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
