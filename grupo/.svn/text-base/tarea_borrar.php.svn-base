<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: tarea_borrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borrar tareas
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
		$id_tarea = sanitize($_POST['id_tarea'],2);
		$tarea = new tarea();
		$borrar = $tarea->borrar('id_tarea='.$id_tarea);
		if ($borrar == true )
		{		
  		$log = new log(); // registra la accion en el log
		$log->add('borrar_tarea',$id_tarea,$id_usuario);
			include('ajax_acta.php');
			$smarty->display('tareas.tpl');
		}
		else
		{
				$error = 'No se ha borrado el tarea';
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
