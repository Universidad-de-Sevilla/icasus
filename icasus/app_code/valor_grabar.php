<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: valor_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba en la base de dato el nuevo valor con los datos que vienen del formulario 
//---------------------------------------------------------------------------------------------------

global $smarty;
global $operario;
global $plantilla;

// Comprueba si vienen los datos necesarios para grabar un nuevo valor
if (isset($_REQUEST['id_indicador']) && isset($_REQUEST['id_entidad']) 
	&& isset($_POST['dato_valor']) && isset($_POST['id_entidad'])
	&& isset($_POST['Date_Month']) && isset($_POST['Date_Year']))
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
	$id_indicador = sanitize($_REQUEST['id_indicador'],16);
	$year = sanitize($_POST['Date_Year'],2);
	$month = sanitize($_POST['Date_Month'],2);
	// Fijamos el día, si fuera variable sería: $day = sanitize($_POST['Date_Day'],2);
	$day = 28;
	$valor = new ado_valor();
	if (isset($_POST['id_valor']))
	{
		$id_valor = sanitize($_POST['id_valor'], 32);
		$valor->load("id_valor = $id_valor");
	}
	$valor->id_indicador = $id_indicador;
	$valor->valor = sanitize($_POST['dato_valor'], 32);
	$valor->objetivo = isset($_POST['objetivo'])?sanitize($_POST['objetivo'],32):0;
	$valor->objetivo_carta = isset($_POST['objetivo_carta'])?sanitize($_POST['objetivo_carta'],32):0;
	$valor->objetivo_estrategico = isset($_POST['objetivo_estrategico'])?sanitize($_POST['objetivo_estrategico'],32):0;
	$valor->calculo = isset($_POST['calculo'])?$_POST['calculo']:null;
	$valor->observaciones = isset($_POST['observaciones'])?$_POST['observaciones']:null;
	$valor->fecha_recogida = mktime(0, 0, 0, $month, $day, $year);
	$valor->fecha_entrada = time();
	$valor->id_usuario = $operario->id_usuario;
	//print_r($valor);
	if ($valor->save()) 
	{
		// Se ha grabado bien, reenviamos al indicador
		$log = new Log(); // registra la accion en el log
		$log->add('nuevo valor', $id_indicador,$operario->id_usuario);	
		$aviso = 'El valor se ha grabado correctamente.';
		header("Location: index.php?page=indicador_datos&id_indicador=$id_indicador&id_entidad=$id_entidad&aviso=$aviso");
	}
	else
	{
		$error = 'Se ha producido un error, no se ha grabado el valor'; 
		header("Location: index.php?page=indicador_datos&id_indicador=$id_indicador&id_entidad=$id_entidad&error=$error");
	}
}
else // error: faltan datos 
{
	$smarty->assign('error', 'Faltan parámetros para realizar esta acción.'); 
	$smarty->assign('_nombre_pagina','Error');
	$plantilla = 'error.tpl';
}
?>
