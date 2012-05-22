<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: pagina_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea una nueva pagina en icasus, en principio para la ayuda
//---------------------------------------------------------------------------------------------------

global $smarty;
global $adodb;
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
	$plantilla = 'pagina_crear.tpl';
}

?>
