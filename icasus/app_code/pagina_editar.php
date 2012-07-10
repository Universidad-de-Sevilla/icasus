<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: pagina_editar.php
//---------------------------------------------------------------------------------------------------
// Edita una pagina existente, en principio para la ayuda
//---------------------------------------------------------------------------------------------------
global $smarty;
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
	$smarty->assign('_nombre_pagina','Ayuda: ' . $pagina->titulo);
}
else
{
	// Si no vienen datos suficientes en el post ni el get lanzamos error
	$error = "Faltan datos para editar una pagina";
  header("location:index.php?page=error&error=$error");
}
?>
