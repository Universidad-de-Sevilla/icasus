<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicador_datos.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra todos los parametros de un indicador y un listado de los valores introducidos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$smarty->assign('_javascript' , array('ordenatabla','indicador_borrar','valor_borrar'));

// Comprueba que se ha especificado el indicador
if (isset($_GET['id_indicador']))
{
	// Prepara los datos a mostrar: indicador, valores, grafica
	$id_indicador = sanitize($_GET['id_indicador'],16); 
	$indicador = new indicador();
  $indicador->load_joined("id = $id_indicador");
	$smarty->assign('indicador', $indicador);
	// Obtiene los valores
	//$valores = $indicador->listar_valores($id_indicador);
  $valores = false;
	$smarty->assign('valores', $valores );
	// Datos de la entidad
	$entidad = new entidad();
  $entidad->load("id = $indicador->id_entidad");
	$smarty->assign('entidad', $entidad);
	$smarty->assign('_nombre_pagina', $entidad->nombre); 
	//$smarty->assign('barra_indicadores',$entidad->barra_indicadores()); 
	// Dibuja la grafica
	if ($valores) 
	{
		$grafica = new grafica();
		$ruta_imagen = 'cache/indicador' . $id_indicador . '.png';
		$grafica->dibuja_indicador($ruta_imagen, $valores);
		$smarty->assign('ruta_imagen', $ruta_imagen);
	}
	$plantilla = 'indicador_mostrar.tpl';
}
else
{
	// Faltan parametros avisa error
	$error = "No se puede mostrar el indicador por falta de parámetros.";
	header("index.php?page=entidad_listar");
}
?>
