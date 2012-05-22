<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: tarea_actualizar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Actualiza los datos de un tarea
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
	//fecha fin 
	$fday = sanitize($_POST['fiDay'],2);
	$fmonth = sanitize($_POST['fiMonth'],2);
	$fyear = sanitize($_POST['fiYear'],2);
	//ponemos la hora a 0; 
	$hour=0;
	$minutes=0;
	//adjuntamos los datos
	$tarea = new tarea();
	$tarea->load('id_tarea='.sanitize($_POST['id_tarea'],2));
	$tarea->numero = sanitize($_POST['numero'],2);
	$tarea->tarea = sanitize($_POST['tarea'],2);
	$tarea->id_usuario = sanitize($_POST['responsable'],2);
	$tarea->id_acta = sanitize($_POST['id_acta'],2);
	$tarea->adjudicacion = mktime($hour, $minutes, 0, $amonth, $aday, $ayear);
	$tarea->estimada = mktime($hour, $minutes, 0, $emonth, $eday, $eyear);
	$tarea->finalizacion = mktime($hour, $minutes, 0, $fmonth, $fday, $fyear);
	if ($tarea->save())
	{
  		$log = new log(); // registra la accion en el log
		$log->add('actualiza_tarea',$tarea->id_tarea,$id_usuario);
		include('ajax_acta.php');
		$smarty ->assign('acta',$acta);
		$smarty->display('tareas.tpl');
	}
	else
	{
		$error = 'No se ha actualizado los datos  del tarea';
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
