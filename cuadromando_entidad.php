<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadromando_entidad.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Cuadro de mando de indicadores para una entidad determinada
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
	$indicador = new ado_indicador();
	$indicadores = $indicador->Find("id_entidad = $id_entidad ORDER BY codigo");
	// Obtiene los valores y el proceso para cada uno de los indicadores 
	foreach($indicadores as $indicador)
	{

		$indicador->obtener_valores();

		// Crea la imagen con la grafica
		if ($indicador->valores > 0) 
		{
			$grafica = new grafica(500,150);
			$indicador->ruta_imagen = 'cache/indicador' . $indicador->id_indicador . '.png';
			$grafica->dibuja_indicador($indicador->ruta_imagen, $indicador->valores);
		}

		$proceso = new proceso();
		$proceso->Load('id_proceso = ' .$indicador->id_proceso);
		$indicador->proceso = $proceso;
	}
	$smarty->assign('indicadores', $indicadores);
	$smarty->assign('barra_indicadores',$entidad->barra_indicadores()); 
	$smarty->assign('_nombre_pagina' , $entidad->datos['nombre']);
	$plantilla = 'cuadromando_entidad.tpl';
}
else
{
	$smarty->assign('error','No ha especificado la entidad cuyos indicadores desea listar.');
	$plantilla = 'error.tpl';
	$smarty->assign('_nombre_pagina' , 'Error');
}
?>
