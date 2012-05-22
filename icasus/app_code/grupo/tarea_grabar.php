<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: tarea_grabar.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba un nuevo tarea
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
		//fecha adjudicacion       
		$aday = sanitize($_POST['adDay'],2);
		$amonth = sanitize($_POST['adMonth'],2);            
		$ayear = sanitize($_POST['adYear'],2); 
		//fecha estimada
		$eday = sanitize($_POST['esDay'],2);        
		$emonth = sanitize($_POST['esMonth'],2);    
		$eyear = sanitize($_POST['esYear'],2);     
		//ponemos la hora a 0;
		$hour=0;
		$minutes=0;
		//adjuntamos los datos
		$tarea = new tarea();
		$tarea->id_acta = sanitize($_POST['id_acta'],2);
		$tarea->numero = sanitize($_POST['numero'],2);
		$tarea->id_usuario = sanitize($_POST['responsable'],2);
		$tarea->tarea = sanitize($_POST['tarea'],2);
		$tarea->adjudicacion = mktime($hour, $minutes, 0, $amonth, $aday, $ayear);
		$tarea->estimada = mktime($hour, $minutes, 0, $emonth, $eday, $eyear);
		//grabamos los datos
		if ($tarea->save())
		{
				$log = new log(); // registra la accion en el log
				$log->add('graba_tarea',$tarea->id_tarea,$id_usuario);
				include('ajax_acta.php');
				$smarty->display('tareas.tpl');
		}
		else
		{		
				$error = 'No se ha grabado el tarea';
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
