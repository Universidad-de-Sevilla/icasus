<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadro_historico.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Cuadro de mando histórico de indicadores para una entidad determinada
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
	header('Location:index.php');	
}

if ($_GET['id_entidad'] >= '0')
{	
	$id_entidad = sanitize($_GET["id_entidad"],16);
	$inicio = 1;
	$fin = 1;

	$entidad = new entidad($basedatos);
	$smarty->assign('entidad', $entidad->obtener_datos($id_entidad));
	// Obtiene un array de indicadores de esta entidad: id y nombre
	$indicador = new indi();
	$indicadores = $indicador->Find("id_entidad = $id_entidad");
	// Obtiene los valores para cada uno de los indicadores 
	foreach($indicadores as $indicador)
	{
		$indicador->obtener_valores();
	}
	//print_r($indicadores);
	$smarty->assign('indicadores', $indicadores);
	$plantilla = 'cuadro_historico.tpl';
	$smarty->assign('_nombre_pagina' , $entidad->datos['nombre']);
}
else
{
	$smarty->assign('error','No ha especificado la entidad cuyos indicadores desea listar.');
	$plantilla = 'error.tpl';
	$smarty->assign('_nombre_pagina' , 'Error');
}
?>
