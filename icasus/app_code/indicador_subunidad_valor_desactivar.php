<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_listar.php
//---------------------------------------------------------------------------------------------------
// Muestra un listado de las mediciones establecidas para un indicador
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

$id_indicador = sanitize($_REQUEST["id_indicador"], INT);
$id_entidad = sanitize($_REQUEST["id_entidad"], INT);
if(isset($id_indicador))
{
	$usuario_entidad = new usuario_entidad();
	if ($usuario_entidad->load("id_usuario=$usuario->id and id_entidad=$id_entidad and (id_rol=1 or id_rol=2)"))
	{	
		$indicador = new indicador();
		$indicador->load("id = $id_indicador");
		$smarty->assign('indicador', $indicador);

		$entidad = new entidad();
		$entidad->load("id = $indicador->id_entidad");
		$smarty->assign('entidad', $entidad);

		//devuelve el literal del año de cada medicion para los <th> de la tabla
		$medicion= new medicion();
		$year = $medicion->find_year_mediciones($id_indicador);
		$smarty->assign('years',$year);

		$mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
		$smarty->assign('mediciones',$mediciones);

		$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador,$entidad->id);
		$smarty->assign('subunidades_mediciones',$subunidades_mediciones);
//print_r($subunidades_mediciones);
		$smarty->assign('_nombre_pagina', "Valores de las subunidades para: $indicador->nombre");
		$plantilla = 'indicador_subunidad_valor.tpl';
	}
	else
	{
		// El usuario no tiene permisos avisamos error
		$error = 'No tiene permisos suficientes para editar indicadores de esta unidad';
		header("Location:index.php?page=indicador_mostrar&id_indicador=$id_indicador&error=$error");
	}
}
else
{
  $error = "Faltan parámetros para mostrar las subunidades y los valores";
  header("location:index.php?page=entidad_listar&error=$error");
}
//print_r($subunidades_mediciones);
?>
