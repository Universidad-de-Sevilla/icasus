<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: acuerdo_actualizar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Actualiza los datos de un acuerdo
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
	$acuerdo = new acuerdo();
	$acuerdo->load('id_acuerdo='.sanitize($_POST['id_acuerdo'],2));
	$acuerdo->numero = sanitize($_POST['numero'],2);
	$acuerdo->acuerdo = sanitize($_POST['acuerdo'],2);
	if ($acuerdo->save())
	{
		$log = new log(); // registra la accion en el log
	    $log->add('actualiza_acuerdo',$acuerdo->id_acuerdo,$id_usuario);
		include('ajax_acta.php');
		$smarty ->assign('acta',$acta);
		$smarty->display('acuerdos.tpl');
	}	
}
else
{
 	$error = 'No se ha actualizado los datos  del acuerdo';
  	$smarty -> assign('error',$error); 
  	$smarty->display('../error.tpl');
} 
?>
