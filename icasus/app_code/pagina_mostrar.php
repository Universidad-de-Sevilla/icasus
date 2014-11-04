<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: pagina_mostrar.php
//---------------------------------------------------------------------------------------------------
// Muestra una pagina de ayuda
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (isset($_REQUEST['alias']) OR isset($_REQUEST['id_pagina'])) 
{
	$alias = isset($_REQUEST['alias'])?sanitize($_REQUEST['alias'],SQL):'';
	$id_pagina = isset($_REQUEST['id_pagina'])?sanitize($_REQUEST['id_pagina'],INT):0;
}
else
{
	// Mostramos la página índicia
	$alias = 'indice';
	$id_pagina = 0;
}
$pagina = new Pagina();
$pagina->load("alias = '$alias' OR id=$id_pagina");
$smarty->assign('pagina',$pagina);
$smarty->assign('_nombre_pagina','Ayuda: '.$pagina->titulo);
$plantilla = 'pagina_mostrar.tpl';
?>
