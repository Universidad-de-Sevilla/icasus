<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: pagina_editar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edita una pagina existente, en principio para la ayuda
//---------------------------------------------------------------------------------------------------

global $smarty;
global $adodb;
global $plantilla;

if (isset($_REQUEST['id_pagina'])) 
{
	$pagina = new pagina();
	if (isset($_POST['titulo']) && isset($_POST['alias']) && isset($_POST['contenido']))
	{
		$id = sanitize($_REQUEST['id_pagina'],16);
		$pagina->load("id=$id");
		$pagina->titulo = $_POST['titulo'];
		$pagina->alias = $pagina->alieniza($_POST['alias']);
		$pagina->contenido = $_POST['contenido'];
		$pagina->modified = time();
		$pagina->save();
		$smarty->assign('aviso','La página se ha modificado correctamente');
		$plantilla = 'pagina_mostrar.tpl';
	}
	else
	{
		$id_pagina = sanitize($_REQUEST['id_pagina'],16);
		$pagina->load("id=$id_pagina");
		$plantilla = 'pagina_editar.tpl';
	}
	$smarty->assign('pagina',$pagina);
	$smarty->assign('_nombre_pagina','Manual: ' . $pagina->titulo);
}
else
{
	// Si no vienen datos suficientes en el post ni el get lanzamos error
	$smarty->assign('error' , 'Faltan datos para editar pagina');
	$plantilla = 'error.tpl';
}
?>
