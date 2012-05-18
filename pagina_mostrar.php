<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: pagina_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra una pagina de ayuda
//---------------------------------------------------------------------------------------------------

global $smarty;
global $adodb;
global $plantilla;

if (isset($_REQUEST['alias']) || isset($_REQUEST['id_pagina'])) 
{
	$alias = isset($_REQUEST['alias'])?sanitize($_REQUEST['alias'],2):'';
	$id_pagina = isset($_REQUEST['id_pagina'])?sanitize($_REQUEST['id_pagina'],16):0;
}
else
{
	// Mostramos el formulario
	$alias = 'indice';
	$id_pagina = 0;
}
$pagina = new pagina();
$pagina->load("alias = '$alias' OR id=$id_pagina");
$smarty->assign('pagina',$pagina);
$smarty->assign('_nombre_pagina','Manual: '.$pagina->titulo);
$plantilla = 'pagina_mostrar.tpl';
?>
