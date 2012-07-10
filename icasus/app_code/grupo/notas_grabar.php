<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: notas_grabar.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba un nuevo tarea
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
	$acta = new acta();
	$acta->load('id_acta = '.$id_acta);
	$acta->descripcion = utf8_decode(sanitize($_POST['nota'],2));
	//grabamos los datos
	if ($acta->save())
	{
		//include('ajax_acta.php');
		$aviso = "Actualizas las notas";
		$smarty->assign('aviso',$aviso);
		$smarty->assign('acta',$acta);
		$smarty->display('notas.tpl');
	}
	else
	{
		$error = 'No se ha grabado la nota';
		$smarty->assign('error',$error);
		$smarty->display('../error.tpl');
	}
}
else
{
    $error= "No tiene permiso para esta operaci&oacute;n";
    $smarty->assign('error',$error);
    $smarty->display('../error.tpl');
}
?>
