<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: nombre_grabar.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba los datos editados
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
	//include('ajax_acta.php');
	//datos del acta
	$lugar  = sanitize($_POST['lugar'],2);
	//fecha
	$day = sanitize($_POST['dia'],2);
	$month = sanitize($_POST['mes'],2);
	$year = sanitize($_POST['ano'],2);
	//hora
	$hour = sanitize($_POST['hora'],2);
	$minutes = sanitize($_POST['minuto'],2);
	//datos
	$acta ->lugar = sanitize($_POST['lugar'],2);
	$acta ->fecha = mktime($hour, $minutes, 0, $month, $day, $year);
	//graba los datos
	$acta ->save();
	if ($acta->save())
	{
		$smarty->display('convocatoria.tpl');
	}
	else
	{
		$error = 'No se ha grabado la convocatoria';
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

