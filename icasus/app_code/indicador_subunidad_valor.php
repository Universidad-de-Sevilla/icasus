<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicador_subunidad_valor.php
//---------------------------------------------------------------------------------------------------
// Muestra una tabla con todas las mediciones de un indicador y sus valores, para poder editarlos
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

$id_entidad = sanitize($_REQUEST["id_entidad"], INT);

if (isset($_REQUEST["id_indicador"]))
{
  $id_indicador = sanitize($_REQUEST["id_indicador"], INT);
  $tipo = "indicador";
}
else if (isset($_REQUEST["id_dato"]))
{
  $id_indicador = sanitize($_REQUEST["id_dato"], INT);
  $tipo = "dato";
}
else
{
  $error = "Faltan parámetros para mostrar la lista de mediciones";
  header("location:index.php?page=entidad_listar&error=$error");
}

if(isset($id_entidad))
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

		$medicion= new medicion();
		$years = $medicion->find_year_mediciones($id_indicador);
		$smarty->assign('years',$years);

		$mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
		$smarty->assign('mediciones',$mediciones);

		$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador,$entidad->id);
		$smarty->assign('subunidades_mediciones',$subunidades_mediciones);

    $smarty->assign("tipo", $tipo);
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
?>
