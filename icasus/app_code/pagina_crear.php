<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: pagina_crear.php
//---------------------------------------------------------------------------------------------------
// Crea una nueva pagina en icasus, en principio para la ayuda
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;

if (isset($_POST['alias']) && isset($_POST['titulo']) && isset($_POST['contenido'])) 
{
	// Guardamos los datos que vienen del formulario
	$pagina = new pagina();
	$pagina->alias = $pagina->alieniza($_POST['alias']);
	$pagina->titulo = $_POST['titulo'];
	$pagina->contenido = $_POST['contenido'];
	$pagina->modified = time();
	$pagina->save();
	$smarty->assign('pagina',$pagina);
	$smarty->assign('_nombre_pagina', 'Manual: ' . $pagina->titulo);
	$smarty->assign('aviso', 'La página se ha creado correctamente');
	$plantilla = 'pagina_mostrar.tpl';
}
else
{
	// Mostramos el formulario
	$smarty->assign('_nombre_pagina', 'Nueva página de ayuda');
	$plantilla = 'pagina_crear.tpl';
}

?>
