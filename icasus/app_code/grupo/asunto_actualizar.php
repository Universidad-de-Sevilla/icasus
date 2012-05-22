<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: asunto_actualizar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Actualiza los datos de un asunto
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
		$asunto = new asunto();
		$asunto->load('id_asunto='.sanitize($_POST['id_asunto'],2));
		$asunto->numero = sanitize($_POST['numero'],2);
		$asunto->asunto = sanitize($_POST['asunto'],2);
		if ($asunto->save())
		{
				$log = new log(); // registra la accion en el log
		        $log->add('actualiza_asunto',$asunto->id_asunto,$id_usuario);
				include('ajax_acta.php');
				$smarty ->assign('acta',$acta);
				$smarty->display('asuntos.tpl');
		}
		else
		{
				$error = 'No se ha actualizado los datos  del Asunto';
				$smarty -> assign('error',$error); 
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
