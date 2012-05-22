<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://forja.rediris.es/projects/icasus/)
// Archivo: indicador_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba los datos de un indicador nuevo o existente
//---------------------------------------------------------------------------------------------------

global $basedatos;
global $smarty;
global $plantilla;

if (isset($_POST["codigo"]) AND isset($_POST["nombre"]) AND isset($_POST["descripcion"]) AND isset($_POST["formulacion"]) 
	AND isset($_POST["fuente"]) AND isset($_POST["periodicidad"])AND isset($_POST["objetivo"]) AND isset($_POST["id_proceso"]))
{
	$indicador = new ado_indicador();
	if (isset($_POST['id_indicador']))
	{
		$id = sanitize($_POST['id_indicador'],16);
		$indicador->load("id_indicador = $id");
	}
	// Si venían los datos necesarios los desinfectamos y grabamos el indicador
	$indicador->id_proceso = sanitize($_POST["id_proceso"],16);
	$indicador->codigo = sanitize($_POST["codigo"],2);
	$indicador->nombre = sanitize($_POST["nombre"],2);
	$indicador->umbral = sanitize($_POST["umbral"],2);
	$indicador->objetivo = sanitize($_POST["objetivo"],32);
	$indicador->descripcion = sanitize($_POST["descripcion"],2);
	$indicador->id_dimension = isset($_POST['id_dimension'])?sanitize($_POST["id_dimension"],16):0;
	$indicador->objetivo_carta_servicio = isset($_POST['objetivo_carta_servicio'])?sanitize($_POST["objetivo_carta_servicio"],32):0;
	$indicador->objetivo_estrategico = isset($_POST['objetivo_estrategico'])?sanitize($_POST["objetivo_estrategico"],32):0;
	$indicador->formulacion = sanitize($_POST["formulacion"],2);
	$indicador->fuente = sanitize($_POST["fuente"],2);
	$indicador->periodicidad = sanitize($_POST["periodicidad"],2);
	$indicador->id_responsable = sanitize($_POST["id_responsable"],16);

	if ($correcto = $indicador->save())
	{
		header("Location: index.php?page=indicador_datos&id=$indicador->id");
	}
	else
	{
		$smarty->assign('error',$indicador->ErrorMsg());
		$smarty->assign('_nombre_pagina' , 'Error');
		$plantilla = 'error.tpl';
	}
}
else
{
	// Avisamos de error por falta de parametros
	$error = 'Faltan parámetros necesarios para cargar esta página';
	$smarty->assign('error',$error);
	$plantilla = 'error.tpl';
}
?>
