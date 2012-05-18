<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_datos.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra todos los parametros de un indicador y un listado de los valores introducidos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript' , array('ordenatabla','indicador_borrar','valor_borrar'));

// Comprueba que se ha especificado el indicador
if (isset($_GET['id_indicador']))
{
	// Comprueba si viene aviso o error
	if (isset($_GET['aviso']))
	{
		$smarty->assign('aviso', sanitize($_GET['aviso'],2));
	}
	if (isset($_GET['error']))
	{
		$smarty->assign('error', sanitize($_GET['error'],2));
	}

	// Prepara los datos a mostrar: indicador, valores, grafica
	$id_indicador = sanitize($_GET['id_indicador'],16); 
	$indicador = new indicador($basedatos);
	$smarty->assign('indicador', $indicador->obtener_datos($id_indicador));
	// Obtiene los valores
	$valores = $indicador->listar_valores($id_indicador);
	$smarty->assign('valores', $valores );
	// Datos de la entidad
	$entidad = new entidad($basedatos);
	$smarty->assign('entidad', $entidad->obtener_datos($indicador->datos['id_entidad']));
	$smarty->assign('_nombre_pagina', $entidad->datos['nombre']); 
	$smarty->assign('barra_indicadores',$entidad->barra_indicadores()); 
	// Dibuja la grafica
	if ($valores) 
	{
		$grafica = new grafica();
		$ruta_imagen = 'cache/indicador' . $id_indicador . '.png';
		$grafica->dibuja_indicador($ruta_imagen, $valores);
		$smarty->assign('ruta_imagen', $ruta_imagen);
	}
	$plantilla = 'indicador_datos.tpl';
}
else
{
	// Faltan parametros avisa error
	$error = "No se puede mostrar el indicador por falta de parámetros.";
	$smarty->assign('error',$error);
	$smarty->assign('_nombre_pagina' , 'Error'); 
	$plantilla = "error.tpl";
}
?>
