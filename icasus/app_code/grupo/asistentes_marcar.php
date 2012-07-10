<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: asistentes_marcar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba si asiste o no a la sesision del acta
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso)  
{	
	//asegura variables
	$id_usuario = sanitize($_POST["id_usuario"],2);
	$asistencia = sanitize($_POST['asistencia'],2);
	//comprobamos si tenemos el usuario de la entidad ya en la tabla
	//si existe lo actualizamos y si no lo insertamos.
	$asistente = new asistente();
	$asistente->load('id_acta = '.$id_acta.' AND id_usuario ='.$id_usuario);
	if ($asistente->_saved == 1)
	{
		$asistente->asistencia=$asistencia;
	}
	else
	{
		$asistente->id_usuario = $id_usuario;
		$asistente->id_acta = $id_acta;
		$asistente->asistencia = $asistencia;
	}
	if ($asistente->save())
	{
	$smarty->display('grupo/nombre.tpl');
	}
	else
	{
		$error = 'No se ha marcado la asitencia';
		$smarty -> assign('error',$error); 
		$smarty->display('../error.tpl');
	}
}
else
{
	$error = 'No tiene permiso para realizar esta operacion.';
	$smarty->assign('error',$error); 
	$smarty->display('../error.tpl');
}
?>
